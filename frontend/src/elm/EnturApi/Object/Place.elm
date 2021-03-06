-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module EnturApi.Object.Place exposing (bikePark, bikeRentalStation, carPark, latitude, longitude, name, quay, selection, vertexType)

import EnturApi.Enum.VertexType
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) EnturApi.Object.Place
selection constructor =
    Object.selection constructor


{-| For transit quays, the name of the quay. For points of interest, the name of the POI.
-}
name : Field (Maybe String) EnturApi.Object.Place
name =
    Object.fieldDecoder "name" [] (Decode.string |> Decode.nullable)


{-| Type of vertex. (Normal, Bike sharing station, Bike P+R, Transit quay) Mostly used for better localization of bike sharing and P+R station names
-}
vertexType : Field (Maybe EnturApi.Enum.VertexType.VertexType) EnturApi.Object.Place
vertexType =
    Object.fieldDecoder "vertexType" [] (EnturApi.Enum.VertexType.decoder |> Decode.nullable)


{-| The latitude of the place.
-}
latitude : Field Float EnturApi.Object.Place
latitude =
    Object.fieldDecoder "latitude" [] Decode.float


{-| The longitude of the place.
-}
longitude : Field Float EnturApi.Object.Place
longitude =
    Object.fieldDecoder "longitude" [] Decode.float


{-| The quay related to the place.
-}
quay : SelectionSet decodesTo EnturApi.Object.Quay -> Field (Maybe decodesTo) EnturApi.Object.Place
quay object_ =
    Object.selectionField "quay" [] object_ (identity >> Decode.nullable)


{-| The bike rental station related to the place
-}
bikeRentalStation : SelectionSet decodesTo EnturApi.Object.BikeRentalStation -> Field (Maybe decodesTo) EnturApi.Object.Place
bikeRentalStation object_ =
    Object.selectionField "bikeRentalStation" [] object_ (identity >> Decode.nullable)


{-| The bike parking related to the place
-}
bikePark : SelectionSet decodesTo EnturApi.Object.BikePark -> Field (Maybe decodesTo) EnturApi.Object.Place
bikePark object_ =
    Object.selectionField "bikePark" [] object_ (identity >> Decode.nullable)


{-| The car parking related to the place
-}
carPark : SelectionSet decodesTo EnturApi.Object.CarPark -> Field (Maybe decodesTo) EnturApi.Object.Place
carPark object_ =
    Object.selectionField "carPark" [] object_ (identity >> Decode.nullable)
