-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module EnturApi.Object.ValidityPeriod exposing (endTime, selection, startTime)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) EnturApi.Object.ValidityPeriod
selection constructor =
    Object.selection constructor


{-| Start of validity period
-}
startTime : Field (Maybe EnturApi.Scalar.DateTime) EnturApi.Object.ValidityPeriod
startTime =
    Object.fieldDecoder "startTime" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.DateTime |> Decode.nullable)


{-| End of validity period
-}
endTime : Field (Maybe EnturApi.Scalar.DateTime) EnturApi.Object.ValidityPeriod
endTime =
    Object.fieldDecoder "endTime" [] (Object.scalarDecoder |> Decode.map EnturApi.Scalar.DateTime |> Decode.nullable)