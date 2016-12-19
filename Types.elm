module Types exposing (..)

import Time exposing (Time)
import Keyboard exposing (KeyCode)
import Window exposing (Size)

type Msg
  = Tick Time
  | KeyDown KeyCode
  | ResizeWindow Size

type alias Model =
  { time : Time
  , frogger : Frogger
  , windowSize : Size
  }

type alias Location =
  { x : Float
  , y : Float
  }

type alias Frogger =
  { location : Location
  , rotation : Float
  }
