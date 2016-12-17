module State exposing (initialState, update, subscriptions)

import Time exposing (Time, second)

import Types exposing (..)

initialState : (Model, Cmd Msg)
initialState =
  ( initModel, Cmd.none )

initModel : Model
initModel =
  Model 0.0

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick time ->
      ((Model time), Cmd.none)

-- Subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ Time.every second Tick
    ]
