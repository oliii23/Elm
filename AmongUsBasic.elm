-- Game view: https://macoutreach.rocks/share/e4114f9e

myShapes model =
    case model.state of
        Cafeteria  ->
            [group [
            path1
            , roundedRect 50 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-30)
            , text "Cafeteria"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-33)
                  ]
            , group [
              rect 10 55
                  |> filled lightCharcoal
                  |> move (48,0)
            , roundedRect 50 20 5 
                  |> filled lightGreen
                  |> move (50,33)
            , text "Upper Engine"
                  |> centered
                  |> filled black
                  |> move (100,62)
                  |> scale 0.5
                  |> notifyTap P1
                  ]
            , group [
              rect 10 55
                  |> filled lightCharcoal
                  |> move (-48,0)
            , roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (-50,33)
            , text "MedBay"
                  |> centered
                  |> filled black
                  |> move (-100,62)
                  |> scale 0.5
                  |> notifyTap P1LD
                  ]
            ]

        UpperEngine  ->
            [group [
            path2
            , roundedRect 70 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-30)
            , text "UpperEngine"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-33)
                  ]
            , group [
              roundedRect 50 20 5 
                  |> filled lightGreen
                  |> move (0,33)
            , text "Lower Engine"
                  |> centered
                  |> filled black
                  |> move (0,62)
                  |> scale 0.5
                  |> notifyTap P2
                  ]
            , group [
              rect 10 70
                  |> filled lightCharcoal
                  |> move (70,0)
            , roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (70,33)
            , text "Reactor"
                  |> centered
                  |> filled black
                  |> move (140,62)
                  |> scale 0.5
                  |> notifyTap P2DL
                  ]
            , group [  
              rect 10 70
                  |> filled lightCharcoal
                  |> move (-70,0)
            , roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (-70,33)
            , text "Security"
                  |> centered
                  |> filled black
                  |> move (-140,62)
                  |> scale 0.5
                  |> notifyTap P2DR
                  ]
            ]
            
        LowerEngine  ->
            [group [
              path1
            ,  roundedRect 70 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-30)
            ,  text "LowerEngine"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-33)
                  ]
             , group [
              rect 10 55
                  |> filled lightCharcoal
                  |> move (48,0)
            , roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (50,33)
            , text "Electrical"
                  |> centered
                  |> filled black
                  |> move (100,62)
                  |> scale 0.5
                  |> notifyTap P3RU
                  ]      
            , group [
              rect 10 55
                  |> filled lightCharcoal
                  |> move (-48,0)
            , roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (-50,33)
            , text "Storage"
                  |> centered
                  |> filled black
                  |> move (-100,62)
                  |> scale 0.5
                  |> notifyTap P3R
                  ]            
                  
            ]
            
        Storage  ->
            [group [
              path1
            ,  roundedRect 50 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-30)
            , text "Storage"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-33)
                  ]
            , group [
              rect 10 55
                  |> filled lightCharcoal
                  |> move (48,0)
            , roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (50,33)
            , text "Cafeteria"
                  |> centered
                  |> filled black
                  |> move (100,62)
                  |> scale 0.5
                  |> notifyTap P4U
                  ]      
            , group [
              rect 10 55
                  |> filled lightCharcoal
                  |> move (-48,0)
            , roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (-50,33)
            , text "Admin"
                  |> centered
                  |> filled black
                  |> move (-100,62)
                  |> scale 0.5
                  |> notifyTap P4UR
                  ] 
                  
            ]
            
        MedBay  ->
            [group [
             rect 10 50
                  |> filled lightCharcoal
            , roundedRect 50 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-30)
            , text "MedBay"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-33)
                  ]
            , group [
              roundedRect 50 20 5
                  |> filled lightGreen
                  |> move (0,33)
            , text "Upper Engine"
                  |> centered
                  |> filled black
                  |> move (0,62)
                  |> scale 0.5
                  |> notifyTap P1UL
                  ]
            ]
            
        Security  ->
            [group [
             path1
            , roundedRect 50 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-30)
            , text "Security"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-33)
                  ]
            , group [
              rect 10 55
                  |> filled lightCharcoal
                  |> move (48,0)
            , roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (50,33)
            , text "Reactor"
                  |> centered
                  |> filled black
                  |> move (100,62)
                  |> scale 0.5
                  |> notifyTap P2L
                  ]      
            , group [
              rect 10 55
                  |> filled lightCharcoal
                  |> move (-48,0)
            , roundedRect 50 20 5 
                  |> filled lightGreen
                  |> move (-50,33)
            , text "Lower Engine"
                  |> centered
                  |> filled black
                  |> move (-100,62)
                  |> scale 0.5
                  |> notifyTap P2LD
                  ]       
            ]
            
        Reactor  ->
            [group [
             path2
            , rect 10 30
                  |> filled lightCharcoal
                  |> rotate (degrees -90)
                  |> move (38,-30)
            , roundedRect 70 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-30)
            , text "Reactor"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-33)
                  ]
            , group [
              roundedRect 50 20 5 
                  |> filled lightGreen
                  |> move (0,33)
            , text "Clean-Up Task"
                  |> centered
                  |> filled black
                  |> move (0,62)
                  |> scale 0.5
                  |> notifyTap CleanupTask
                  ]    
            , group [
             rect 10 70
                  |> filled lightCharcoal
                  |> move (70,0)
            , roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (60,33)
            , text "Security"
                  |> centered
                  |> filled black
                  |> move (120,62)
                  |> scale 0.5
                  |> notifyTap P2R
                  ]      
            , group [
             rect 10 70
                  |> filled lightCharcoal
                  |> move (-70,0)
            , roundedRect 50 20 5 
                  |> filled lightGreen
                  |> move (-60,33)
            , text "Lower Engine"
                  |> centered
                  |> filled black
                  |> move (-120,62)
                  |> scale 0.5
                  |> notifyTap P2RD
                  ]       
            ]
            
        Task1  ->
            [group [
             roundedRect 50 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-50)
            , text "Task1"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-53)
                  ]
             , group
               [  
               curve (-14.24,45.667) [Pull (-15.05,44.358) (-15.87,43.048),Pull (-16.69,42.393) (-17.51,41.739),
                       Pull (-19.64,40.102) (-21.76,38.465),Pull (-23.07,37.483) (-24.38,36.501),
                       Pull (-25.69,35.519) (-27.00,34.537),Pull (-28.31,33.391) (-29.62,32.245),
                       Pull (-30.77,30.772) (-31.91,29.299),Pull (-33.06,27.498) (-34.20,25.698),
                       Pull (-35.35,23.897) (-36.50,22.097),Pull (-37.64,19.805) (-38.79,17.514),
                       Pull (-39.77,14.895) (-40.75,12.276),Pull (-41.41,9.6572) (-42.06,7.0383),
                       Pull (-42.06,5.2378) (-42.06,3.4373),Pull (-41.41,1.3094) (-40.75,-0.818),
                       Pull (-40.42,-1.964) (-40.10,-3.109),Pull (-39.12,-3.928) (-38.13,-4.746),
                       Pull (-37.31,-5.401) (-36.50,-6.056),Pull (-35.35,-7.038) (-34.20,-8.020),
                       Pull (-32.24,-8.675) (-30.28,-9.329),Pull (-29.13,-9.657) (-27.98,-9.984),
                       Pull (-26.51,-10.14) (-25.04,-10.31),Pull (-23.73,-10.63) (-22.42,-10.96),
                       Pull (-20.95,-10.96) (-19.47,-10.96),Pull (-18.16,-10.80) (-16.85,-10.63),
                       Pull (-16.69,-12.93) (-16.53,-15.22),Pull (-15.38,-15.22) (-14.24,-15.22),
                       Pull (-13.42,-15.38) (-12.60,-15.54),Pull (-13.25,-13.25) (-13.91,-10.96),
                       Pull (-11.94,-11.13) (-9.984,-11.29),Pull (-8.020,-11.45) (-6.056,-11.62),
                       Pull (-3.764,-11.45) (-1.473,-11.29),Pull (0.3273,-10.80) (2.1278,-10.31),
                       Pull (3.7647,-9.329) (5.4015,-8.347),Pull (7.0383,-6.547) (8.6751,-4.746),
                       Pull (9.4936,-2.782) (10.312,-0.818),Pull (11.130,2.7826) (11.948,6.3836),
                       Pull (11.294,10.966) (10.639,15.549),Pull (9.4936,18.332) (8.3478,21.115),
                       Pull (6.3836,24.388) (4.4194,27.662),Pull (2.2915,30.445) (0.1636,33.227),
                       Pull (-1.964,35.355) (-4.092,37.483),Pull (-5.237,38.138) (-6.383,38.792),
                       Pull (-8.511,40.102) (-10.63,41.411),Pull (-11.94,42.393) (-14.24,45.667)]
                        |> filled darkGreen 
                        |> move (10,-20)
                        |> move (10*cos(2*model.time) , 10*cos(2*model.time))
                        |> notifyTap Complete1
               , text "Click on the leaf to complete the clean-up task!"
                 |> serif
                 |> bold
                 |> size 10
                 |> filled red
                 |> move (-100,60)
                 ]
                 |> scale 0.8
            ]
            
        Electrical  ->
            [group [
             rect 10 50
                  |> filled lightCharcoal
            , roundedRect 50 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-30)
            , text "Electrical"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-33)
                  ]
            , group [
              roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (0,33)
            , text "Storage"
                  |> centered
                  |> filled black
                  |> move (0,62)
                  |> scale 0.5
                  |> notifyTap P3DR
                  ]     
            ]
            
        Admin  ->
            [group [
             path1
            , roundedRect 50 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-30)
            , text "Admin"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-33)
                  ]
            , group [
              rect 10 55
                  |> filled lightCharcoal
                  |> move (48,0)
            , roundedRect 50 20 5 
                  |> filled lightGreen
                  |> move (50,33)
            , text "Swipe Card Task"
                  |> centered
                  |> filled black
                  |> move (100,62)
                  |> scale 0.5
                  |> notifyTap SwipeCardTask
                  ]
            , group [
              rect 10 55
                  |> filled lightCharcoal
                  |> move (-48,0)
            , roundedRect 40 20 5 
                  |> filled lightGreen
                  |> move (-50,33)
            , text "Cafeteria"
                  |> centered
                  |> filled black
                  |> move (-100,62)
                  |> scale 0.5
                  |> notifyTap P4LU
                  ]   
            ]
            
        Task2  ->
            [group [
             roundedRect 50 15 5 
                  |> filled (rgb 0 100 250)
                  |> move (0,-50)
            , text "Task2"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  |> move (0,-53)
                  ]
             , group [
                   roundedRect 100 45 5
                   |> filled darkBrown 
                 , roundedRect 100 45 5
                   |> outlined (solid 1) black
                 , roundedRect 100 25 5
                   |> filled darkBrown
                   |> move (0,20)
                 , roundedRect 100 25 5
                   |> outlined (solid 1) black
                   |> move (0,20)
                 , text "SWIPE"
                   |> size 14
                   |> bold
                   |> serif
                   |> centered
                   |> filled white
                   |> move (0,15)           
                  ] 
               |> scale 0.8
              , group [
                  roundedRect 90 45 5
                   |> filled lightBlue
                   |> move (-10,-17)
                , roundedRect 90 45 5
                   |> outlined (solid 1) black
                   |> move (-10,-17)    
                , square 20
                   |> filled white
                   |> move (-40,-10)
                , text "Occupation: Imposter/Crewmate"
                   |> size 12
                   |> serif
                   |> filled black
                   |> move (-100,-60)
                   |> scale 0.5
                 ]
                 |> scale 0.8
                 |> move (5*cos(model.time) , 0)
                 |> notifyTap Complete2
               , text "Click on the card to complete the task!"
                   |> serif
                   |> bold
                   |> size 10
                   |> filled red
                   |> move (-100,60)
                   |> scale 0.8
            ]
            
        TaskCompletePage1  ->
            [ text "TaskCompletePage1"
                  |> centered
                  |> filled black
            , group [
              rect 200 120 
                  |> filled (rgb 0 (150+100*sin model.time) (150-100*sin model.time))
                  |> notifyTap BackToReactor
            , text "Click on the screen"
                  |> filled black
                  |> scale 0.5
                  |> move (-20,50)
            , text "Task Completed!"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  ]     
            ]
            
        TaskCompletePage2  ->
            [ text "TaskCompletePage2"
                  |> centered
                  |> filled black
             , group [
              rect 200 120 
                  |> filled (rgb 0 (150+100*sin model.time) (150-100*sin model.time))
                  |> notifyTap BacktoAdmin
            , text "Click on the screen"
                  |> filled black
                  |> scale 0.5
                  |> move (-20,50)
            , text "Task Completed!"
                  |> centered
                  |> filled black
                  |> scale 0.8
                  ]
            ]

type Msg = Tick Float GetKeyState
         | P1
         | P1UL
         | P1LD
         | P2DR
         | P2DL
         | P2L
         | P2R
         | P2
         | P2RD
         | P2LD
         | P3DR
         | P3R
         | P3RU
         | P4UR
         | SwipeCardTask
         | P4U
         | P4LU
         | BacktoAdmin
         | Complete1
         | CleanupTask
         | BackToReactor
         | Complete2

type State = Cafeteria 
           | UpperEngine 
           | LowerEngine 
           | Storage 
           | MedBay 
           | Security 
           | Reactor 
           | Task1 
           | Electrical 
           | Admin 
           | Task2 
           | TaskCompletePage1 
           | TaskCompletePage2 

update msg model =
    case msg of
        Tick t _ ->
            { model | time = t }
        P1 ->
            case model.state of
                Cafeteria  ->
                    { model | state = UpperEngine  }
                otherwise ->
                    model
        P1UL ->
            case model.state of
                MedBay  ->
                    { model | state = UpperEngine  }
                otherwise ->
                    model
        P1LD ->
            case model.state of
                Cafeteria  ->
                    { model | state = MedBay  }
                otherwise ->
                    model
        P2DR ->
            case model.state of
                UpperEngine  ->
                    { model | state = Security  }
                otherwise ->
                    model
        P2DL ->
            case model.state of
                UpperEngine  ->
                    { model | state = Reactor  }
                otherwise ->
                    model
        P2L ->
            case model.state of
                Security  ->
                    { model | state = Reactor  }
                otherwise ->
                    model
        P2R ->
            case model.state of
                Reactor  ->
                    { model | state = Security  }
                otherwise ->
                    model
        P2 ->
            case model.state of
                UpperEngine  ->
                    { model | state = LowerEngine  }
                otherwise ->
                    model
        P2RD ->
            case model.state of
                Reactor  ->
                    { model | state = LowerEngine  }
                otherwise ->
                    model
        P2LD ->
            case model.state of
                Security  ->
                    { model | state = LowerEngine  }
                otherwise ->
                    model
        P3DR ->
            case model.state of
                Electrical  ->
                    { model | state = Storage  }
                otherwise ->
                    model
        P3R ->
            case model.state of
                LowerEngine  ->
                    { model | state = Storage  }
                otherwise ->
                    model
        P3RU ->
            case model.state of
                LowerEngine  ->
                    { model | state = Electrical  }
                otherwise ->
                    model
        P4UR ->
            case model.state of
                Storage  ->
                    { model | state = Admin  }
                otherwise ->
                    model
        SwipeCardTask ->
            case model.state of
                Admin  ->
                    { model | state = Task2  }
                otherwise ->
                    model
        P4U ->
            case model.state of
                Storage  ->
                    { model | state = Cafeteria  }
                otherwise ->
                    model
        P4LU ->
            case model.state of
                Admin  ->
                    { model | state = Cafeteria  }
                otherwise ->
                    model
        BacktoAdmin ->
            case model.state of
                TaskCompletePage2  ->
                    { model | state = Admin  }
                otherwise ->
                    model
        Complete2 ->
            case model.state of
                Task2  ->
                    { model | state = TaskCompletePage2  }
                otherwise ->
                    model
        CleanupTask ->
            case model.state of
                Reactor  ->
                    { model | state = Task1  }
                otherwise ->
                    model
        BackToReactor ->
            case model.state of
                TaskCompletePage1  ->
                    { model | state = Reactor  }
                otherwise ->
                    model
        Complete1 ->
            case model.state of
                Task1  ->
                    { model | state = TaskCompletePage1  }
                otherwise ->
                    model

type alias Model =
    { time : Float
    , state : State
    }

init : Model
init = { time = 0 
       , state = Cafeteria 
       }
    

path1 = group
        [ rect 10 30
                  |> filled lightCharcoal
                  |> rotate (degrees -90)
                  |> move (38,-30)
        , rect 10 30
                  |> filled lightCharcoal
                  |> rotate (degrees -90)
                  |> move (-38,-30)
        ]
       
path2 = group 
        [rect 10 40
                  |> filled lightCharcoal
                  |> rotate (degrees -90)
                  |> move (50,-30)
            , rect 10 40
                  |> filled lightCharcoal
                  |> rotate (degrees -90)
                  |> move (-50,-30)
            , rect 10 55
                  |> filled lightCharcoal
        ]    
        
