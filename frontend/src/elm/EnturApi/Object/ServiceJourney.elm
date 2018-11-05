-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module EnturApi.Object.ServiceJourney exposing (EstimatedCallsOptionalArguments, activeDates, bikesAllowed, bookingArrangements, directionType, estimatedCalls, flexibleServiceType, id, journeyPattern, keyValues, line, linePublicCode, notices, operator, passingTimes, pointsOnLink, privateCode, publicCode, quays, selection, serviceAlteration, situations, transportSubmode, wheelchairAccessible)

import EnturApi.Enum.BikesAllowed
import EnturApi.Enum.DirectionType
import EnturApi.Enum.FlexibleServiceType
import EnturApi.Enum.ServiceAlteration
import EnturApi.Enum.TransportSubmode
import EnturApi.Enum.WheelchairBoarding
import EnturApi.InputObject
import EnturApi.Interface
import EnturApi.Object
import EnturApi.Scalar
import EnturApi.Union
import Graphql.Field as Field exposing (Field)
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) EnturApi.Object.ServiceJourney
selection constructor =
    Object.selection constructor


id : Field EnturApi.Scalar.Id EnturApi.Object.ServiceJourney
id =
    Object.fieldDecoder "id" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.Id)


line : SelectionSet decodesTo EnturApi.Object.Line -> Field decodesTo EnturApi.Object.ServiceJourney
line object_ =
    Object.selectionField "line" [] object_ identity


activeDates : Field (List (Maybe EnturApi.Scalar.Date)) EnturApi.Object.ServiceJourney
activeDates =
    Object.fieldDecoder "activeDates" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.Date |> Decode.nullable |> Decode.list)


{-| Whether journey is as planned, a cancellation or an extra journey. Default is as planned
-}
serviceAlteration : Field (Maybe EnturApi.Enum.ServiceAlteration.ServiceAlteration) EnturApi.Object.ServiceJourney
serviceAlteration =
    Object.fieldDecoder "serviceAlteration" [] (EnturApi.Enum.ServiceAlteration.decoder |> Decode.nullable)


{-| The transport submode of the journey, if different from lines transport submode.
-}
transportSubmode : Field (Maybe EnturApi.Enum.TransportSubmode.TransportSubmode) EnturApi.Object.ServiceJourney
transportSubmode =
    Object.fieldDecoder "transportSubmode" [] (EnturApi.Enum.TransportSubmode.decoder |> Decode.nullable)


{-| Publicly announced code for service journey, differentiating it from other service journeys for the same line.
-}
publicCode : Field (Maybe String) EnturApi.Object.ServiceJourney
publicCode =
    Object.fieldDecoder "publicCode" [] (Decode.string |> Decode.nullable)


{-| For internal use by operators.
-}
privateCode : Field (Maybe String) EnturApi.Object.ServiceJourney
privateCode =
    Object.fieldDecoder "privateCode" [] (Decode.string |> Decode.nullable)


{-| Publicly announced code for line, differentiating it from other lines for the same operator.
-}
linePublicCode : Field (Maybe String) EnturApi.Object.ServiceJourney
linePublicCode =
    Object.fieldDecoder "linePublicCode" [] (Decode.string |> Decode.nullable)


operator : SelectionSet decodesTo EnturApi.Object.Operator -> Field (Maybe decodesTo) EnturApi.Object.ServiceJourney
operator object_ =
    Object.selectionField "operator" [] object_ (identity >> Decode.nullable)


directionType : Field (Maybe EnturApi.Enum.DirectionType.DirectionType) EnturApi.Object.ServiceJourney
directionType =
    Object.fieldDecoder "directionType" [] (EnturApi.Enum.DirectionType.decoder |> Decode.nullable)


{-| Whether service journey is accessible with wheelchair.
-}
wheelchairAccessible : Field (Maybe EnturApi.Enum.WheelchairBoarding.WheelchairBoarding) EnturApi.Object.ServiceJourney
wheelchairAccessible =
    Object.fieldDecoder "wheelchairAccessible" [] (EnturApi.Enum.WheelchairBoarding.decoder |> Decode.nullable)


{-| Whether bikes are allowed on service journey.
-}
bikesAllowed : Field (Maybe EnturApi.Enum.BikesAllowed.BikesAllowed) EnturApi.Object.ServiceJourney
bikesAllowed =
    Object.fieldDecoder "bikesAllowed" [] (EnturApi.Enum.BikesAllowed.decoder |> Decode.nullable)


journeyPattern : SelectionSet decodesTo EnturApi.Object.JourneyPattern -> Field (Maybe decodesTo) EnturApi.Object.ServiceJourney
journeyPattern object_ =
    Object.selectionField "journeyPattern" [] object_ (identity >> Decode.nullable)


{-| Quays visited by service journey
-}
quays : SelectionSet decodesTo EnturApi.Object.Quay -> Field (List decodesTo) EnturApi.Object.ServiceJourney
quays object_ =
    Object.selectionField "quays" [] object_ (identity >> Decode.list)


{-| Returns scheduled passing times only - without realtime-updates, for realtime-data use 'estimatedCalls'
-}
passingTimes : SelectionSet decodesTo EnturApi.Object.TimetabledPassingTime -> Field (List (Maybe decodesTo)) EnturApi.Object.ServiceJourney
passingTimes object_ =
    Object.selectionField "passingTimes" [] object_ (identity >> Decode.nullable >> Decode.list)


type alias EstimatedCallsOptionalArguments =
    { date : OptionalArgument EnturApi.Scalar.Date }


{-| Returns scheduled passingTimes for this ServiceJourney for a given date, updated with realtime-updates (if available). NB! This takes a date as argument (default=today) and returns estimatedCalls for that date and should only be used if the date is known when creating the request. For fetching estimatedCalls for a given trip.leg, use leg.serviceJourneyEstimatedCalls instead.

  - date - Date to get estimated calls for. Defaults to today.

-}
estimatedCalls : (EstimatedCallsOptionalArguments -> EstimatedCallsOptionalArguments) -> SelectionSet decodesTo EnturApi.Object.EstimatedCall -> Field (Maybe (List (Maybe decodesTo))) EnturApi.Object.ServiceJourney
estimatedCalls fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { date = Absent }

        optionalArgs =
            [ Argument.optional "date" filledInOptionals.date (\(EnturApi.Scalar.Date raw) -> Encode.string raw) ]
                |> List.filterMap identity
    in
    Object.selectionField "estimatedCalls" optionalArgs object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| Detailed path travelled by service journey.
-}
pointsOnLink : SelectionSet decodesTo EnturApi.Object.PointsOnLink -> Field (Maybe decodesTo) EnturApi.Object.ServiceJourney
pointsOnLink object_ =
    Object.selectionField "pointsOnLink" [] object_ (identity >> Decode.nullable)


notices : SelectionSet decodesTo EnturApi.Object.Notice -> Field (List (Maybe decodesTo)) EnturApi.Object.ServiceJourney
notices object_ =
    Object.selectionField "notices" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| Get all situations active for the service journey
-}
situations : SelectionSet decodesTo EnturApi.Object.PtSituationElement -> Field (List (Maybe decodesTo)) EnturApi.Object.ServiceJourney
situations object_ =
    Object.selectionField "situations" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| List of keyValue pairs for the service journey.
-}
keyValues : SelectionSet decodesTo EnturApi.Object.KeyValue -> Field (Maybe (List (Maybe decodesTo))) EnturApi.Object.ServiceJourney
keyValues object_ =
    Object.selectionField "keyValues" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| Type of flexible service, or null if service is not flexible.
-}
flexibleServiceType : Field (Maybe EnturApi.Enum.FlexibleServiceType.FlexibleServiceType) EnturApi.Object.ServiceJourney
flexibleServiceType =
    Object.fieldDecoder "flexibleServiceType" [] (EnturApi.Enum.FlexibleServiceType.decoder |> Decode.nullable)


{-| Booking arrangements for flexible services.
-}
bookingArrangements : SelectionSet decodesTo EnturApi.Object.BookingArrangement -> Field (Maybe decodesTo) EnturApi.Object.ServiceJourney
bookingArrangements object_ =
    Object.selectionField "bookingArrangements" [] object_ (identity >> Decode.nullable)