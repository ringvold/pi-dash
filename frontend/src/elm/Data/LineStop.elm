module Data.LineStop exposing (Departures, LineStop, StopId, decodeStops)

import Data.Direction exposing (Direction, decodeDirection)
import Data.VehicleArrivalTime exposing (VehicleArrivalTime)
import Json.Decode as Decode
import RemoteData exposing (WebData)


type alias Departures =
    List VehicleArrivalTime


type alias StopId =
    Int


type alias LineStop =
    { name : String
    , id : String
    , direction : Direction
    , departures : WebData Departures
    }


decodeStops : Decode.Decoder (List LineStop)
decodeStops =
    Decode.list
        (Decode.map4 LineStop
            (Decode.field "name" Decode.string)
            (Decode.field "id" Decode.string)
            (Decode.field "direction" Decode.int |> Decode.andThen decodeDirection)
            (Decode.succeed RemoteData.NotAsked)
        )
