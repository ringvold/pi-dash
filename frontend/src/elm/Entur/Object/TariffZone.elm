-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Entur.Object.TariffZone exposing (id, name, selection)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Entur.Object.TariffZone
selection constructor =
    Object.selection constructor


id : Field (Maybe String) Entur.Object.TariffZone
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.nullable)


name : Field (Maybe String) Entur.Object.TariffZone
name =
    Object.fieldDecoder "name" [] (Decode.string |> Decode.nullable)
