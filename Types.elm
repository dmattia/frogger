module Types exposing (..)

import Time exposing (Time)

type Msg
  = Tick Time

type alias Model =
  { time : Time
  }
