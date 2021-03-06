-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module EnturApi.Object.Presentation exposing (colour, selection, textColour)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) EnturApi.Object.Presentation
selection constructor =
    Object.selection constructor


colour : Field (Maybe String) EnturApi.Object.Presentation
colour =
    Object.fieldDecoder "colour" [] (Decode.string |> Decode.nullable)


textColour : Field (Maybe String) EnturApi.Object.Presentation
textColour =
    Object.fieldDecoder "textColour" [] (Decode.string |> Decode.nullable)
