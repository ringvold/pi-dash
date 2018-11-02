-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Entur.Object.Operator exposing (branding, id, lines, name, phone, selection, serviceJourney, url)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Entur.Object.Operator
selection constructor =
    Object.selection constructor


{-| Operator id
-}
id : Field Entur.Scalar.Id Entur.Object.Operator
id =
    Object.fieldDecoder "id" [] (Object.scalarDecoder |> Decode.map Entur.Scalar.Id)


name : Field String Entur.Object.Operator
name =
    Object.fieldDecoder "name" [] Decode.string


url : Field (Maybe String) Entur.Object.Operator
url =
    Object.fieldDecoder "url" [] (Decode.string |> Decode.nullable)


phone : Field (Maybe String) Entur.Object.Operator
phone =
    Object.fieldDecoder "phone" [] (Decode.string |> Decode.nullable)


{-| Branding for operator.
-}
branding : SelectionSet decodesTo Entur.Object.Branding -> Field (Maybe decodesTo) Entur.Object.Operator
branding object_ =
    Object.selectionField "branding" [] object_ (identity >> Decode.nullable)


lines : SelectionSet decodesTo Entur.Object.Line -> Field (List (Maybe decodesTo)) Entur.Object.Operator
lines object_ =
    Object.selectionField "lines" [] object_ (identity >> Decode.nullable >> Decode.list)


serviceJourney : SelectionSet decodesTo Entur.Object.ServiceJourney -> Field (List (Maybe decodesTo)) Entur.Object.Operator
serviceJourney object_ =
    Object.selectionField "serviceJourney" [] object_ (identity >> Decode.nullable >> Decode.list)
