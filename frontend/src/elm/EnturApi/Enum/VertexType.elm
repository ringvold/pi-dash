-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module EnturApi.Enum.VertexType exposing (VertexType(..), decoder, toString)

import Json.Decode as Decode exposing (Decoder)


type VertexType
    = Normal
    | Transit
    | BikePark
    | BikeShare
    | ParkAndRide


decoder : Decoder VertexType
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "normal" ->
                        Decode.succeed Normal

                    "transit" ->
                        Decode.succeed Transit

                    "bikePark" ->
                        Decode.succeed BikePark

                    "bikeShare" ->
                        Decode.succeed BikeShare

                    "parkAndRide" ->
                        Decode.succeed ParkAndRide

                    _ ->
                        Decode.fail ("Invalid VertexType type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : VertexType -> String
toString enum =
    case enum of
        Normal ->
            "normal"

        Transit ->
            "transit"

        BikePark ->
            "bikePark"

        BikeShare ->
            "bikeShare"

        ParkAndRide ->
            "parkAndRide"
