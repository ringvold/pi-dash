-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Entur.Object.QuayAtDistanceConnection exposing (edges, pageInfo, selection)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Entur.Object.QuayAtDistanceConnection
selection constructor =
    Object.selection constructor


{-| a list of edges
-}
edges : SelectionSet decodesTo Entur.Object.QuayAtDistanceEdge -> Field (Maybe (List (Maybe decodesTo))) Entur.Object.QuayAtDistanceConnection
edges object_ =
    Object.selectionField "edges" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| details about this specific page
-}
pageInfo : SelectionSet decodesTo Entur.Object.PageInfo -> Field decodesTo Entur.Object.QuayAtDistanceConnection
pageInfo object_ =
    Object.selectionField "pageInfo" [] object_ identity
