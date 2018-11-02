-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Entur.Object.StopPlace exposing (EstimatedCallsOptionalArguments, QuaysOptionalArguments, adjacentSites, description, estimatedCalls, id, latitude, longitude, name, parent, quays, selection, tariffZones, timezone, transportMode, transportSubmode, weighting, wheelchairBoarding)

import Entur.Enum.InterchangeWeighting
import Entur.Enum.TransportMode
import Entur.Enum.TransportSubmode
import Entur.Enum.WheelchairBoarding
import Entur.InputObject
import Entur.Interface
import Entur.Object
import Entur.Scalar
import Entur.Union
import Graphql.Field as Field exposing (Field)
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Entur.Object.StopPlace
selection constructor =
    Object.selection constructor


id : Field Entur.Scalar.Id Entur.Object.StopPlace
id =
    Object.fieldDecoder "id" [] (Object.scalarDecoder |> Decode.map Entur.Scalar.Id)


name : Field String Entur.Object.StopPlace
name =
    Object.fieldDecoder "name" [] Decode.string


latitude : Field (Maybe Float) Entur.Object.StopPlace
latitude =
    Object.fieldDecoder "latitude" [] (Decode.float |> Decode.nullable)


longitude : Field (Maybe Float) Entur.Object.StopPlace
longitude =
    Object.fieldDecoder "longitude" [] (Decode.float |> Decode.nullable)


description : Field (Maybe String) Entur.Object.StopPlace
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.nullable)


{-| Whether this stop place is suitable for wheelchair boarding.
-}
wheelchairBoarding : Field (Maybe Entur.Enum.WheelchairBoarding.WheelchairBoarding) Entur.Object.StopPlace
wheelchairBoarding =
    Object.fieldDecoder "wheelchairBoarding" [] (Entur.Enum.WheelchairBoarding.decoder |> Decode.nullable)


{-| Relative weighting of this stop with regards to interchanges.
-}
weighting : Field (Maybe Entur.Enum.InterchangeWeighting.InterchangeWeighting) Entur.Object.StopPlace
weighting =
    Object.fieldDecoder "weighting" [] (Entur.Enum.InterchangeWeighting.decoder |> Decode.nullable)


tariffZones : SelectionSet decodesTo Entur.Object.TariffZone -> Field (List (Maybe decodesTo)) Entur.Object.StopPlace
tariffZones object_ =
    Object.selectionField "tariffZones" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| The transport mode serviced by this stop place.
-}
transportMode : Field (Maybe Entur.Enum.TransportMode.TransportMode) Entur.Object.StopPlace
transportMode =
    Object.fieldDecoder "transportMode" [] (Entur.Enum.TransportMode.decoder |> Decode.nullable)


{-| The transport submode serviced by this stop place.
-}
transportSubmode : Field (Maybe Entur.Enum.TransportSubmode.TransportSubmode) Entur.Object.StopPlace
transportSubmode =
    Object.fieldDecoder "transportSubmode" [] (Entur.Enum.TransportSubmode.decoder |> Decode.nullable)


{-| This stop place's adjacent sites
-}
adjacentSites : Field (Maybe (List (Maybe String))) Entur.Object.StopPlace
adjacentSites =
    Object.fieldDecoder "adjacentSites" [] (Decode.string |> Decode.nullable |> Decode.list |> Decode.nullable)


timezone : Field String Entur.Object.StopPlace
timezone =
    Object.fieldDecoder "timezone" [] Decode.string


type alias QuaysOptionalArguments =
    { filterByInUse : OptionalArgument Bool }


{-| Returns all quays that are children of this stop place

  - filterByInUse - If true only quays with at least one visiting line are included.

-}
quays : (QuaysOptionalArguments -> QuaysOptionalArguments) -> SelectionSet decodesTo Entur.Object.Quay -> Field (Maybe (List (Maybe decodesTo))) Entur.Object.StopPlace
quays fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { filterByInUse = Absent }

        optionalArgs =
            [ Argument.optional "filterByInUse" filledInOptionals.filterByInUse Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionField "quays" optionalArgs object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| Returns parent stop for this stop
-}
parent : SelectionSet decodesTo Entur.Object.StopPlace -> Field (Maybe decodesTo) Entur.Object.StopPlace
parent object_ =
    Object.selectionField "parent" [] object_ (identity >> Decode.nullable)


type alias EstimatedCallsOptionalArguments =
    { startTime : OptionalArgument Entur.Scalar.DateTime, timeRange : OptionalArgument Int, numberOfDepartures : OptionalArgument Int, numberOfDeparturesPerLineAndDestinationDisplay : OptionalArgument Int, omitNonBoarding : OptionalArgument Bool, whiteListed : OptionalArgument Entur.InputObject.InputWhiteListed }


{-| List of visits to this stop place as part of vehicle journeys.

  - startTime - DateTime for when to fetch estimated calls from. Default value is current time
  - numberOfDepartures - Limit the total number of departures returned.
  - numberOfDeparturesPerLineAndDestinationDisplay - Limit the number of departures per line and destination display returned. The parameter is only applied when the value is between 1 and 'numberOfDepartures'.
  - whiteListed - Parameters for indicating the only authorities and/or lines or quays to list estimatedCalls for

-}
estimatedCalls : (EstimatedCallsOptionalArguments -> EstimatedCallsOptionalArguments) -> SelectionSet decodesTo Entur.Object.EstimatedCall -> Field (List (Maybe decodesTo)) Entur.Object.StopPlace
estimatedCalls fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { startTime = Absent, timeRange = Absent, numberOfDepartures = Absent, numberOfDeparturesPerLineAndDestinationDisplay = Absent, omitNonBoarding = Absent, whiteListed = Absent }

        optionalArgs =
            [ Argument.optional "startTime" filledInOptionals.startTime (\(Entur.Scalar.DateTime raw) -> Encode.string raw), Argument.optional "timeRange" filledInOptionals.timeRange Encode.int, Argument.optional "numberOfDepartures" filledInOptionals.numberOfDepartures Encode.int, Argument.optional "numberOfDeparturesPerLineAndDestinationDisplay" filledInOptionals.numberOfDeparturesPerLineAndDestinationDisplay Encode.int, Argument.optional "omitNonBoarding" filledInOptionals.omitNonBoarding Encode.bool, Argument.optional "whiteListed" filledInOptionals.whiteListed Entur.InputObject.encodeInputWhiteListed ]
                |> List.filterMap identity
    in
    Object.selectionField "estimatedCalls" optionalArgs object_ (identity >> Decode.nullable >> Decode.list)
