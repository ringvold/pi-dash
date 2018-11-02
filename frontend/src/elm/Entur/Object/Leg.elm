-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Entur.Object.Leg exposing (aimedEndTime, aimedStartTime, authority, bookingArrangements, distance, duration, endTime, expectedEndTime, expectedStartTime, fromEstimatedCall, fromPlace, interchangeFrom, interchangeTo, intermediateEstimatedCalls, intermediateQuays, line, mode, operator, organisation, pointsOnLink, realTime, realtime, rentedBike, ride, selection, serviceJourney, serviceJourneyEstimatedCalls, situations, startTime, steps, toEstimatedCall, toPlace, transportSubmode, via)

import Entur.Enum.Mode
import Entur.Enum.TransportSubmode
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Entur.Object.Leg
selection constructor =
    Object.selection constructor


{-| The date and time this leg begins.
-}
startTime : Field (Maybe Entur.Scalar.DateTime) Entur.Object.Leg
startTime =
    Object.fieldDecoder "startTime" [] (Object.scalarDecoder |> Decode.map Entur.Scalar.DateTime |> Decode.nullable)


{-| The date and time this leg ends.
-}
endTime : Field (Maybe Entur.Scalar.DateTime) Entur.Object.Leg
endTime =
    Object.fieldDecoder "endTime" [] (Object.scalarDecoder |> Decode.map Entur.Scalar.DateTime |> Decode.nullable)


{-| The aimed date and time this leg starts.
-}
aimedStartTime : Field (Maybe Entur.Scalar.DateTime) Entur.Object.Leg
aimedStartTime =
    Object.fieldDecoder "aimedStartTime" [] (Object.scalarDecoder |> Decode.map Entur.Scalar.DateTime |> Decode.nullable)


{-| The expected, realtime adjusted date and time this leg starts.
-}
expectedStartTime : Field (Maybe Entur.Scalar.DateTime) Entur.Object.Leg
expectedStartTime =
    Object.fieldDecoder "expectedStartTime" [] (Object.scalarDecoder |> Decode.map Entur.Scalar.DateTime |> Decode.nullable)


{-| The aimed date and time this leg ends.
-}
aimedEndTime : Field (Maybe Entur.Scalar.DateTime) Entur.Object.Leg
aimedEndTime =
    Object.fieldDecoder "aimedEndTime" [] (Object.scalarDecoder |> Decode.map Entur.Scalar.DateTime |> Decode.nullable)


{-| The expected, realtime adjusted date and time this leg ends.
-}
expectedEndTime : Field (Maybe Entur.Scalar.DateTime) Entur.Object.Leg
expectedEndTime =
    Object.fieldDecoder "expectedEndTime" [] (Object.scalarDecoder |> Decode.map Entur.Scalar.DateTime |> Decode.nullable)


{-| The mode of transport or access (e.g., foot) used when traversing this leg.
-}
mode : Field (Maybe Entur.Enum.Mode.Mode) Entur.Object.Leg
mode =
    Object.fieldDecoder "mode" [] (Entur.Enum.Mode.decoder |> Decode.nullable)


{-| The transport sub mode (e.g., localBus or expressBus) used when traversing this leg. Null if leg is not a ride
-}
transportSubmode : Field (Maybe Entur.Enum.TransportSubmode.TransportSubmode) Entur.Object.Leg
transportSubmode =
    Object.fieldDecoder "transportSubmode" [] (Entur.Enum.TransportSubmode.decoder |> Decode.nullable)


{-| The legs's duration in seconds
-}
duration : Field (Maybe Entur.Scalar.Long) Entur.Object.Leg
duration =
    Object.fieldDecoder "duration" [] (Object.scalarDecoder |> Decode.map Entur.Scalar.Long |> Decode.nullable)


{-| The legs's geometry.
-}
pointsOnLink : SelectionSet decodesTo Entur.Object.PointsOnLink -> Field (Maybe decodesTo) Entur.Object.Leg
pointsOnLink object_ =
    Object.selectionField "pointsOnLink" [] object_ (identity >> Decode.nullable)


{-| For ride legs, the service authority used for this legs. For non-ride legs, null.
-}
authority : SelectionSet decodesTo Entur.Object.Authority -> Field (Maybe decodesTo) Entur.Object.Leg
authority object_ =
    Object.selectionField "authority" [] object_ (identity >> Decode.nullable)


{-| For ride legs, the operator used for this legs. For non-ride legs, null.
-}
operator : SelectionSet decodesTo Entur.Object.Operator -> Field (Maybe decodesTo) Entur.Object.Leg
operator object_ =
    Object.selectionField "operator" [] object_ (identity >> Decode.nullable)


{-| For ride legs, the transit organisation that operates the service used for this legs. For non-ride legs, null.
-}
organisation : SelectionSet decodesTo Entur.Object.Organisation -> Field (Maybe decodesTo) Entur.Object.Leg
organisation object_ =
    Object.selectionField "organisation" [] object_ (identity >> Decode.nullable)


{-| Whether there is real-time data about this leg
-}
realTime : Field (Maybe Bool) Entur.Object.Leg
realTime =
    Object.fieldDecoder "realTime" [] (Decode.bool |> Decode.nullable)


{-| Whether there is real-time data about this leg
-}
realtime : Field (Maybe Bool) Entur.Object.Leg
realtime =
    Object.fieldDecoder "realtime" [] (Decode.bool |> Decode.nullable)


{-| The distance traveled while traversing the leg in meters.
-}
distance : Field (Maybe Float) Entur.Object.Leg
distance =
    Object.fieldDecoder "distance" [] (Decode.float |> Decode.nullable)


{-| Whether this leg is a ride leg or not.
-}
ride : Field (Maybe Bool) Entur.Object.Leg
ride =
    Object.fieldDecoder "ride" [] (Decode.bool |> Decode.nullable)


{-| Whether this leg is with a rented bike.
-}
rentedBike : Field (Maybe Bool) Entur.Object.Leg
rentedBike =
    Object.fieldDecoder "rentedBike" [] (Decode.bool |> Decode.nullable)


{-| The Place where the leg originates.
-}
fromPlace : SelectionSet decodesTo Entur.Object.Place -> Field decodesTo Entur.Object.Leg
fromPlace object_ =
    Object.selectionField "fromPlace" [] object_ identity


{-| The Place where the leg ends.
-}
toPlace : SelectionSet decodesTo Entur.Object.Place -> Field decodesTo Entur.Object.Leg
toPlace object_ =
    Object.selectionField "toPlace" [] object_ identity


{-| EstimatedCall for the quay where the leg originates.
-}
fromEstimatedCall : SelectionSet decodesTo Entur.Object.EstimatedCall -> Field (Maybe decodesTo) Entur.Object.Leg
fromEstimatedCall object_ =
    Object.selectionField "fromEstimatedCall" [] object_ (identity >> Decode.nullable)


{-| EstimatedCall for the quay where the leg ends.
-}
toEstimatedCall : SelectionSet decodesTo Entur.Object.EstimatedCall -> Field (Maybe decodesTo) Entur.Object.Leg
toEstimatedCall object_ =
    Object.selectionField "toEstimatedCall" [] object_ (identity >> Decode.nullable)


{-| For ride legs, the line. For non-ride legs, null.
-}
line : SelectionSet decodesTo Entur.Object.Line -> Field (Maybe decodesTo) Entur.Object.Leg
line object_ =
    Object.selectionField "line" [] object_ (identity >> Decode.nullable)


{-| For ride legs, the service journey. For non-ride legs, null.
-}
serviceJourney : SelectionSet decodesTo Entur.Object.ServiceJourney -> Field (Maybe decodesTo) Entur.Object.Leg
serviceJourney object_ =
    Object.selectionField "serviceJourney" [] object_ (identity >> Decode.nullable)


{-| For ride legs, intermediate quays between the Place where the leg originates and the Place where the leg ends. For non-ride legs, empty list.
-}
intermediateQuays : SelectionSet decodesTo Entur.Object.Quay -> Field (List (Maybe decodesTo)) Entur.Object.Leg
intermediateQuays object_ =
    Object.selectionField "intermediateQuays" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| For ride legs, estimated calls for quays between the Place where the leg originates and the Place where the leg ends. For non-ride legs, empty list.
-}
intermediateEstimatedCalls : SelectionSet decodesTo Entur.Object.EstimatedCall -> Field (List (Maybe decodesTo)) Entur.Object.Leg
intermediateEstimatedCalls object_ =
    Object.selectionField "intermediateEstimatedCalls" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| For ride legs, all estimated calls for the service journey. For non-ride legs, empty list.
-}
serviceJourneyEstimatedCalls : SelectionSet decodesTo Entur.Object.EstimatedCall -> Field (List (Maybe decodesTo)) Entur.Object.Leg
serviceJourneyEstimatedCalls object_ =
    Object.selectionField "serviceJourneyEstimatedCalls" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| Do we continue from a specified via place
-}
via : Field (Maybe Bool) Entur.Object.Leg
via =
    Object.fieldDecoder "via" [] (Decode.bool |> Decode.nullable)


{-| All relevant situations for this leg
-}
situations : SelectionSet decodesTo Entur.Object.PtSituationElement -> Field (List (Maybe decodesTo)) Entur.Object.Leg
situations object_ =
    Object.selectionField "situations" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| Do we continue from a specified via place
-}
steps : SelectionSet decodesTo Entur.Object.PathGuidance -> Field (List (Maybe decodesTo)) Entur.Object.Leg
steps object_ =
    Object.selectionField "steps" [] object_ (identity >> Decode.nullable >> Decode.list)


interchangeFrom : SelectionSet decodesTo Entur.Object.Interchange -> Field (Maybe decodesTo) Entur.Object.Leg
interchangeFrom object_ =
    Object.selectionField "interchangeFrom" [] object_ (identity >> Decode.nullable)


interchangeTo : SelectionSet decodesTo Entur.Object.Interchange -> Field (Maybe decodesTo) Entur.Object.Leg
interchangeTo object_ =
    Object.selectionField "interchangeTo" [] object_ (identity >> Decode.nullable)


bookingArrangements : SelectionSet decodesTo Entur.Object.BookingArrangement -> Field (Maybe decodesTo) Entur.Object.Leg
bookingArrangements object_ =
    Object.selectionField "bookingArrangements" [] object_ (identity >> Decode.nullable)
