module View exposing (rootView)

import Color exposing (..)
import Collage exposing (..)
import Element

import Html exposing (div)

import Types exposing (..)

froggerView : Frogger -> Form
froggerView frogger =
  ngon 5 20
    |> filled (Color.rgb 0 255 0)
    |> move (frogger.location.x, frogger.location.y)
    |> rotate (degrees 19)
    |> rotate (degrees frogger.rotation)

rootView : Model -> Html.Html Msg
rootView model =
  div []
    [ collage model.windowSize.width model.windowSize.height
        [ rect (toFloat model.windowSize.width) (toFloat model.windowSize.height)
            |> filled (Color.rgb 0 0 0)
        , froggerView model.frogger
        ] |> Element.toHtml
    ]
