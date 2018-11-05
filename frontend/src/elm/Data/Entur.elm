module Data.Entur exposing (Response, StopPlace, query)

import EnturApi.Object as EO
import EnturApi.Object.DestinationDisplay as EOD
import EnturApi.Object.EstimatedCall as EOE
import EnturApi.Object.StopPlace as EOS
import EnturApi.Query
import EnturApi.Scalar exposing (DateTime(..), Id(..))
import Graphql.Field as Field exposing (Field)
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet, with)
import Iso8601
import Time exposing (Posix)


type alias Response =
    { data : Maybe StopPlace }


type alias StopPlace =
    { id : String
    , name : String
    , estimatedCalls : List (Maybe EstimatedCall)
    }


type alias EstimatedCall =
    { expectedDepartureTime : Maybe Posix
    , destinationDisplay : Maybe DestinationDisplay
    }


type alias DestinationDisplay =
    { frontText : Maybe String }


query : String -> SelectionSet Response RootQuery
query id =
    EnturApi.Query.selection Response
        |> with
            (EnturApi.Query.stopPlace { id = id }
                stopPlaceSelection
            )


stopPlaceSelection : SelectionSet StopPlace EO.StopPlace
stopPlaceSelection =
    EOS.selection StopPlace
        |> with (EOS.id |> Field.map scalarIdToString)
        |> with EOS.name
        |> with estimatedCalls



-- EstimatedCall


estimatedCalls : Field (List (Maybe EstimatedCall)) EO.StopPlace
estimatedCalls =
    EOS.estimatedCalls identity estimatedCallSelection


estimatedCallSelection : SelectionSet EstimatedCall EO.EstimatedCall
estimatedCallSelection =
    EOE.selection EstimatedCall
        |> with (EOE.expectedDepartureTime |> Field.map mapDateTime)
        |> with (EOE.destinationDisplay destinationDisplaySelection)



-- DestinationDisplay


destinationDisplaySelection =
    EOD.selection DestinationDisplay
        |> with EOD.frontText



-- Helpers


scalarIdToString : EnturApi.Scalar.Id -> String
scalarIdToString scalarId =
    case scalarId of
        Id id ->
            id


mapDateTime : Maybe EnturApi.Scalar.DateTime -> Maybe Posix
mapDateTime datetime =
    datetime
        |> Maybe.map
            (\(DateTime value) ->
                Iso8601.toTime value
                    |> Debug.log "time"
                    |> Result.toMaybe
            )
        |> Maybe.withDefault Nothing