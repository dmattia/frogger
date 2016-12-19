module State exposing (initialState, update, subscriptions)

import Time exposing (Time, second)
import Keyboard exposing (KeyCode)
import Window

import Types exposing (..)
import Key
import Task

initialState : (Model, Cmd Msg)
initialState =
  ( initModel
  , Task.perform (\{width,height} -> ResizeWindow (Window.Size width height)) Window.size
  )

initModel : Model
initModel =
  let
    location = Location 50 20
    frogger = Frogger location 0
  in
    Model 0.0 frogger (Window.Size 500 500)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick time ->
      ({ model | time=time }, Cmd.none)
    KeyDown keyCode ->
      (keyDown keyCode model, Cmd.none)
    ResizeWindow dimensions ->
      ({ model | windowSize=dimensions }, Cmd.none)
    

keyDown : KeyCode -> Model -> Model
keyDown keyCode model =
  case Key.fromCode keyCode of
    Key.ArrowLeft ->
      { model | frogger = Frogger (moveLocation model.frogger.location -10 0) 90 }
    Key.ArrowUp ->
      { model | frogger = Frogger (moveLocation model.frogger.location 0 10) 0 }
    Key.ArrowRight ->
      { model | frogger = Frogger (moveLocation model.frogger.location 10 0) -90 }
    Key.ArrowDown ->
      { model | frogger = Frogger (moveLocation model.frogger.location 0 -10) 180 }
    _ ->
      model

-- Moves a location by a given x, y value
moveLocation : Location -> Float -> Float -> Location
moveLocation location dx dy =
  { location | x = location.x + dx, y = location.y + dy }

-- Subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ Time.every second Tick
    , Keyboard.downs KeyDown
    , Window.resizes (\{width,height} -> ResizeWindow (Window.Size width height))
    ]
