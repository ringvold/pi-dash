-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module EnturApi.Object.EstimatedCall exposing (actualArrivalTime, actualDepartureTime, aimedArrival, aimedArrivalTime, aimedDeparture, aimedDepartureTime, bookingArrangements, cancellation, date, destinationDisplay, expectedArrival, expectedArrivalTime, expectedDeparture, expectedDepartureTime, forAlighting, forBoarding, notices, quay, realtime, realtimeState, requestStop, selection, serviceJourney, situations, timingPoint)

import EnturApi.Enum.RealtimeState
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) EnturApi.Object.EstimatedCall
selection constructor =
    Object.selection constructor


quay : SelectionSet decodesTo EnturApi.Object.Quay -> Field (Maybe decodesTo) EnturApi.Object.EstimatedCall
quay object_ =
    Object.selectionField "quay" [] object_ (identity >> Decode.nullable)


{-| Scheduled time of arrival at quay. Not affected by read time updated
-}
aimedArrivalTime : Field (Maybe EnturApi.Scalar.DateTime) EnturApi.Object.EstimatedCall
aimedArrivalTime =
    Object.fieldDecoder "aimedArrivalTime" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.DateTime |> Decode.nullable)


{-| Expected time of arrival at quay. Updated with real time information if available. Will be null if an actualArrivalTime exists
-}
expectedArrivalTime : Field (Maybe EnturApi.Scalar.DateTime) EnturApi.Object.EstimatedCall
expectedArrivalTime =
    Object.fieldDecoder "expectedArrivalTime" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.DateTime |> Decode.nullable)


{-| Actual time of arrival at quay. Updated from real time information if available
-}
actualArrivalTime : Field (Maybe EnturApi.Scalar.DateTime) EnturApi.Object.EstimatedCall
actualArrivalTime =
    Object.fieldDecoder "actualArrivalTime" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.DateTime |> Decode.nullable)


{-| Scheduled time of departure from quay. Not affected by read time updated
-}
aimedDepartureTime : Field (Maybe EnturApi.Scalar.DateTime) EnturApi.Object.EstimatedCall
aimedDepartureTime =
    Object.fieldDecoder "aimedDepartureTime" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.DateTime |> Decode.nullable)


{-| Expected time of departure from quay. Updated with real time information if available. Will be null if an actualDepartureTime exists
-}
expectedDepartureTime : Field (Maybe EnturApi.Scalar.DateTime) EnturApi.Object.EstimatedCall
expectedDepartureTime =
    Object.fieldDecoder "expectedDepartureTime" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.DateTime |> Decode.nullable)


{-| Actual time of departure from quay. Updated with real time information if available
-}
actualDepartureTime : Field (Maybe EnturApi.Scalar.DateTime) EnturApi.Object.EstimatedCall
actualDepartureTime =
    Object.fieldDecoder "actualDepartureTime" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.DateTime |> Decode.nullable)


{-| Scheduled time of arrival at quay. Not affected by read time updated
-}
aimedArrival : SelectionSet decodesTo EnturApi.Object.TimeAndDayOffset -> Field (Maybe decodesTo) EnturApi.Object.EstimatedCall
aimedArrival object_ =
    Object.selectionField "aimedArrival" [] object_ (identity >> Decode.nullable)


{-| Expected time of arrival at quay. Updated with real time information if available
-}
expectedArrival : SelectionSet decodesTo EnturApi.Object.TimeAndDayOffset -> Field (Maybe decodesTo) EnturApi.Object.EstimatedCall
expectedArrival object_ =
    Object.selectionField "expectedArrival" [] object_ (identity >> Decode.nullable)


{-| Scheduled time of departure from quay. Not affected by read time updated
-}
aimedDeparture : SelectionSet decodesTo EnturApi.Object.TimeAndDayOffset -> Field (Maybe decodesTo) EnturApi.Object.EstimatedCall
aimedDeparture object_ =
    Object.selectionField "aimedDeparture" [] object_ (identity >> Decode.nullable)


{-| Expected time of departure from quay. Updated with real time information if available
-}
expectedDeparture : SelectionSet decodesTo EnturApi.Object.TimeAndDayOffset -> Field (Maybe decodesTo) EnturApi.Object.EstimatedCall
expectedDeparture object_ =
    Object.selectionField "expectedDeparture" [] object_ (identity >> Decode.nullable)


{-| Whether this is a timing point or not. Boarding and alighting is not allowed at timing points.
-}
timingPoint : Field (Maybe Bool) EnturApi.Object.EstimatedCall
timingPoint =
    Object.fieldDecoder "timingPoint" [] (Decode.bool |> Decode.nullable)


{-| Whether this call has been updated with real time information.
-}
realtime : Field (Maybe Bool) EnturApi.Object.EstimatedCall
realtime =
    Object.fieldDecoder "realtime" [] (Decode.bool |> Decode.nullable)


realtimeState : Field (Maybe EnturApi.Enum.RealtimeState.RealtimeState) EnturApi.Object.EstimatedCall
realtimeState =
    Object.fieldDecoder "realtimeState" [] (EnturApi.Enum.RealtimeState.decoder |> Decode.nullable)


{-| Whether vehicle may be borded at quay.
-}
forBoarding : Field (Maybe Bool) EnturApi.Object.EstimatedCall
forBoarding =
    Object.fieldDecoder "forBoarding" [] (Decode.bool |> Decode.nullable)


{-| Whether vehicle may be alighted at quay.
-}
forAlighting : Field (Maybe Bool) EnturApi.Object.EstimatedCall
forAlighting =
    Object.fieldDecoder "forAlighting" [] (Decode.bool |> Decode.nullable)


{-| Whether vehicle will only stop on request.
-}
requestStop : Field (Maybe Bool) EnturApi.Object.EstimatedCall
requestStop =
    Object.fieldDecoder "requestStop" [] (Decode.bool |> Decode.nullable)


{-| Whether stop is cancellation.
-}
cancellation : Field (Maybe Bool) EnturApi.Object.EstimatedCall
cancellation =
    Object.fieldDecoder "cancellation" [] (Decode.bool |> Decode.nullable)


{-| The date the estimated call is valid for.
-}
date : Field (Maybe EnturApi.Scalar.Date) EnturApi.Object.EstimatedCall
date =
    Object.fieldDecoder "date" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.Date |> Decode.nullable)


serviceJourney : SelectionSet decodesTo EnturApi.Object.ServiceJourney -> Field (Maybe decodesTo) EnturApi.Object.EstimatedCall
serviceJourney object_ =
    Object.selectionField "serviceJourney" [] object_ (identity >> Decode.nullable)


destinationDisplay : SelectionSet decodesTo EnturApi.Object.DestinationDisplay -> Field (Maybe decodesTo) EnturApi.Object.EstimatedCall
destinationDisplay object_ =
    Object.selectionField "destinationDisplay" [] object_ (identity >> Decode.nullable)


notices : SelectionSet decodesTo EnturApi.Object.Notice -> Field (List (Maybe decodesTo)) EnturApi.Object.EstimatedCall
notices object_ =
    Object.selectionField "notices" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| Get all relevant situations for this EstimatedCall.
-}
situations : SelectionSet decodesTo EnturApi.Object.PtSituationElement -> Field (List (Maybe decodesTo)) EnturApi.Object.EstimatedCall
situations object_ =
    Object.selectionField "situations" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| Booking arrangements for flexible service.
-}
bookingArrangements : SelectionSet decodesTo EnturApi.Object.BookingArrangement -> Field (Maybe decodesTo) EnturApi.Object.EstimatedCall
bookingArrangements object_ =
    Object.selectionField "bookingArrangements" [] object_ (identity >> Decode.nullable)