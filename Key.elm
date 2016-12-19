module Key exposing (..)


type Key
    = Space
    | ArrowUp
    | ArrowDown
    | ArrowLeft
    | ArrowRight
    | Unknown


fromCode : Int -> Key
fromCode keyCode =
    case keyCode of
        32 ->
            Space
        37 ->
            ArrowLeft
        38 ->
            ArrowUp
        39 ->
            ArrowRight
        40 ->
            ArrowDown
        _ ->
            Unknown
