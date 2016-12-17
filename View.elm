module View exposing (rootView)

import Html exposing (div, button, text, h3, h5)
import Html.Attributes exposing (id, class)

import Types exposing (..)

rootView : Model -> Html.Html Msg
rootView model =
  div [ class "container row" ]
    [ h3 [ class "center" ] [ text "Frogger" ]
    , h5 [] [ model.time |> toString |> text ]
    ]
