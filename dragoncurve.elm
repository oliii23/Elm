-- Game view: https://macoutreach.rocks/share/500ecafa

myShapes model = [openPolygon ( List.take (round <| 2900 * model.sliderValue) model.points2 ) 
                    |> outlined (solid 1) (rgb 252 232 5)
                    |> move (-60,-30)
                    |> scale 0.4
                    |> move model.pan
                 , rect 184 120 |> ghost
                    |> notifyMouseDownAt MouseDownAt
                    |> notifyMouseMoveAt MouseMoveAt
                    |> notifyLeave MouseLeave
                    |> notifyMouseUp MouseUp
                 , slider 120 (0,1) SliderDown SliderMove SliderUp model.sliderValue model.sliderState
                    |> move (90,0)
                 ]


recursive grow theta n = 
  if n < 1 then
    [(5,0)]
  else
    case recursive grow theta (n-1) of
      (x0,y0) :: xys -> (grow * (x0 * cos theta - y0 * sin theta), grow * (x0 * sin theta + y0 * cos theta)) :: (x0,y0) :: xys
      [] -> [] -- cannot happen, but we need it to compile
       
       
slider : Float -> (Float,Float) 
    -> (Float -> Msg) 
    -> (Float -> Msg) 
    -> Msg
    -> Float 
    -> SliderState
    -> Shape Msg

slider height (minValue,maxValue) downMsg moveMsg stopMsg currentValue state =
  let
    background = roundedRect 4 height 2
                    |> filled (rgb 207 17 10)
    highlightedHeight =
      if maxValue-minValue < 0.0001 then
        0
      else
        currentValue / (maxValue-minValue) * height
    
    -- "do" the calculation for the slider value, here in the "view" 
    mouseDownMsg : (Float,Float) -> Msg
    mouseDownMsg (x,y) = downMsg ((y + 0.5 * height / (maxValue-minValue)) / height * (maxValue-minValue))

    mouseMoveMsg : (Float,Float) -> Msg
    mouseMoveMsg (x,y) = ((y + 0.5 * height / (maxValue-minValue) ) 
                                    / height * (maxValue-minValue))
                            |> moveMsg

  in
    group
      [ background
      , rect 4 highlightedHeight 
          |> filled (rgb 0 189 19) 
          |> move (0,(height - highlightedHeight) * (-0.5))
          |> clip background 
      , rect 8 height |> filled (rgba 0 0 0 0.01)
      ]
      |> ( case state of
            SliderWaiting -> notifyMouseDownAt mouseDownMsg
            SliderDragging -> 
              (    notifyMouseMoveAt mouseMoveMsg
                >> notifyMouseUp stopMsg
                >> notifyLeave stopMsg
              )
         )

type Msg 
  = Tick Float GetKeyState
  | MouseDownAt (Float,Float)
  | MouseMoveAt (Float,Float)
  | MouseLeave
  | MouseUp
  | SliderDown Float
  | SliderMove Float
  | SliderUp

type alias Point = (Float, Float)

type SliderState
  = SliderWaiting
  | SliderDragging
  
type MouseState
  = Waiting
  | MouseDownLast (Float,Float)
  
    
update msg model 
  = case msg of
      Tick t (keyQuery,_,_) -> 
        { model | time = t, level = model.level + 1, frame = model.frame + 1, isZooming = Down == keyQuery Shift, points2 = pointNew2 1.0 model.points2}
      MouseDownAt pos ->
        { model | mouseState = MouseDownLast pos }
      MouseLeave ->
        { model | mouseState = Waiting }
      MouseUp ->
        { model | mouseState = Waiting }
      MouseMoveAt (x,y) ->
        case model.mouseState of
          MouseDownLast (xLast,yLast) ->
            case model.isZooming of
              True -> { model | zoom = model.zoom * ( 1 + (y-yLast)/64.0 )
                              , mouseState = MouseDownLast (x,y)
                              }
              False -> {model | pan = let (xOld,yOld) = model.pan
                                      in ( xOld + (x-xLast)/model.zoom
                                         , yOld + (y-yLast)/model.zoom
                                         )
                              , mouseState = MouseDownLast (x,y)
                              }
          Waiting -> model
      SliderMove value ->
        { model | sliderValue = value } 
      SliderDown value ->
        { model | sliderState = SliderDragging, sliderValue = value }
      SliderUp ->
        { model | sliderState = SliderWaiting }
        

breakupInto : Int -> List a -> List (List a)
breakupInto n ls = 
    let segmentCount = (List.length ls) - 1 
        breakup nn lls = case lls of
          [] -> []
          _  -> List.take (nn+1) ls :: breakup n (List.drop nn lls)
    in if n > segmentCount 
       then [ls]
       else breakup (segmentCount // n) ls
       
pointNew1 : Point -> Point -> Float -> Point
pointNew1 (x0,y0) (x1,y1) offset = 
  let (vx, vy) = ((x1 - x0) / 2.0, (y1 - y0) / 2.0) 
      (dx, dy) = (-vy * offset , vx * offset )
  in  (x0 + vx + dx, y0 + vy + dy) --offset from midpoint 
       
pointNew2 : Float -> List Point -> List Point
pointNew2 offset points = 
  case points of
    [] -> []
    [p0] -> [p0]  
    p0::p1::rest -> p0 :: pointNew1 p0 p1 offset :: pointNew2 -offset (p1::rest)

init =  { time = 0
        , pan = (0,0)
        , level = 0
        , frame = 0
        , zoom = 1
        , isZooming = False
        , mouseState = Waiting
        , sliderState = SliderWaiting
        , sliderValue = 0.5
        , points1 = recursive 1.05 0.5 3000 |> List.reverse
        , points2 = [(0,0), (200,0)]
        }
