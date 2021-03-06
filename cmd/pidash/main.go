package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"log"
	"net/http"
	"reflect"

	"github.com/gorilla/mux"
	"github.com/markbates/refresh/refresh/web"
	"github.com/rakyll/statik/fs"
	"github.com/spf13/viper"

	_ "github.com/ringvold/pidash/statik"
	"github.com/ringvold/pidash/yr"
	"github.com/ringvold/pidash"
)

var stops []pidash.Line

func main() {

	viperSetup()

	stops = getStopsFromConfig()
	weatherUrl := viper.GetString("weatherUrl")

	port := viper.Get("port")
	log.Printf("Starting server. Watch http://localhost:%v", port)

	statikFS, _ := fs.New()
	router := mux.NewRouter()

	router.HandleFunc("/ruter/selectedStops", selectedStopsHandler(stops))

	router.HandleFunc("/weather/forecast", yrHandler(weatherUrl))

	router.Handle("/{name:.*}", http.FileServer(statikFS))

	http.ListenAndServe(fmt.Sprintf(":%v", port), web.ErrorChecker(router))
}


func yrHandler(url string) func(http.ResponseWriter, *http.Request) {
	return http.HandlerFunc(func(rw http.ResponseWriter, r *http.Request) {
		data, err := yr.GetForecast(url)
		dataJson, err := json.MarshalIndent(data, "", "  ")
		if err != nil {
			panic(err)
			return
		}
		rw.Header().Set("Access-Control-Allow-Origin", "*")
		rw.Write(dataJson)
	})
}

func selectedStopsHandler(stops []pidash.Line) func(http.ResponseWriter, *http.Request) {
	return http.HandlerFunc(func(rw http.ResponseWriter, r *http.Request) {
		dataJson, err := json.MarshalIndent(stops, "", "  ")
		if err != nil {
			panic(err)
			return
		}
		rw.Header().Set("Access-Control-Allow-Origin", "*")
		rw.Write(dataJson)
	})
}

func viperSetup() {
	viper.SetConfigName("pidash")
	viper.AddConfigPath("$HOME")
	viper.AddConfigPath(".")
	viper.AutomaticEnv()
	viper.SetEnvPrefix("pi_dash")

	viper.SetDefault("port", "8081")

	err := viper.ReadInConfig() // Find and read the config file
	if err != nil {             // Handle errors reading the config file
		log.Printf("Error reading config file: %s \n", err)
	}

	// Actually make this work when passing stops to the HandleFunc

	// viper.WatchConfig()

	// viper.OnConfigChange(func(in fsnotify.Event) {
	// 	fmt.Println("Reloading config")
	// 	stops = getStopsFromConfig()
	// })
}

func getStopsFromConfig() []pidash.Line {
	config := viper.Get("lines")

	var lines []pidash.Line

	if config != nil {

		switch reflect.TypeOf(config).Kind() {
		case reflect.Slice:
			s := reflect.ValueOf(config)
			var (
				id   string
				name string
				quay string
				ok   bool
			)

			for i := 0; i < s.Len(); i++ {

				l := s.Index(i)
				// fmt.Println(l)
				switch m := l.Interface().(type) {

				// YAML
				case map[interface{}]interface{}:
					err := errors.New("Error parsing config: Line id must be an string")
					id, ok = m["id"].(string)
					if !ok {
						intId, ok := m["id"].(int)
						id = fmt.Sprintf("%v", intId)
						if !ok {
							panic(err)
						}
					}
					err = errors.New("Error parsing config: Line name must be string")
					name, ok = m["name"].(string)
					if !ok {
						panic(err)
					}
					err = errors.New("Error parsing config: Quay ID must be string")
					quay, ok = m["quay"].(string)
					if !ok {
						panic(err)
					}
					lines = append(lines, pidash.Line{Id: id, Name: name, Quay: quay})

				// JSON
				case map[string]interface{}:
					err := errors.New("Error parsing config: Line  id must be an int")
					if !ok {
						intId, ok := m["id"].(int)
						id = fmt.Sprintf("%v", intId)
						if !ok {
							panic(err)
						}
					}
					err = errors.New("Error parsing config: Line name must be string")
					name, ok = m["name"].(string)
					if !ok {
						panic(err)
					}
					err = errors.New("Error parsing config: Line direction must be string")
					quay, ok = m["quay"].(string)
					if !ok {
						panic(err)
					}
					lines = append(lines, pidash.Line{Id: id, Name: name, Quay: quay})

				}

			}
			log.Println("Loaded lines from config:", lines)
		}
	}
	return lines
}
