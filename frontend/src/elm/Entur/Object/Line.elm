-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Entur.Object.Line exposing (authority, bikesAllowed, bookingArrangements, description, flexibleLineType, id, journeyPatterns, keyValues, name, notices, operator, organisation, presentation, publicCode, quays, selection, serviceJourneys, situations, transportMode, transportSubmode, url)

import Entur.Enum.BikesAllowed
import Entur.Enum.FlexibleLineType
import Entur.Enum.TransportMode
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Entur.Object.Line
selection constructor =
    Object.selection constructor


id : Field Entur.Scalar.Id Entur.Object.Line
id =
    Object.fieldDecoder "id" [] (Object.scalarDecoder |> Decode.map Entur.Scalar.Id)


authority : SelectionSet decodesTo Entur.Object.Authority -> Field (Maybe decodesTo) Entur.Object.Line
authority object_ =
    Object.selectionField "authority" [] object_ (identity >> Decode.nullable)


operator : SelectionSet decodesTo Entur.Object.Operator -> Field (Maybe decodesTo) Entur.Object.Line
operator object_ =
    Object.selectionField "operator" [] object_ (identity >> Decode.nullable)


organisation : SelectionSet decodesTo Entur.Object.Organisation -> Field (Maybe decodesTo) Entur.Object.Line
organisation object_ =
    Object.selectionField "organisation" [] object_ (identity >> Decode.nullable)


{-| Publicly announced code for line, differentiating it from other lines for the same operator.
-}
publicCode : Field (Maybe String) Entur.Object.Line
publicCode =
    Object.fieldDecoder "publicCode" [] (Decode.string |> Decode.nullable)


name : Field (Maybe String) Entur.Object.Line
name =
    Object.fieldDecoder "name" [] (Decode.string |> Decode.nullable)


transportMode : Field (Maybe Entur.Enum.TransportMode.TransportMode) Entur.Object.Line
transportMode =
    Object.fieldDecoder "transportMode" [] (Entur.Enum.TransportMode.decoder |> Decode.nullable)


transportSubmode : Field (Maybe Entur.Enum.TransportSubmode.TransportSubmode) Entur.Object.Line
transportSubmode =
    Object.fieldDecoder "transportSubmode" [] (Entur.Enum.TransportSubmode.decoder |> Decode.nullable)


description : Field (Maybe String) Entur.Object.Line
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.nullable)


url : Field (Maybe String) Entur.Object.Line
url =
    Object.fieldDecoder "url" [] (Decode.string |> Decode.nullable)


presentation : SelectionSet decodesTo Entur.Object.Presentation -> Field (Maybe decodesTo) Entur.Object.Line
presentation object_ =
    Object.selectionField "presentation" [] object_ (identity >> Decode.nullable)


bikesAllowed : Field (Maybe Entur.Enum.BikesAllowed.BikesAllowed) Entur.Object.Line
bikesAllowed =
    Object.fieldDecoder "bikesAllowed" [] (Entur.Enum.BikesAllowed.decoder |> Decode.nullable)


journeyPatterns : SelectionSet decodesTo Entur.Object.JourneyPattern -> Field (Maybe (List (Maybe decodesTo))) Entur.Object.Line
journeyPatterns object_ =
    Object.selectionField "journeyPatterns" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


quays : SelectionSet decodesTo Entur.Object.Quay -> Field (List (Maybe decodesTo)) Entur.Object.Line
quays object_ =
    Object.selectionField "quays" [] object_ (identity >> Decode.nullable >> Decode.list)


serviceJourneys : SelectionSet decodesTo Entur.Object.ServiceJourney -> Field (List (Maybe decodesTo)) Entur.Object.Line
serviceJourneys object_ =
    Object.selectionField "serviceJourneys" [] object_ (identity >> Decode.nullable >> Decode.list)


notices : SelectionSet decodesTo Entur.Object.Notice -> Field (List (Maybe decodesTo)) Entur.Object.Line
notices object_ =
    Object.selectionField "notices" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| Get all situations active for the line
-}
situations : SelectionSet decodesTo Entur.Object.PtSituationElement -> Field (List (Maybe decodesTo)) Entur.Object.Line
situations object_ =
    Object.selectionField "situations" [] object_ (identity >> Decode.nullable >> Decode.list)


{-| List of keyValue pairs for the line.
-}
keyValues : SelectionSet decodesTo Entur.Object.KeyValue -> Field (Maybe (List (Maybe decodesTo))) Entur.Object.Line
keyValues object_ =
    Object.selectionField "keyValues" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| Type of flexible line, or null if line is not flexible.
-}
flexibleLineType : Field (Maybe Entur.Enum.FlexibleLineType.FlexibleLineType) Entur.Object.Line
flexibleLineType =
    Object.fieldDecoder "flexibleLineType" [] (Entur.Enum.FlexibleLineType.decoder |> Decode.nullable)


{-| Booking arrangements for flexible line.
-}
bookingArrangements : SelectionSet decodesTo Entur.Object.BookingArrangement -> Field (Maybe decodesTo) Entur.Object.Line
bookingArrangements object_ =
    Object.selectionField "bookingArrangements" [] object_ (identity >> Decode.nullable)
