-- Game Link: https://macoutreach.rocks/share/e678e790

myShapes model = case model.state of
                    Welcome -> [ welcomeBackground model,
                    
                                 text "AMONG US"
                                  |> centered
                                  |> bold
                                  |> customFont "Comic Sans MS"
                                  |> filled white
                                  |> addOutline (solid 0.5) black
                                  |> move (0, 5)
                                  |> scale 1.5,
                                 
                                 startButton
                                 |> move (0, -20)
                                 |> notifyTap Start
                                 ]
                                 
                    Cafeteria -> [ background,
                    
                                   cafeBlueprint
                                    |> addOutline (solid 1) (rgb 15 255 50),
                                    
                                   text "Cafeteria"
                                    |> centered
                                    |> bold
                                    |> customFont "Courier New"
                                    |> filled black
                                    |> scale 0.5
                                    |> move (65,-2.5),
                                   
                                   upperEngineButton
                                    |> notifyTap P1L,
                                   
                                   line (0,0) (0,30)
                                    |> outlined (solid 0.5) (rgb 15 255 50)
                                    |> move (0,-32.5),
                                   
                                   medbayButton
                                    |> notifyTap P1LD,
                                   
                                   crewmate red
                                    |> scale 0.4
                                    |> move (70,20)
                                    ]
                                    
                    UpperEngine -> [ background,
                    
                                     ueBlueprint
                                      |> addOutline (solid 1) (rgb 15 255 50),
                                     
                                     lowerEngineButton
                                      |> notifyTap P2D,
                                     
                                     securityButton
                                      |> notifyTap P2DR,
                                     
                                     line (0,0) (40,0)
                                      |> outlined (solid 0.5) (rgb 15 255 50)
                                      |> move (5,0),  text "Upper"
                                      |> centered
                                      |> bold
                                      |> customFont "Courier New"
                                      |> filled black
                                      |> scale 0.5
                                      |> move (0,40),
                                      
                                     text "Engine"
                                      |> centered
                                      |> bold
                                      |> customFont "Courier New"
                                      |> filled black
                                      |> scale 0.5
                                      |> move (0,30),
                                      
                                     crewmate red
                                      |> scale 0.4
                                      |> move (5,53),
                                     
                                     reactorButton
                                      |> addOutline (solid 1) (rgb 15 255 50)
                                      |> notifyTap P2DL,
                                     
                                     line (0,0) (-40,0)
                                      |> outlined (solid 0.5) (rgb 15 255 50)
                                      |> move (-5,0)
                                     ]
                                     
                    MedBay -> [ background,
                                
                                mbBlueprint
                                 |> addOutline (solid 1) (rgb 15 255 50),
                                
                                line (0,0) (-80,0)
                                 |> outlined (dashed 1) (rgb 15 255 50)
                                 |> move (100,10.5),
                                
                                line (0,0) (120,0)
                                 |> outlined (solid 1) (rgb 15 255 50)
                                 |> move (-95,10.5),
                                
                                upperEngineButton
                                 |> move (25,8)
                                 |> scale 1.3
                                 |> notifyTap P1UL,
                                
                                crewmate red
                                 |> scale 0.5
                                 |> move (30,-45),
                                
                                text "MedBay"
                                 |> centered
                                 |> bold
                                 |> customFont "Courier New"
                                 |> filled black
                                 |> scale 0.75
                                 |> move (20,-30)
                                 ]
                                 
                    LowerEngine -> [ background,
                                     
                                     line (-65,100) (-65,30)
                                      |> outlined (dashed 0.5) (rgb 15 255 50)
                                      |> move (0,0),
                                     
                                     leBlueprint
                                      |> addOutline (solid 1) (rgb 15 255 50),
                                     
                                     line (0,0) (0,30)
                                      |> outlined (solid 1) (rgb 15 255 50)
                                      |> move (25,-14.5),
                                     
                                     storageButton
                                      |> notifyTap P3RDR,
                                     
                                     electricalButton
                                      |> notifyTap P3RDRU,
                                     
                                     text "Lower" 
                                      |> centered
                                      |> bold
                                      |> customFont "Courier New"
                                      |> filled black
                                      |> scale 0.65
                                      |> move (-65,40),
                                      
                                     text "Engine"
                                      |> centered
                                      |> bold
                                      |> customFont "Courier New"
                                      |> filled black
                                      |> scale 0.65
                                      |> move (-65,30),
                                      
                                     crewmate red
                                      |> scale 0.4
                                      |> move (-55,18)
                                      ]
                           
                    Reactor -> [ background,
                                 
                                 reacBlueprint
                                  |> addOutline (solid 0.5) (rgb 15 255 50)
                                  |> move (0,17),
                                  
                                 line (0,0) (0,80)
                                  |> outlined (dashed 0.5) (rgb 15 255 50)
                                  |> move (10,0),
                                  
                                 line (0,0) (0,-100)
                                  |> outlined (solid 0.5) (rgb 15 255 50)
                                  |> move (10,22),
                                  
                                 line (0,0) (55,0)
                                  |> outlined (solid 0.5) (rgb 15 255 50)
                                  |> move (10,17),
                                 
                                 securityButton
                                  |> move (0,17)
                                  |> notifyTap P2R,
                                  
                                 lowerEngineButton
                                  |> move (10,0)
                                  |> notifyTap P2RD,
                                 
                                 text "Reactor"
                                  |> centered
                                  |> bold
                                  |> customFont "Courier New"
                                  |> filled black
                                  |> scale 0.5
                                  |> move (-40,15),
                                 
                                 crewmate red
                                  |> scale 0.4
                                  |> move (-60,30),
                                  
                                 leaves
                                  |> move (-85,17)
                                  |> notifyTap LeavesTask
                                  ]
                    
                    CleanUpTask -> [ rect 500 500
                                      |> filled (rgb 173 216 230),
                                     
                                     garbageChuteVisual,
                                     
                                     leaf1 (rgb 250 150 0)
                                      |> scale 0.5
                                      |> move model.pos1
                                      |> move (-20,-40)
                                      |> move ( 4*sin(model.time), 4*sin(model.time))
                                      |> notifyMouseDown ChangeDragState1
                                      |> notifyMouseUp ChangeDragState1,
                                     
                                     leaf2 (rgb 70 140 0)
                                      |> scale 0.65
                                      |> move (45,-30)
                                      |> move model.pos2
                                      |> notifyMouseDown ChangeDragState2
                                      |> move ( 4*sin(model.time), 4*sin(model.time))
                                      |> notifyMouseUp ChangeDragState2,
                                     
                                     leaf2 (rgb 70 140 0)
                                      |> scale 0.35
                                      |> rotate (degrees 180)
                                      |> move model.pos3
                                      |> move ( 4*sin(model.time), 4*sin(model.time))
                                      |> move (30,-30)
                                      |> notifyMouseDown ChangeDragState3
                                      |> notifyMouseUp ChangeDragState3,
                                     
                                     leaf1 darkRed
                                      |> scale 0.35
                                      |> rotate (degrees 75)
                                      |> move model.pos4
                                      |> move (0,0)
                                      |> move ( 4*sin(model.time), 4*sin(model.time))
                                      |> notifyMouseDown ChangeDragState4
                                      |> notifyMouseUp ChangeDragState4,
                                     
                                     leaf2 lightGreen
                                      |> move model.pos5
                                      |> move (0,0)
                                      |> scale 0.5
                                      |> move ( 4*sin(model.time), 4*sin(model.time))
                                      |> notifyMouseDown ChangeDragState5
                                      |> notifyMouseUp ChangeDragState5,
                                      
                                     leaf2 (rgb 70 140 0)
                                      |> move model.pos6
                                      |> move (60,0)
                                      |> scale 0.5
                                      |> move ( 4*sin(model.time), 4*sin(model.time))
                                      |> notifyMouseDown ChangeDragState6
                                      |> notifyMouseUp ChangeDragState6, 
                                     
                                       case model.dragState1 of

                                          MouseDown1 -> group [square 200 
                                                                |> ghost 
                                                                |> notifyMouseMoveAt Drag1,

                                                               rect 50 70 
                                                                |> filled black 
                                                                |> scaleX 0.5 
                                                                |> move (-70,0)
                                                                |> notifyEnter (if (model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500)) && (model.pos6 == (500,500))
                                                                                then CleanPass
                                                                                else Pass1)]

                                          Released1 -> group [], 

                                       case model.dragState2 of

                                          MouseDown2 -> group [square 200 
                                                                |> ghost 
                                                                |> notifyMouseMoveAt Drag2,

                                                               rect 50 70 
                                                                |> filled black 
                                                                |> scaleX 0.5 
                                                                |> move (-70,0)
                                                                |> notifyEnter (if (model.pos1 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500)) && (model.pos6 == (500,500))
                                                                                then CleanPass
                                                                                else Pass2)]
                                          Released2 -> group [],

                                       case model.dragState3 of

                                          MouseDown3 -> group [square 200 
                                                                |> ghost 
                                                                |> notifyMouseMoveAt Drag3,

                                                               rect 50 70 
                                                                |> filled black
                                                                |> scaleX 0.5 
                                                                |> move (-70,0)
                                                                |> notifyEnter (if (model.pos1 == (500,500)) && (model.pos2 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500)) && (model.pos6 == (500,500))
                                                                                then CleanPass
                                                                                else Pass3)]

                                          Released3 -> group [], 

                                       case model.dragState4 of

                                          MouseDown4 -> group [square 200 
                                                                |> ghost 
                                                                |> notifyMouseMoveAt Drag4,

                                                               rect 50 70 
                                                                |> filled black 
                                                                |> scaleX 0.5 
                                                                |> move (-70,0)
                                                                |> notifyEnter (if (model.pos1 == (500,500)) && (model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos5 == (500,500)) && (model.pos6 == (500,500))
                                                                                then CleanPass
                                                                                else Pass4)]
                                          Released4 -> group [], 

                                       case model.dragState5 of

                                          MouseDown5 -> group [square 200 
                                                                |> ghost 
                                                                |> notifyMouseMoveAt Drag5,

                                                               rect 50 70 
                                                                |> filled black 
                                                                |> scaleX 0.5 
                                                                |> move (-70,0)
                                                                |> notifyEnter (if (model.pos1 == (500,500)) && (model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos6 == (500,500))
                                                                                then CleanPass
                                                                                else Pass5)]

                                          Released5 -> group [], 

                                       case model.dragState6 of

                                          MouseDown6 -> group [square 200 
                                                                |> ghost 
                                                                |> notifyMouseMoveAt Drag6,

                                                               rect 50 70 
                                                                |> filled black 
                                                                |> scaleX 0.5 
                                                                |> move (-70,0)
                                                                |> notifyEnter (if (model.pos1 == (500,500)) && (model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500))
                                                                                then CleanPass
                                                                                else Pass6)]

                                          Released6 -> group [],
                    
                                          text model.cleanMessage
                                           |> customFont "Courier New"
                                           |> bold
                                           |> centered
                                           |> filled darkRed
                                           |> addOutline (solid 0.5) darkPurple
                                           |> move(-10,45), 

                                          rect 150 10
                                           |> filled black
                                           |> move (30,60),

                                          text "Swipe the leaves to complete the task!"
                                           |> customFont "Courier New"
                                           |> filled green
                                           |> scale 0.5
                                           |> move (-43, 58),

                                          timer model
                                           |> move (-70,53)
                                          ]
                
                    Security -> [ background,
                                  
                                  secBlueprint
                                   |> scale 1.1
                                   |> rotate (degrees 90)
                                   |> move (10,0)
                                   |> addOutline (solid 0.5) (rgb 15 255 50),
                                  
                                  line (0,100) (0,0)
                                   |> outlined (dashed 1) (rgb 15 255 50)
                                   |> move (-17,10),
                                  
                                  line (0,0) (0,-200)
                                   |> outlined (solid 1) (rgb 15 255 50)
                                   |> move (-17,30),
                                  
                                  line (0,0) (-50,0)
                                   |> outlined (solid 1) (rgb 15 255 50)
                                   |> move (-17,22),
                                  
                                  reactorButton
                                   |> addOutline (solid 1) (rgb 15 255 50)
                                   |> scale 1
                                   |> move (-2,22)
                                   |> notifyTap P2L,
                                   
                                  lowerEngineButton
                                   |> move (-15,0)
                                   |> notifyTap P2LD,
                                  
                                  text "Security"
                                   |> centered
                                   |> bold
                                   |> customFont "Courier New"
                                   |> filled black
                                   |> scale 0.6
                                   |> move (50,35),
                                  
                                  crewmate red
                                   |> scale 0.4
                                   |> move (60,10)
                                  ]
                    Electrical -> [ background,
                                    
                                    secBlueprint
                                     |> rotate (degrees 180)
                                     |> move (-30,0)
                                     |> addOutline (solid 1) (rgb 15 255 50),
                                    
                                    line (-100,0) (0,0)
                                     |> outlined (dashed 1) (rgb 15 255 50)
                                     |> move (-50,-25),
                                    
                                    line (0,0) (200,0)
                                     |> outlined (solid 1) (rgb 15 255 50)
                                     |> move (-50,-25),
                                    
                                    storageButton
                                     |> scale 1.3
                                     |> move (-30,0)
                                     |> notifyTap P3DR,
                                    
                                    text "Electrical"
                                     |> centered
                                     |> bold
                                     |> customFont "Courier New"
                                     |> filled black
                                     |> scale 0.6
                                     |> move (-50,35),
                                    
                                    crewmate red
                                     |> scale 0.4
                                     |> move (-60,20)
                                    ]
                    Storage -> [ background,
                                 
                                 line (-100,0) (0,0)
                                  |> outlined (dashed 1) (rgb 15 255 50)
                                  |> move (-50,-36),
                                 
                                 storageBlueprint
                                  |> addOutline (solid 1) (rgb 15 255 50)
                                  |> scale 1.3
                                  |> move (0,15),
                                 
                                 line (0,0) (50,0)
                                  |> outlined (solid 1) (rgb 15 255 50)
                                  |> move (-5.5,10),
                                 
                                 adminButton
                                  |> move (55, 10)
                                  |> notifyTap P4UR,
                                 
                                 cafeButton
                                  |> move (-8.5,80)
                                  |> notifyTap P4U,
                                 
                                 text "Storage"
                                  |> centered
                                  |> bold
                                  |> customFont "Courier New"
                                  |> filled black
                                  |> scale 0.5
                                  |> move (-8.5,-35),
                                 
                                 crewmate red
                                  |> scale 0.3
                                  |> move (0,-45)
                                 ]
                                 
                    Admin -> [ background,
                               
                               secBlueprint
                                |> rotate (degrees 90)
                                |> scaleX 1.4
                                |> addOutline (solid 1) (rgb 15 255 50)
                                |> move (0,-20),
                               
                               line (0,0) (0,-50)
                                |> outlined (dashed 1) (rgb 15 255 50)
                                |> move (-36,-10),
                               
                               line (0,0) (0,50)
                                |> outlined (solid 1) (rgb 15 255 50)
                                |> move (-36,-5),
                               
                               cafeButton
                                |> move (-36.5,85)
                                |> notifyTap P4LU,
                               
                               text "Admin"
                                |> centered
                                |> bold
                                |> customFont "Courier New"
                                |> filled black
                                |> scale 0.5
                                |> move (48,0),
                               
                               crewmate red
                                |> scale 0.35
                                |> move (25,15),
                               
                               leaves
                                |> move (70,-15)
                                |> notifyTap ClickSwipeTask
                               ]
                               
                    SwipeTask -> [ backgroundAdmin,
                                   
                                   walletBack 
                                    |> scaleX 0.8
                                    |> move (0,-10),
                                   
                                   dragging model model.dragState,
                                   
                                   redLight,
                                   
                                   greenLight,
                                   
                                   walletFront
                                    |> scaleX 0.8
                                    |> move (0,-10)
                                   ]
                                   
                    AdminComplete -> [ backgroundAdmin,
                                      
                                       walletBack
                                        |> scaleX 0.8
                                        |> move (0,-10),
                                       
                                       card
                                        |> move (0,-40),
                                       
                                       cardReaderTop model.cardMessage,
                                       
                                       redLight,
                                       
                                       greenLight,
                                     
                                       walletFront
                                        |> scaleX 0.8
                                        |> move (0,-10),
                                       
                                       continue
                                        |> scale 0.8
                                        |> move (75, 50)
                                        |> notifyTap AdminContinue
                                       ]
                    
                    ReactorComplete -> [ rect 200 200
                                          |> filled black,
                                         
                                         text "Successful"
                                          |> customFont "Courier New"
                                          |> centered
                                          |> bold
                                          |> filled (rgb 15 255 50)
                                          |> move (0, 20),
                                         
                                         continue
                                          |> move (0,-10)
                                          |> notifyTap LeavesContinue
                                       ]
                                       
                                      
type Msg = Tick Float GetKeyState
           | Start
           | P1L | P1LD | P1UL
           | P2D | P2DL | P2DR | P2L | P2LD | P2R | P2RD 
           | P3RDR | P3RDRU | P3DR 
           | P4UR | P4U | P4LU
           | ClickSwipeTask | SwipePass | SwipeFail 
           | DragAdmin (Float, Float) | ChangeDragState | ChangeCardPosition | ChangeMessage
           | LeavesTask | CleanPass 
           | Drag (Float, Float) | Drag1 (Float, Float) | Drag2 (Float, Float) | Drag3 (Float, Float) | Drag4 (Float, Float) | Drag5 (Float, Float) | Drag6 (Float, Float) 
           | ChangeDragState1 | ChangeDragState2 | ChangeDragState3 | ChangeDragState4 | ChangeDragState5 | ChangeDragState6 
           | Pass1 | Pass2 | Pass3 | Pass4 | Pass5 | Pass6 
           | CleanFail
           | AdminContinue
           | LeavesContinue
           
type State = Welcome | Cafeteria | UpperEngine | MedBay | LowerEngine | Reactor | CleanUpTask | Security | Electrical | Storage | Admin | SwipeTask | AdminComplete | ReactorComplete
           
           update msg model = case msg of Tick t _ -> if ((model.time - model.startTime) > 30) && (model.state == CleanUpTask)
                                                      then { model | startTime = model.time, 
                                                             mouse = Released, 
                                                             dragState1 = Released1, 
                                                             dragState2 = Released2, 
                                                             dragState3 = Released3, 
                                                             dragState4 = Released4, 
                                                             dragState5 = Released5, 
                                                             dragState6 = Released6, 
                                                             pos1 = (0,50), 
                                                             pos2 = (30,30), 
                                                             pos3 = (30,0), 
                                                             pos4 = (0,-30),
                                                             pos5 = (30,-30),
                                                             pos6 = (40,-40), 
                                                             cleanMessage = "Try Again" }
                                                      else { model | time = t}
                                        
                                        Start -> case model.state of Welcome -> { model | state = Cafeteria }
                                                                                  otherwise -> model
                                                                                  P1L -> case model.state of Cafeteria -> { model | state = UpperEngine }
                                                                                              otherwise -> model
                                                                                  P1LD -> case model.state of Cafeteria -> { model | state = MedBay }
                                                                                              otherwise -> model
                                                                                  P1UL -> case model.state of MedBay -> { model | state = UpperEngine }
                                                                                              otherwise -> model
                                                                                  P2D -> case model.state of UpperEngine -> { model | state = LowerEngine } 
                                                                                              otherwise -> model
                                                                                  P2DL -> case model.state of UpperEngine -> { model | state = Reactor } 
                                                                                              otherwise -> model
                                                                                  P2DR -> case model.state of UpperEngine -> { model | state = Security } 
                                                                                              otherwise -> model 
                                                                                  P2L -> case model.state of Security -> { model | state = Reactor }
                                                                                              otherwise -> model 
                                                                                  P2LD -> case model.state of Security -> { model | state = LowerEngine } 
                                                                                              otherwise -> model
                                                                                  P2R -> case model.state of Reactor -> { model | state = Security }
                                                                                              otherwise -> model
                                                                                  P2RD -> case model.state of Reactor -> { model | state = LowerEngine }
                                                                                              otherwise -> model
                                                                                  P3RDR -> case model.state of LowerEngine -> { model | state = Storage } 
                                                                                              otherwise -> model
                                                                                  P3RDRU -> case model.state of LowerEngine -> { model | state = Electrical } 
                                                                                              otherwise -> model
                                                                                  P3DR -> case model.state of Electrical -> { model | state = Storage }
                                                                                              otherwise -> model 
                                                                                  P4UR -> case model.state of Storage -> { model | state = Admin } 
                                                                                              otherwise -> model
                                                                                  P4LU -> case model.state of Admin -> { model | state = Cafeteria } 
                                                                                              otherwise -> model
                                                                                  P4U -> case model.state of Storage -> { model | state = Cafeteria }
                                                                                              otherwise -> model
                                                                                  ClickSwipeTask -> case model.state of Admin -> { model | state = SwipeTask , cardPosition = InWallet, dragState = Wallet, cardMessage = Wait, pos = (-40,25)} 
                                                                                              otherwise -> model 
                                                                                  SwipePass -> case model.state of SwipeTask -> { model | state = AdminComplete, cardPosition = InWallet, pos = (-40,25), dragState = Wallet, cardMessage = Successful} 
                                                                                              otherwise -> model
                                                                                  AdminContinue -> case model.state of AdminComplete -> { model | state = Admin} 
                                                                                              otherwise -> model
                                                                                  SwipeFail -> case model.state of SwipeTask -> { model | state = SwipeTask, cardPosition = InReader, dragState = ReleasedC, pos = (-40,25), cardMessage = model.cardMessage} 
                                                                                              otherwise -> model
                                                                                  DragAdmin (x, y) -> { model | pos = (x,25)} 
                                                                                  ChangeDragState -> { model | dragState = case model.dragState of Wallet -> ReleasedW 
                                                                                                                                                   ReleasedW -> Dragging
                                                                                                                                                   Dragging -> ReleasedC
                                                                                                                                                   ReleasedC -> Dragging, 
                                                                                                       timeAdmin = model.time,cardMessage = case model.dragState of Dragging -> adminTask2 model.pos (model.time - model.timeAdmin) 0 
                                                                                                                                                                    ReleasedW -> Wait
                                                                                                                                                                    ReleasedC -> model.cardMessage
                                                                                                                                                                    Wallet -> Wait}
                                                                                  ChangeCardPosition -> { model | cardPosition = case model.cardPosition of InWallet -> InReader
                                                                                                                                                            InReader -> InReader}
                                                                                  ChangeMessage -> { model | cardMessage = case model.dragState of Wallet -> Wait
                                                                                                                                                   Dragging -> adminTask2 model.pos (model.time - model.timeAdmin) 0
                                                                                                                                                   ReleasedW -> Wait
                                                                                                                                                   ReleasedC -> model.cardMessage,
                                                                                                                                                   pos = (-40,25)}
                                                                                  CleanFail -> case model.state of CleanUpTask -> { model | state = CleanUpTask, mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6}
                                                                                              otherwise -> model
                                                                                  LeavesTask -> case model.state of Reactor -> { model | state = CleanUpTask, time = 0,startTime = model.time, cleanMessage = ""}
                                                                                              otherwise -> model
                                                                                  CleanPass -> case model.state of CleanUpTask -> { model | state = ReactorComplete, startTime = model.time, mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos1 = (0,50), pos2 = (30,30), pos3 = (30,0), pos4 = (0,-30), pos5 = (30,-30), pos6 = (40,-40) }
                                                                                              otherwise -> model
                                                                                  LeavesContinue -> case model.state of ReactorComplete -> { model | state = Reactor}
                                                                                              otherwise -> model
                                                                                  Drag1 (x, y) -> { model | pos1 = (x, y) }
                                                                                  Drag2 (x, y) -> { model | pos2 = (x, y) }
                                                                                  Drag3 (x, y) -> { model | pos3 = (x, y) }
                                                                                  Drag4 (x, y) -> { model | pos4 = (x, y) }
                                                                                  Drag5 (x, y) -> { model | pos5 = (x, y) }
                                                                                  Drag6 (x, y) -> { model | pos6 = (x, y) }
                                                                                  Drag (x, y) -> { model | pos = (x, y) }
                                                                                  ChangeDragState1 -> { model | dragState1 = case model.dragState1 of Released1 -> MouseDown1
                                                                                                                                                      MouseDown1 -> Released1 }
                                                                                  ChangeDragState2 -> { model | dragState2 = case model.dragState2 of Released2 -> MouseDown2 
                                                                                                                                                      MouseDown2 -> Released2 }
                                                                                  ChangeDragState3 -> { model | dragState3 = case model.dragState3 of Released3 -> MouseDown3
                                                                                                                                                      MouseDown3 -> Released3 }
                                                                                  ChangeDragState4 -> { model | dragState4 = case model.dragState4 of Released4 -> MouseDown4
                                                                                                                                                      MouseDown4 -> Released4 }
                                                                                  ChangeDragState5 -> { model | dragState5 = case model.dragState5 of Released5 -> MouseDown5
                                                                                                                                                      MouseDown5 -> Released5 }
                                                                                  ChangeDragState6 -> { model | dragState6 = case model.dragState6 of Released6 -> MouseDown6
                                                                                                                                                      MouseDown6 -> Released6 }
                                                                                  Pass1 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos1 = (500,500) }
                                                                                  Pass2 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos2 = (500,500) }
                                                                                  Pass3 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos3 = (500,500) }
                                                                                  Pass4 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos4 = (500,500) }
                                                                                  Pass5 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos5 = (500,500) }
                                                                                  Pass6 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos6 = (500,500) }
                                                                                  
type alias Model = { time : Float, state : State, timeAdmin : Float, dragState : DragState, cardPosition : CardPosition, cardMessage : CardMessage, pos : (Float, Float), time3 : Float, mouse: MousePressStates, dragState1 : MousePressStates1, dragState2 : MousePressStates2, dragState3 : MousePressStates3, dragState4 : MousePressStates4, dragState5 : MousePressStates5, dragState6 : MousePressStates6, pos1: (Float,Float), pos2: (Float,Float), pos3: (Float,Float), pos4: (Float,Float), pos5: (Float,Float), pos6: (Float,Float), startTime : Float, cleanMessage : String}
                     init : Model
                     init = { time = 0, state = Welcome, timeAdmin = 0, dragState = Wallet, cardPosition = InWallet, cardMessage = Wait, pos = (-40,25), time3 = 0, mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, startTime = 0, pos1 = (0,50), pos2 = (30,30), pos3 = (30,0), pos4 = (0,-30), pos5 = (30,-30), pos6 = (40,-40), cleanMessage = ""}

{----------------------------------------------------------------------------------------------Artwork----------------------------------------------------------------------------------------------}
welcomeBackground model = group [background,
                                 star
                                  |> move (-50, 50)
                                  |> move (repeatDistance 15 200 -50 (model.time), 0),
                                 star
                                  |> move (50, 40)
                                  |> move (repeatDistance 15 200 -50 (model.time), 0),
                                 star
                                  |> move (50, -50)
                                  |> move (repeatDistance 15 200 -50 (model.time), 0),
                                 star
                                  |> move (0, -40)
                                  |> move (repeatDistance 15 200 -50 (model.time), 0),
                                 star
                                  |> move (75, 5)
                                  |> move (repeatDistance 15 200 -50 (model.time), 0),
                                 star
                                  |> move (-75, -50)
                                  |> move (repeatDistance 15 200 -50 (model.time), 0),
                                 star
                                  |> move (-70, -15)
                                  |> move (repeatDistance 15 200 -50 (model.time), 0),
                                 crewmate red
                                  |> scale 0.5
                                  |> move (-70,20)
                                  |> rotate (degrees 45)
                                  |> move (5 * sin model.time, 5 * sin model.time),
                                 crewmate yellow
                                  |> scale 0.5
                                  |> rotate model.time
                                  |> move (50,30),
                                 crewmate green
                                  |> scale 0.5
                                  |> rotate (degrees 225)
                                  |> move (-50,20)
                                  |> move (3 * sin model.time, 3 * cos model.time),
                                 crewmate darkBlue
                                  |> rotate (2*model.time)
                                  |> scale 0.5
                                  |> move (100 * (sin (0.25*model.time)), 10 * sin model.time),
                                 crewmate purple
                                  |> scale 0.5
                                  |> rotate (-1 * model.time)
                                  |> move (75,-50)
                                ]
background = rect 300 300 |> filled black

star = circle 1 |> filled white

crewmate colour = group [leg colour |> move (-4,-13), 
                         leg colour |> move (4, -13),
                         body colour]
                         
body colour = group [roundedRect 15 18 5
                      |> filled colour
                      |> addOutline (solid 1) black
                      |> move (10, 3),
                     
                     roundedRect 20 30 7
                      |> filled colour
                      |> addOutline (solid 1) black,

                     oval 20 15
                      |> filled (rgb 105 185 255)
                      |> addOutline (solid 1) black
                      |> move (-3,6),
  
                     curve (0,0) [Pull (13,1) (20,-10)]
                      |> filled white
                      |> scale 0.4
                      |> move (-3, 12)
                    ]
                    
leg colour = group [roundedRect 5 15 3
                     |> filled colour
                     |> addOutline (solid 1) black
                    ]

startButton = group [roundedRect 30 15 5 
                      |> filled lightCharcoal
                      |> addOutline (solid 1) darkCharcoal,
                     
                     text "START"
                      |> centered
                      |> customFont "Comic Sans MS"
                      |> filled white
                      |> scale 0.5
                      |> move (0,-2)
                    ]

cafeBlueprint = group [ngon 8 30
                        |> filled blue
                        |> rotate (degrees 23)
                        |> move (65,0),
                       rect 102.5 5
                        |> filled lightBlue
                        |> move (-14,0)
                       ]
                       
upperEngineButton = group [ngon 5 30
                            |> filled black
                            |> addOutline (solid 0.5) (rgb 15 255 50)
                            |> rotate (degrees 180)
                            |> move (-90,0),
                           
                           text "Upper"
                            |> centered
                            |> customFont "Courier New"
                            |> filled (rgb 15 255 50)
                            |> scale 0.5
                            |> move (-80,5),
                           
                           text "Engine"
                            |> centered
                            |> customFont "Courier New"
                            |> filled (rgb 15 255 50)
                            |> scale 0.5 
                            |> move (-80,-5)
                          ]
                          
medbayButton = group [rect 30 25
                       |> filled black
                       |> addOutline (solid 0.5) (rgb 15 255 50)
                       |> move (0,-45),
                      
                      text "Medbay"
                       |> centered
                       |> customFont "Courier New"
                       |> filled (rgb 15 255 50)
                       |> scale 0.5
                       |> move (0,-45)
                      ]

ueBlueprint = group [polygon [(-50,50), (0,50), (20,25), (20,-25), (0,-50), (-70,-50), (-70,25)]
                      |> filled blue
                      |> scale 0.4
                      |> move (10,40),
                     
                     rect 65 10
                      |> filled lightBlue
                      |> move (-12.5,0)
                      |> rotate (degrees 90)
                     ]

lowerEngineButton = group [rect 50 20
                            |> filled black
                            |> addOutline (solid 0.5) (rgb 15 255 50)
                            |> move (0,-55.5),
                           
                           text "Lower Engine"
                            |> centered
                            |> customFont "Courier New"
                            |> filled (rgb 15 255 50)
                            |> scale 0.5
                            |> move (0,-56)
                          ]
                          
securityButton = group [rect 30 35
                         |> filled black
                         |> addOutline (solid 0.5) (rgb 15 255 50)
                         |> move (60,0),
                        
                        text "Security"
                         |> centered
                         |> customFont "Courier New"
                         |> filled (rgb 15 255 50)
                         |> scale 0.5
                         |> move (60,0)
                       ]

reactorButton = group [rect 20 20
                        |> filled black
                        |> move (-55,0),
                       
                       wedge 25 0.5
                        |> filled black
                        |> rotate (degrees 180)
                        |> move (-60,0),
                       
                       text "Reactor"
                        |> centered
                        |> customFont "Courier New"
                        |> filled (rgb 15 255 50)
                        |> scale 0.5
                        |> move (-65,0)
                      ]

mbBlueprint = group [rect 50 50
                      |> filled blue
                      |> move (20,-35),
                     
                     rect 20 10
                      |> filled lightBlue
                      |> move (0,-20)
                      |> rotate (degrees 90)
                     ]
                     
secBlueprint = group [rect 50 50
                       |> filled blue
                       |> move (20,-35),
                      
                      rect 35 10
                       |> filled lightBlue
                       |> move (7.5,-20)
                       |> rotate (degrees 90)
                     ]

reacBlueprint = group [rect 20 20
                        |> filled blue
                        |> scale 1.5
                        |> move (-40,0),
                       
                       wedge 30 0.5
                        |> filled blue
                        |> scale 1.5
                        |> rotate (degrees 180)
                        |> move (-50,0),
                       
                       rect 35 10
                        |> filled lightBlue
                        |> move (-7.5,0)
                      ]
                      
leaves = group [circle 7  
                 |> filled (rgb 237 255 0)
                 |> addOutline (solid 1) yellow,
                
                oval 2 7
                 |> filled yellow
                 |> addOutline (solid 0.5) brown
                 |> move (0,2),
                
                circle 0.75
                 |> filled yellow
                 |> addOutline (solid 0.5) brown
                 |> move (0,-4)]
                
leBlueprint = group [polygon [(-50,0), (0,0), (0,-50), (-35,-50), (-50,-35)]
                      |> filled blue
                      |> move (-40, 55),
                     
                     rect 20 10
                      |> filled lightBlue
                      |> move (-30,30),
                     
                     rect 10 60 
                      |> filled lightBlue
                      |> move (-20,5),
                     
                     rect 90 10
                      |> filled lightBlue
                      |> move (20,-20)
                    ]

storageButton = group [rect 40 40
                        |> filled black
                        |> addOutline (solid 0.5) (rgb 15 255 50)
                        |> move (85 ,-20),
                       
                       text "Storage"
                        |> centered
                        |> customFont "Courier New"
                        |> filled (rgb 15 255 50)
                        |> scale 0.5
                        |> move (81,-20)
                      ]

electricalButton = group [rect 40 30
                           |> filled black
                           |> addOutline (solid 0.5) (rgb 15 255 50)
                           |> move (25,30),
                          
                          text "Electrical"
                           |> centered
                           |> customFont "Courier New"
                           |> filled (rgb 15 255 50)
                           |> scale 0.5
                           |> move (25,30)
                         ]
                         
storageBlueprint = group [rect 5 60 
                           |> filled lightBlue
                           |> move (-7,-13),
                          
                          rect 20 10
                           |> filled blue
                           |> move (-30,-40),
                          
                          ngon 6 20
                           |> filled blue
                           |> move (-7,-40)
                         ]

adminButton = group [rect 40 30
                      |> filled black
                      |> addOutline (solid 0.5) (rgb 15 255 50),
                     
                     text "Admin"
                      |> centered
                      |> customFont "Courier New"
                      |> filled (rgb 15 255 50)
                      |> scale 0.5
                    ]

cafeButton = group [ngon 8 50 
                     |> filled black
                     |> addOutline (solid 0.5) (rgb 15 255 50)
                     |> rotate (degrees 23),
                     
                    text "Cafeteria"
                     |> centered
                     |> customFont "Courier New"
                     |> filled (rgb 15 255 50)
                     |> scale 0.5
                     |> move (0,-30)
                    ]
                    
----------------------------------------------------------------------------------------------- Admin Task--------------------------------------------------------------------------------------------------
dragging model state = case state of Wallet -> group [card
                                                       |> move (cardMove model.cardPosition)
                                                       |> notifyTap ChangeCardPosition
                                                       |> notifyMouseDown ChangeDragState,
                                                      
                                                      cardReaderTop Wait,
                                                      
                                                      text (Debug.toString (model.cardMessage))
                                                       |> size 4
                                                       |> filled white
                                                       |> move (80,-60)
                                                      ]
                                                      
                                    ReleasedW -> group [card
                                                         |> move model.pos
                                                         |> notifyMouseDown ChangeDragState,
                                                        
                                                        cardReaderTop Wait,
                                                        
                                                        text (Debug.toString (model.cardMessage))
                                                         |> size 4
                                                         |> filled white
                                                         |> move (80,-60)
                                                        ]
                                    
                                    ReleasedC -> group [card
                                                         |> move model.pos
                                                         |> notifyMouseDown ChangeDragState,
                                                        
                                                        cardReaderTop model.cardMessage
                                                       ]
                                    
                                    Dragging -> group [card
                                                        |> move model.pos
                                                        |> notifyMouseDown ChangeDragState
                                                        |> notifyMouseUp ChangeDragState
                                                        |> notifyMouseUp ChangeMessage
                                                        |> notifyMouseUp (adminTask1 model.pos (model.time - model.timeAdmin)),
                                                       
                                                       cardReaderTop model.cardMessage,
                                                       
                                                       rect 400 400 
                                                        |> ghost
                                                        |> notifyMouseMoveAt DragAdmin
                                                        |> notifyMouseUp ChangeDragState
                                                        |> notifyMouseUpAt DragAdmin
                                                        |> notifyMouseUp ChangeMessage
                                                        |> notifyMouseUp (adminTask1 model.pos (model.time - model.timeAdmin))
                                                      ]
                                                      

adminTask1 (x,y) time = if (x > 55 && time > 1 && time <= 2) 
                        then SwipePass
                        else SwipeFail

adminTask2 (x,y) time m = if (x > 55 && time > 1 && time <= 2)
                          then Successful
                          else (if (x > 55 && time > 2)
                                then Slow 
                                else (if (x > 55 && time <= 1 && time >= 0)
                                      then Fast 
                                      else BadRead))
                                      
cardMessage message = case message of Wait -> "PLEASE SWIPE CARD..." 
                                      Fast -> "TOO FAST. TRY AGAIN"
                                      Slow -> "TOO SLOW. TRY AGAIN"
                                      BadRead -> "BAD READ. TRY AGAIN"
                                      Successful -> "SUCCESSFUL "

cardMove cardpos = case cardpos of InWallet -> (0,-40)
                                   InReader -> (-40,25)
                                   
type CardPosition = InWallet | InReader
type DragState = Wallet | ReleasedW | Dragging | ReleasedC
type CardMessage = Wait | Fast | Slow | BadRead | Successful

backgroundAdmin = group [rect 200 200 
                          |> filled black,

                         roundedRect 100 20 5
                          |> filled darkCharcoal
                          |> move (0,10)
                          |> addOutline (solid 1) (black),
                         
                         rect 100 70
                          |> filled charcoal
                          |> move (0,-30)
                          |> addOutline (solid 1) black
                        ]
                        
cardReaderTop message = group [roundedRect 100 50 5
                                |> filled darkCharcoal
                                |> move (0,50)
                                |> addOutline (solid 1) black,
                               
                               rect 90 10
                                |> filled (rgb 40 125 80)
                                |> move (0,55)
                                |> addOutline (solid 1) (black),

                               text (cardMessage message)
                                |> centered
                                |> customFont "Courier New"
                                |> filled white
                                |> scale 0.5
                                |> move (-8,54)
                              ]
                              
--redLight = group [circle 3 |> filled red |> move (32,33) |> addOutline (solid 0.7) black,
shine |> move (34.2,33.5) ]

greenLight = group [ circle 3 |> filled green |> move (40,33) |> addOutline (solid 0.7) black,
shine |> move (42,33.5) ]  shine = curve (0,0) [Pull (10,10) (10,20)] |> filled white |> rotate (degrees 90) |> scale 0.75 |> scale 0.2
-- Admin card design card = group [ roundedRect 70 45 5 |> filled lightGray |> addOutline (solid 1) black,
square 20 |> filled white |> move (-20,5),
text "Crewmate 1" |> customFont "Courier New" |> filled black |> move (-10,5) |> scale 0.5,  crewmate red |> scale 0.5 |> move (-20,0),  rect 22 10 |> filled lightGray |> move (-20,-10),  line (0,0) (60,0) |> outlined (solid 0.5) black |> move (-30,-8),  line (0,0) (60,0) |> outlined (solid 0.5) black |> move (-30,-13),  line (0,0) (60,0) |> outlined (solid 0.5) black |> move (-30,-18)
]  -- wallet design walletFront = group [ curve (10.312,-23.40) [Pull (10.312,-24.71) (10.312,-26.02),Pull (10.148,-39.44) (9.9846,-52.86),Pull (36.664,-53.03) (63.345,-53.19),Pull (64.654,-31.42) (65.964,-9.657),Pull (57.289,-11.45) (48.613,-13.25),Pull (39.774,-16.36) (30.936,-19.47),Pull (30.936,-19.47) (30.936,-19.47),Pull (25.534,-20.62) (20.132,-21.76),Pull (15.549,-22.42) (10.312,-23.40)] |> filled (rgb 101 67 33) |> addOutline (solid 1) black
, curve (16.859,-28.31) [Pull (16.859,-34.70) (16.859,-41.08),Pull (16.695,-46.15) (16.531,-51.23),Pull (16.368,-51.88) (16.204,-52.54),Pull (36.992,-52.70) (57.780,-52.86),Pull (58.434,-35.02) (59.089,-17.18),Pull (55.161,-18.33) (51.232,-19.47),Pull (48.286,-20.62) (45.340,-21.76),Pull (42.557,-22.75) (39.774,-23.73),Pull (34.046,-25.04) (28.317,-26.35),Pull (22.588,-26.84) (16.859,-28.31)] |> filled lightBlue |> addOutline (solid 1) black  , roundedRect 10 60 3 |> filled (rgb 101 67 33) |> move (6,-55) |> addOutline (solid 0.5) black
, curve (-66.61,-19.80) [Pull (-52.37,-17.51) (-38.13,-15.22),Pull (-36.82,-15.22) (-35.51,-15.22),Pull (-31.26,-16.04) (-27.00,-16.85),Pull (-23.40,-17.67) (-19.80,-18.49),Pull (-15.54,-19.80) (-11.29,-21.11),Pull (-4.910,-23.57) (1.4731,-26.02),Pull (1.4731,-26.02) (1.4731,-26.02),Pull (2.2915,-31.59) (3.1099,-37.15),Pull (3.4373,-43.04) (3.7647,-48.94),Pull (3.7647,-50.90) (3.7647,-52.86),Pull (-28.64,-52.86) (-61.05,-52.86),Pull (-63.83,-36.33) (-66.61,-19.80)] |> filled (rgb 101 67 33) |> addOutline (solid 1) black
, curve (2.1278,-34.20) [Pull (-12.27,-28.97) (-26.68,-23.73),Pull (-30.93,-23.24) (-35.19,-22.75),Pull (-40.10,-22.58) (-45.01,-22.42),Pull (-53.85,-23.89) (-62.69,-25.37),Pull (-64,-25.86) (-65.30,-26.35),Pull (-65.30,-26.51) (-65.30,-26.68),Pull (-62.03,-26.02) (-58.76,-25.37),Pull (-51.88,-24.55) (-45.01,-23.73),Pull (-40.42,-23.73) (-35.84,-23.73),Pull (-31.42,-24.38) (-27.00,-25.04),Pull (-22.75,-26.18) (-18.49,-27.33),Pull (-11.45,-29.79) (-4.419,-32.24),Pull (-1.145,-33.39) (2.1278,-34.20)] |> filled black
, curve (-64.98,-33.22) [Pull (-59.58,-32.08) (-54.17,-30.93),Pull (-54.17,-30.93) (-54.17,-30.93),Pull (-50.90,-30.44) (-47.63,-29.95),Pull (-43.70,-29.95) (-39.77,-29.95),Pull (-31.26,-30.93) (-22.75,-31.91),Pull (-22.75,-31.91) (-22.75,-31.91),Pull (-10.47,-35.35) (1.8005,-38.79),Pull (1.8005,-38.79) (1.8005,-38.79),Pull (-8.511,-36.50) (-18.82,-34.20),Pull (-26.51,-32.90) (-34.20,-31.59),Pull (-37.97,-31.59) (-41.73,-31.59),Pull (-45.34,-31.59) (-48.94,-31.59),Pull (-54.99,-32.40) (-61.05,-33.22),Pull (-62.52,-33.39) (-64.98,-33.22)] |> filled black
, curve (-63.34,-39.44) [Pull (-50.41,-38.79) (-37.48,-38.13),Pull (-29.13,-38.30) (-20.78,-38.46),Pull (-20.78,-38.46) (-20.78,-38.46),Pull (-17.84,-38.95) (-14.89,-39.44),Pull (-11.13,-40.10) (-7.365,-40.75),Pull (-2.946,-41.24) (1.4731,-41.73),Pull (1.6368,-42.23) (1.8005,-42.72),Pull (-7.202,-41.57) (-16.20,-40.42),Pull (-21.27,-40.10) (-26.35,-39.77),Pull (-39.93,-39.77) (-53.52,-39.77),Pull (-56.63,-39.77) (-59.74,-39.77),Pull (-60.89,-40.10) (-63.34,-39.44)] |> filled black ]  walletBack = group [ curve (65.964,-9.329) [Pull (65.636,-22.09) (65.309,-34.86),Pull (65.309,-34.86) (65.309,-34.86),Pull (65.145,-40.59) (64.982,-46.32),Pull (64.982,-49.75) (64.982,-53.19),Pull (1.9641,-53.36) (-61.05,-53.52),Pull (-62.19,-50.08) (-63.34,-46.64),Pull (-63.50,-43.21) (-63.67,-39.77),Pull (-65.80,-29.79) (-67.92,-19.80),Pull (-62.52,-17.84) (-57.12,-15.87),Pull (-53.52,-14.73) (-49.92,-13.58),Pull (-44.84,-12.43) (-39.77,-11.29),Pull (-31.09,-10.80) (-22.42,-10.31),Pull (-13.09,-10.63) (-3.764,-10.96),Pull (1.8005,-11.29) (7.3657,-11.62),Pull (14.731,-11.78) (22.097,-11.94),Pull (31.918,-12.27) (41.739,-12.60),Pull (41.739,-12.60) (41.739,-12.60),Pull (45.994,-12.27) (50.250,-11.94),Pull (53.033,-11.78) (65.964,-9.329)] |> filled (rgb 101 67 33) |> addOutline (solid 1) black
, curve (-66.61,-18.82) [Pull (-58.10,-15.87) (-49.59,-12.93),Pull (-39.93,-11.78) (-30.28,-10.63),Pull (-19.96,-10.47) (-9.657,-10.31),Pull (-4.092,-10.31) (1.4731,-10.31),Pull (7.0383,-10.80) (12.603,-11.29),Pull (18.659,-11.78) (24.716,-12.27),Pull (26.352,-12.43) (27.989,-12.60),Pull (34.209,-12.43) (40.429,-12.27),Pull (43.703,-12.27) (46.976,-12.27),Pull (49.759,-11.94) (52.542,-11.62),Pull (59.416,-10.31) (66.291,-9.002),Pull (46.322,-14.89) (26.352,-20.78),Pull (22.588,-21.60) (18.823,-22.42),Pull (14.731,-23.24) (10.639,-24.06),Pull (10.639,-24.06) (10.639,-24.06),Pull (10.639,-25.20) (10.639,-26.35),Pull (6.2199,-27.17) (1.8005,-27.98),Pull (1.4731,-27.17) (1.1457,-26.35),Pull (-7.856,-22.91) (-16.85,-19.47),Pull (-20.95,-18.16) (-25.04,-16.85),Pull (-27.00,-16.53) (-28.97,-16.20),Pull (-32.40,-15.87) (-35.84,-15.54),Pull (-39.44,-15.38) (-43.04,-15.22),Pull (-46.64,-15.54) (-50.25,-15.87),Pull (-54.01,-16.20) (-66.61,-18.82)] |> filled (rgb 101 67 33) |> addOutline (solid 1) black
, curve (-66.61,-18.82) [Pull (-58.10,-15.87) (-49.59,-12.93),Pull (-39.93,-11.78) (-30.28,-10.63),Pull (-19.96,-10.47) (-9.657,-10.31),Pull (-4.092,-10.31) (1.4731,-10.31),Pull (7.0383,-10.80) (12.603,-11.29),Pull (18.659,-11.78) (24.716,-12.27),Pull (26.352,-12.43) (27.989,-12.60),Pull (34.209,-12.43) (40.429,-12.27),Pull (43.703,-12.27) (46.976,-12.27),Pull (49.759,-11.94) (52.542,-11.62),Pull (59.416,-10.31) (66.291,-9.002),Pull (46.322,-14.89) (26.352,-20.78),Pull (22.588,-21.60) (18.823,-22.42),Pull (14.731,-23.24) (10.639,-24.06),Pull (10.639,-24.06) (10.639,-24.06),Pull (10.639,-25.20) (10.639,-26.35),Pull (6.2199,-27.17) (1.8005,-27.98),Pull (1.4731,-27.17) (1.1457,-26.35),Pull (-7.856,-22.91) (-16.85,-19.47),Pull (-20.95,-18.16) (-25.04,-16.85),Pull (-27.00,-16.53) (-28.97,-16.20),Pull (-32.40,-15.87) (-35.84,-15.54),Pull (-39.44,-15.38) (-43.04,-15.22),Pull (-46.64,-15.54) (-50.25,-15.87),Pull (-54.01,-16.20) (-66.61,-18.82)] |> filled black ]
-------------------------------------------------------------------------------------------------- -- Leaves Task --------------------------------------------------------------------------------------------------
type MousePressStates = Released | MouseDown type MousePressStates1 = Released1 | MouseDown1 type MousePressStates2 = Released2 | MouseDown2 type MousePressStates3 = Released3 | MouseDown3 type MousePressStates4 = Released4 | MouseDown4 type MousePressStates5 = Released5 | MouseDown5 type MousePressStates6 = Released6 | MouseDown6
-- Leaf designs leaf1 colour = group [ curve (0,0) [Pull (-20,13) (-17,48), Pull (0,42) (0,61), Pull (0,42) (17,48), Pull (19,13) (0,0) ] |> filled colour,  curve (0,-5) [Pull (1,12) (0,55), Pull (0,0) (0,0)] |> outlined (solid 0.5) (rgb 0 0 0),  curve (0,0) [Pull (30,-7) (70,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees 10) |> move(0,40),  curve (0,0) [Pull (30,-7) (70,10) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees 10) |> move(0,30),  curve (0,0) [Pull (30,-7) (63,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees 10) |> move(0,20),  curve (0,0) [Pull (17,-7) (50,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees 10) |> move(0,10),
curve (0,0) [Pull (30,-7) (70,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees -10) |> move(0,35),
curve (0,0) [Pull (30,-7) (70,10) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees -10) |> move(0,25),
curve (0,0) [Pull (30,-7) (60,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25|> scaleX -1|> rotate (degrees -10)|> move(0,15),
curve (0,0) [Pull (10,-5) (38,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees -10)|> move(0,5),
curve (0,0) [Pull (30,-7) (70,0) ]|> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees -10)|> move(0,43) ]
 leaf2 colour = group [ curve (0,0) [Pull (-44,-20) (0,52), Pull (44,-20) (0,0) ] |> filled colour,  curve (0,-7) [Pull (0,0) (0,52) ] |> outlined (solid 0.5) (rgb 0 0 0),
curve (0,0) [Pull (10,-3) (21,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees -10) |> move(0,43),
curve (0,0) [Pull (30,-7) (43,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees -10) |> move(0,35),
curve (0,0) [Pull (30,-7) (66,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees -10) |> move(0,25),
curve (0,0) [Pull (30,-7) (80,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees -10) |> move(0,15),
curve (0,0) [Pull (30,-7) (86,3) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees -10) |> move(0,5),
curve (0,0) [Pull (10,-3) (21,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees 10) |> move(0,43),
curve (0,0) [Pull (30,-7) (43,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees 10) |> move(0,35),
curve (0,0) [Pull (30,-7) (66,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees 10) |> move(0,25),
curve (0,0) [Pull (30,-7) (80,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees 10) |> move(0,15),
curve (0,0) [Pull (30,-7) (86,3) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees 10) |> move(0,5) ]
garbageChuteVisual = group [ square 200 |> filled (rgb 73 117 173) |> addOutline (solid 0.75) black --white bar at side --gradient 1 , rect 120 199 |> filled (rgb 77 120 175) |> rotate (degrees 0) |> move (10, 0) --gradient 2 , rect 60 199 |> filled (rgb 82 124 178) |> move (10, 0) , cleanUpBar |> move (-70, 0) ]
cleanUpBar = group [rect 50 150 |> filled grey |> addOutline (solid 0.75) black, rect 50 70 |> filled black |> scaleX 0.5 --down arrow , triangle 4 |> filled orange |> rotate (degrees 30) |> move (0, 40) |> addOutline (solid 0.3) black --up arrow , triangle 4 |> filled orange |> rotate (degrees -30) |> move (0, -40) |> addOutline (solid 0.3) black ] continue = group [ roundedRect 40 20 5 |> filled black |> addOutline (solid 1) (rgb 15 255 50),  text "CONTINUE" |> customFont "Courier New" |> centered |> filled (rgb 15 255 50) |> scale 0.6 ]
timer model = group [ roundedRect 40 20 5 |> filled black |> addOutline (solid 1) green , text "Timer:" |> centered |> customFont "Courier New" |> filled white |> scale 0.5  ,text (Debug.toString (model.time - model.startTime)) |> centered |> size 4 |> filled white |> move (0,-7) ]
-- repeat an animation for a given duration repeatDuration : Float -> Int -> Float -> Float -> Float repeatDuration speed duration startPosition time = speed * (time - toFloat duration * toFloat (floor time // duration)) + startPosition
-- repeat an animation for a given distance repeatDistance : Float -> Float -> Float -> Float -> Float repeatDistance speed distance startPosition time = repeatDuration speed (round <| distance / speed) startPosition time
Text only submission
Aaida Arpa
Feb 7, 2021 3:55 PM
4398932

Team: Aaida Arpa, Olisha D'Mello, Prateek Mishra, Scott Macdougall, Ivan Ebos
Link: https://macoutreach.rocks/share/7ebd9db7
Code:
{- All members participated in one of the two mini-games and all members understand both games and agree that variable names are descriptive and comments are sufficient to understand the purpose of the functions. -}
myShapes model = case model.state of Welcome -> [ welcomeBackground model,  text "AMONG US" |> centered |> bold |> customFont "Comic Sans MS" |> filled white |> addOutline (solid 0.5) black |> move (0, 5) |> scale 1.5,  startButton |> move (0, -20) |> notifyTap Start ]  Cafeteria -> [ background,  cafeBlueprint |> addOutline (solid 1) (rgb 15 255 50),  text "Cafeteria" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.5 |> move (65,-2.5),  upperEngineButton |> notifyTap P1L,  line (0,0) (0,30) |> outlined (solid 0.5) (rgb 15 255 50) |> move (0,-32.5),  medbayButton |> notifyTap P1LD,  crewmate red |> scale 0.4 |> move (70,20) ]  UpperEngine -> [ background,  ueBlueprint |> addOutline (solid 1) (rgb 15 255 50),  lowerEngineButton |> notifyTap P2D,  securityButton |> notifyTap P2DR,  line (0,0) (40,0) |> outlined (solid 0.5) (rgb 15 255 50) |> move (5,0),  text "Upper" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.5 |> move (0,40),  text "Engine" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.5 |> move (0,30),  crewmate red |> scale 0.4 |> move (5,53),  reactorButton |> addOutline (solid 1) (rgb 15 255 50) |> notifyTap P2DL,  line (0,0) (-40,0) |> outlined (solid 0.5) (rgb 15 255 50) |> move (-5,0) ]  MedBay -> [ background,  mbBlueprint |> addOutline (solid 1) (rgb 15 255 50),  line (0,0) (-80,0) |> outlined (dashed 1) (rgb 15 255 50) |> move (100,10.5),  line (0,0) (120,0) |> outlined (solid 1) (rgb 15 255 50) |> move (-95,10.5),  upperEngineButton |> move (25,8) |> scale 1.3 |> notifyTap P1UL,  crewmate red |> scale 0.5 |> move (30,-45),  text "MedBay" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.75 |> move (20,-30) ]  LowerEngine -> [ background,  line (-65,100) (-65,30) |> outlined (dashed 0.5) (rgb 15 255 50) |> move (0,0),  leBlueprint |> addOutline (solid 1) (rgb 15 255 50),   line (0,0) (0,30) |> outlined (solid 1) (rgb 15 255 50) |> move (25,-14.5),  storageButton |> notifyTap P3RDR,  electricalButton |> notifyTap P3RDRU,  text "Lower" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.65 |> move (-65,40),  text "Engine" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.65 |> move (-65,30),  crewmate red |> scale 0.4 |> move (-55,18)  ] Reactor -> [ background,  reacBlueprint |> addOutline (solid 0.5) (rgb 15 255 50) |> move (0,17),  line (0,0) (0,80) |> outlined (dashed 0.5) (rgb 15 255 50) |> move (10,0),  line (0,0) (0,-100) |> outlined (solid 0.5) (rgb 15 255 50) |> move (10,22),  line (0,0) (55,0) |> outlined (solid 0.5) (rgb 15 255 50) |> move (10,17),  securityButton |> move (0,17) |> notifyTap P2R,  lowerEngineButton |> move (10,0) |> notifyTap P2RD,  text "Reactor" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.5 |> move (-40,15),  crewmate red |> scale 0.4 |> move (-60,30),  leaves |> move (-85,17) |> notifyTap LeavesTask ]  CleanUpTask -> [ rect 500 500 |> filled (rgb 173 216 230),  garbageChuteVisual,  leaf1 (rgb 250 150 0) |> scale 0.5 |> move model.pos1 |> move (-20,-40) |> move ( 4*sin(model.time), 4*sin(model.time)) |> notifyMouseDown ChangeDragState1 |> notifyMouseUp ChangeDragState1 , leaf2 (rgb 70 140 0)  |> scale 0.65 |> move (45,-30) |> move model.pos2 |> notifyMouseDown ChangeDragState2 |> move ( 4*sin(model.time), 4*sin(model.time)) |> notifyMouseUp ChangeDragState2,  leaf2 (rgb 70 140 0) |> scale 0.35 |> rotate (degrees 180) |> move model.pos3 |> move ( 4*sin(model.time), 4*sin(model.time)) |> move (30,-30) |> notifyMouseDown ChangeDragState3 |> notifyMouseUp ChangeDragState3 ,  leaf1 darkRed |> scale 0.35 |> rotate (degrees 75) |> move model.pos4 |> move (0,0) |> move ( 4*sin(model.time), 4*sin(model.time)) |> notifyMouseDown ChangeDragState4 |> notifyMouseUp ChangeDragState4 , leaf2 lightGreen |> move model.pos5 |> move (0,0) |> scale 0.5 |> move ( 4*sin(model.time), 4*sin(model.time)) |> notifyMouseDown ChangeDragState5 |> notifyMouseUp ChangeDragState5 ,
leaf2 (rgb 70 140 0) |> move model.pos6 |> move (60,0) |> scale 0.5 |> move ( 4*sin(model.time), 4*sin(model.time)) |> notifyMouseDown ChangeDragState6 |> notifyMouseUp ChangeDragState6
, case model.dragState1 of MouseDown1 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag1, rect 50 70 |> filled black |> scaleX 0.5 |> move (-70,0) |> notifyEnter (if (model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500)) && (model.pos6 == (500,500)) then CleanPass else Pass1)] Released1 -> group [] , case model.dragState2 of MouseDown2 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag2, rect 50 70 |> filled black |> scaleX 0.5 |> move (-70,0) |> notifyEnter (if (model.pos1 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500)) && (model.pos6 == (500,500)) then CleanPass else Pass2)] Released2 -> group []  , case model.dragState3 of MouseDown3 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag3, rect 50 70 |> filled black |> scaleX 0.5 |> move (-70,0) |> notifyEnter (if (model.pos1 == (500,500)) && (model.pos2 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500)) && (model.pos6 == (500,500)) then CleanPass else Pass3)] Released3 -> group []  , case model.dragState4 of MouseDown4 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag4, rect 50 70 |> filled black |> scaleX 0.5 |> move (-70,0) |> notifyEnter (if (model.pos1 == (500,500)) && (model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos5 == (500,500)) && (model.pos6 == (500,500)) then CleanPass else Pass4)] Released4 -> group []  , case model.dragState5 of MouseDown5 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag5, rect 50 70 |> filled black |> scaleX 0.5 |> move (-70,0) |> notifyEnter (if (model.pos1 == (500,500)) && (model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos6 == (500,500)) then CleanPass else Pass5)] Released5 -> group []  , case model.dragState6 of MouseDown6 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag6, rect 50 70 |> filled black |> scaleX 0.5 |> move (-70,0) |> notifyEnter (if (model.pos1 == (500,500)) && (model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500)) then CleanPass else Pass6)] Released6 -> group []  ,text model.cleanMessage |> customFont "Courier New" |> bold |> centered |> filled darkRed |> addOutline (solid 0.5) darkPurple |> move(-10,45)
, rect 150 10 |> filled black |> move (30,60)  ,text "Swipe the leaves to complete the task!" |> customFont "Courier New" |> filled green |> scale 0.5 |> move (-43, 58)   ,timer model |> move (-70,53)
 ]  Security -> [ background,  secBlueprint |> scale 1.1 |> rotate (degrees 90) |> move (10,0) |> addOutline (solid 0.5) (rgb 15 255 50),  line (0,100) (0,0) |> outlined (dashed 1) (rgb 15 255 50) |> move (-17,10),  line (0,0) (0,-200) |> outlined (solid 1) (rgb 15 255 50) |> move (-17,30),  line (0,0) (-50,0) |> outlined (solid 1) (rgb 15 255 50) |> move (-17,22),  reactorButton |> addOutline (solid 1) (rgb 15 255 50) |> scale 1 |> move (-2,22) |> notifyTap P2L,  lowerEngineButton |> move (-15,0) |> notifyTap P2LD,  text "Security" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.6 |> move (50,35),  crewmate red |> scale 0.4 |> move (60,10) ] Electrical -> [ background,  secBlueprint |> rotate (degrees 180) |> move (-30,0) |> addOutline (solid 1) (rgb 15 255 50),  line (-100,0) (0,0) |> outlined (dashed 1) (rgb 15 255 50) |> move (-50,-25),  line (0,0) (200,0) |> outlined (solid 1) (rgb 15 255 50) |> move (-50,-25),  storageButton |> scale 1.3 |> move (-30,0) |> notifyTap P3DR,  text "Electrical" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.6 |> move (-50,35),  crewmate red |> scale 0.4 |> move (-60,20)   ] Storage -> [ background,  line (-100,0) (0,0) |> outlined (dashed 1) (rgb 15 255 50) |> move (-50,-36),  storageBlueprint |> addOutline (solid 1) (rgb 15 255 50) |> scale 1.3 |> move (0,15),  line (0,0) (50,0) |> outlined (solid 1) (rgb 15 255 50) |> move (-5.5,10),  adminButton |> move (55, 10) |> notifyTap P4UR,  cafeButton |> move (-8.5,80) |> notifyTap P4U,  text "Storage" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.5 |> move (-8.5,-35),  crewmate red |> scale 0.3 |> move (0,-45)
]
 Admin -> [ background,  secBlueprint |> rotate (degrees 90) |> scaleX 1.4 |> addOutline (solid 1) (rgb 15 255 50) |> move (0,-20),  line (0,0) (0,-50) |> outlined (dashed 1) (rgb 15 255 50) |> move (-36,-10),  line (0,0) (0,50) |> outlined (solid 1) (rgb 15 255 50) |> move (-36,-5),  cafeButton |> move (-36.5,85) |> notifyTap P4LU,  text "Admin" |> centered |> bold |> customFont "Courier New" |> filled black |> scale 0.5 |> move (48,0),  crewmate red |> scale 0.35 |> move (25,15),  leaves |> move (70,-15) |> notifyTap ClickSwipeTask  ]  SwipeTask -> [ backgroundAdmin,
walletBack |> scaleX 0.8 |> move (0,-10),
dragging model model.dragState,
redLight,
greenLight,
walletFront |> scaleX 0.8 |> move (0,-10) ]  AdminComplete -> [ backgroundAdmin,
walletBack |> scaleX 0.8 |> move (0,-10),
card |> move (0,-40),  cardReaderTop model.cardMessage,
redLight,
greenLight,
walletFront |> scaleX 0.8 |> move (0,-10),  continue |> scale 0.8 |> move (75, 50) |> notifyTap AdminContinue  ]  ReactorComplete -> [ rect 200 200 |> filled black,  text "Successful" |> customFont "Courier New" |> centered |> bold |> filled (rgb 15 255 50) |> move (0, 20),  continue |> move (0,-10) |> notifyTap LeavesContinue ]
type Msg = Tick Float GetKeyState | Start | P1L | P1LD | P1UL | P2D | P2DL | P2DR | P2L | P2LD | P2R | P2RD | P3RDR | P3RDRU | P3DR | P4UR | P4U | P4LU | ClickSwipeTask | SwipePass | SwipeFail | DragAdmin (Float, Float) | ChangeDragState | ChangeCardPosition | ChangeMessage | LeavesTask | CleanPass | Drag (Float, Float) | Drag1 (Float, Float) | Drag2 (Float, Float) | Drag3 (Float, Float) | Drag4 (Float, Float) | Drag5 (Float, Float) | Drag6 (Float, Float) | ChangeDragState1 | ChangeDragState2 | ChangeDragState3 | ChangeDragState4 | ChangeDragState5 | ChangeDragState6 | Pass1 | Pass2 | Pass3 | Pass4 | Pass5 | Pass6 | CleanFail | AdminContinue | LeavesContinue
type State = Welcome | Cafeteria | UpperEngine | MedBay | LowerEngine | Reactor | CleanUpTask | Security | Electrical | Storage | Admin | SwipeTask | AdminComplete | ReactorComplete
update msg model = case msg of Tick t _ -> if ((model.time - model.startTime) > 30) && (model.state == CleanUpTask) then { model | startTime = model.time , mouse = Released , dragState1 = Released1 , dragState2 = Released2 , dragState3 = Released3 , dragState4 = Released4 , dragState5 = Released5 , dragState6 = Released6 , pos1 = (0,50) , pos2 = (30,30) , pos3 = (30,0) , pos4 = (0,-30) , pos5 = (30,-30) , pos6 = (40,-40) , cleanMessage = "Try Again" }
else { model | time = t}
Start -> case model.state of Welcome -> { model | state = Cafeteria } otherwise -> model P1L -> case model.state of Cafeteria -> { model | state = UpperEngine } otherwise -> model P1LD -> case model.state of Cafeteria -> { model | state = MedBay } otherwise -> model P1UL -> case model.state of MedBay -> { model | state = UpperEngine } otherwise -> model P2D -> case model.state of UpperEngine -> { model | state = LowerEngine } otherwise -> model P2DL -> case model.state of UpperEngine -> { model | state = Reactor } otherwise -> model P2DR -> case model.state of UpperEngine -> { model | state = Security } otherwise -> model P2L -> case model.state of Security -> { model | state = Reactor } otherwise -> model P2LD -> case model.state of Security -> { model | state = LowerEngine } otherwise -> model P2R -> case model.state of Reactor -> { model | state = Security } otherwise -> model P2RD -> case model.state of Reactor -> { model | state = LowerEngine } otherwise -> model  P3RDR -> case model.state of LowerEngine -> { model | state = Storage } otherwise -> model P3RDRU -> case model.state of LowerEngine -> { model | state = Electrical } otherwise -> model P3DR -> case model.state of Electrical -> { model | state = Storage } otherwise -> model P4UR -> case model.state of Storage -> { model | state = Admin } otherwise -> model P4LU -> case model.state of Admin -> { model | state = Cafeteria } otherwise -> model P4U -> case model.state of Storage -> { model | state = Cafeteria } otherwise -> model  ClickSwipeTask -> case model.state of Admin -> { model | state = SwipeTask , cardPosition = InWallet, dragState = Wallet, cardMessage = Wait, pos = (-40,25)} otherwise -> model  SwipePass -> case model.state of SwipeTask -> { model | state = AdminComplete, cardPosition = InWallet, pos = (-40,25), dragState = Wallet, cardMessage = Successful} otherwise -> model  AdminContinue -> case model.state of AdminComplete -> { model | state = Admin} otherwise -> model   SwipeFail -> case model.state of SwipeTask -> { model | state = SwipeTask, cardPosition = InReader, dragState = ReleasedC, pos = (-40,25), cardMessage = model.cardMessage} otherwise -> model  DragAdmin (x, y) -> { model | pos = (x,25)}  ChangeDragState -> { model | dragState = case model.dragState of Wallet -> ReleasedW ReleasedW -> Dragging Dragging -> ReleasedC ReleasedC -> Dragging  , timeAdmin = model.time  ,cardMessage = case model.dragState of Dragging -> adminTask2 model.pos (model.time - model.timeAdmin) 0 ReleasedW -> Wait ReleasedC -> model.cardMessage Wallet -> Wait }
ChangeCardPosition -> { model | cardPosition = case model.cardPosition of InWallet -> InReader InReader -> InReader }  ChangeMessage -> { model | cardMessage = case model.dragState of Wallet -> Wait Dragging -> adminTask2 model.pos (model.time - model.timeAdmin) 0 ReleasedW -> Wait ReleasedC -> model.cardMessage , pos = (-40,25) }
CleanFail -> case model.state of CleanUpTask -> { model | state = CleanUpTask, mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6} otherwise -> model  LeavesTask -> case model.state of Reactor -> { model | state = CleanUpTask, time = 0,startTime = model.time, cleanMessage = ""} otherwise -> model  CleanPass -> case model.state of CleanUpTask -> { model | state = ReactorComplete, startTime = model.time, mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos1 = (0,50), pos2 = (30,30), pos3 = (30,0), pos4 = (0,-30), pos5 = (30,-30), pos6 = (40,-40) } otherwise -> model  LeavesContinue -> case model.state of ReactorComplete -> { model | state = Reactor} otherwise -> model  Drag1 (x, y) -> { model | pos1 = (x, y) }  Drag2 (x, y) -> { model | pos2 = (x, y) }  Drag3 (x, y) -> { model | pos3 = (x, y) }  Drag4 (x, y) -> { model | pos4 = (x, y) }  Drag5 (x, y) -> { model | pos5 = (x, y) }  Drag6 (x, y) -> { model | pos6 = (x, y) }  Drag (x, y) -> { model | pos = (x, y) }  ChangeDragState1 -> { model | dragState1 =  case model.dragState1 of Released1 -> MouseDown1 MouseDown1 -> Released1 }  ChangeDragState2 -> { model | dragState2 =  case model.dragState2 of Released2 -> MouseDown2 MouseDown2 -> Released2 }  ChangeDragState3 -> { model | dragState3 =  case model.dragState3 of Released3 -> MouseDown3 MouseDown3 -> Released3 }  ChangeDragState4 -> { model | dragState4 =  case model.dragState4 of Released4 -> MouseDown4 MouseDown4 -> Released4 }  ChangeDragState5 -> { model | dragState5 =  case model.dragState5 of Released5 -> MouseDown5 MouseDown5 -> Released5 }  ChangeDragState6 -> { model | dragState6 =  case model.dragState6 of Released6 -> MouseDown6 MouseDown6 -> Released6 }  Pass1 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos1 = (500,500) }  Pass2 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos2 = (500,500) }  Pass3 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos3 = (500,500) }  Pass4 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos4 = (500,500) }  Pass5 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos5 = (500,500) }  Pass6 -> { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, dragState6 = Released6, pos6 = (500,500) }
type alias Model = { time : Float , state : State , timeAdmin : Float , dragState : DragState , cardPosition : CardPosition , cardMessage : CardMessage , pos : (Float, Float) , time3 : Float , mouse: MousePressStates , dragState1 : MousePressStates1 , dragState2 : MousePressStates2 , dragState3 : MousePressStates3 , dragState4 : MousePressStates4 , dragState5 : MousePressStates5 , dragState6 : MousePressStates6 , pos1: (Float,Float) , pos2: (Float,Float) , pos3: (Float,Float) , pos4: (Float,Float) , pos5: (Float,Float) , pos6: (Float,Float) , startTime : Float , cleanMessage : String }
init : Model init = { time = 0 , state = Welcome , timeAdmin = 0 , dragState = Wallet , cardPosition = InWallet , cardMessage = Wait , pos = (-40,25) , time3 = 0 , mouse = Released , dragState1 = Released1 , dragState2 = Released2 , dragState3 = Released3 , dragState4 = Released4 , dragState5 = Released5 , dragState6 = Released6 , startTime = 0 , pos1 = (0,50) , pos2 = (30,30) , pos3 = (30,0) , pos4 = (0,-30) , pos5 = (30,-30) , pos6 = (40,-40) , cleanMessage = "" }  {- --------------------------------------------------------------------------------------------- Artwork --------------------------------------------------------------------------------------------- -}
welcomeBackground model = group [ background,  star |> move (-50, 50) |> move (repeatDistance 15 200 -50 (model.time), 0),  star |> move (50, 40) |> move (repeatDistance 15 200 -50 (model.time), 0),  star |> move (50, -50) |> move (repeatDistance 15 200 -50 (model.time), 0),  star |> move (0, -40) |> move (repeatDistance 15 200 -50 (model.time), 0),  star |> move (75, 5) |> move (repeatDistance 15 200 -50 (model.time), 0),  star |> move (-75, -50) |> move (repeatDistance 15 200 -50 (model.time), 0),  star |> move (-70, -15) |> move (repeatDistance 15 200 -50 (model.time), 0),  crewmate red |> scale 0.5 |> move (-70,20) |> rotate (degrees 45) |> move (5 * sin model.time, 5 * sin model.time),
crewmate yellow |> scale 0.5 |> rotate model.time |> move (50,30),
crewmate green |> scale 0.5 |> rotate (degrees 225) |> move (-50,20) |> move (3 * sin model.time, 3 * cos model.time),
crewmate darkBlue |> rotate (2*model.time) |> scale 0.5 |> move (100 * (sin (0.25*model.time)), 10 * sin model.time),
crewmate purple |> scale 0.5 |> rotate (-1 * model.time) |> move (75,-50)  ]   background = rect 300 300 |> filled black  star = circle 1 |> filled white   crewmate colour = group [ leg colour |> move (-4,-13),  leg colour |> move (4, -13),  body colour ]
body colour = group [ roundedRect 15 18 5 |> filled colour |> addOutline (solid 1) black |> move (10, 3),
roundedRect 20 30 7 |> filled colour |> addOutline (solid 1) black,
oval 20 15 |> filled (rgb 105 185 255) |> addOutline (solid 1) black |> move (-3,6),
curve (0,0) [Pull (13,1) (20,-10)] |> filled white |> scale 0.4 |> move (-3, 12) ]
leg colour = group [ roundedRect 5 15 3 |> filled colour |> addOutline (solid 1) black ]  startButton = group [ roundedRect 30 15 5 |> filled lightCharcoal |> addOutline (solid 1) darkCharcoal,  text "START" |> centered |> customFont "Comic Sans MS" |> filled white |> scale 0.5 |> move (0,-2) ]   cafeBlueprint = group [ ngon 8 30 |> filled blue |> rotate (degrees 23) |> move (65,0),  rect 102.5 5 |> filled lightBlue |> move (-14,0) ]
upperEngineButton = group [ ngon 5 30 |> filled black |> addOutline (solid 0.5) (rgb 15 255 50) |> rotate (degrees 180) |> move (-90,0),  text "Upper" |> centered |> customFont "Courier New" |> filled (rgb 15 255 50) |> scale 0.5 |> move (-80,5),  text "Engine" |> centered |> customFont "Courier New" |> filled (rgb 15 255 50) |> scale 0.5 |> move (-80,-5) ]
medbayButton = group [ rect 30 25 |> filled black |> addOutline (solid 0.5) (rgb 15 255 50) |> move (0,-45),  text "Medbay" |> centered |> customFont "Courier New" |> filled (rgb 15 255 50) |> scale 0.5 |> move (0,-45) ]  ueBlueprint = group [ polygon [(-50,50), (0,50), (20,25), (20,-25), (0,-50), (-70,-50), (-70,25)] |> filled blue |> scale 0.4 |> move (10,40),  rect 65 10 |> filled lightBlue |> move (-12.5,0) |> rotate (degrees 90) ]  lowerEngineButton = group [ rect 50 20 |> filled black |> addOutline (solid 0.5) (rgb 15 255 50) |> move (0,-55.5),  text "Lower Engine" |> centered |> customFont "Courier New" |> filled (rgb 15 255 50) |> scale 0.5 |> move (0,-56)  ]
securityButton = group [ rect 30 35 |> filled black |> addOutline (solid 0.5) (rgb 15 255 50) |> move (60,0),  text "Security" |> centered |> customFont "Courier New" |> filled (rgb 15 255 50) |> scale 0.5 |> move (60,0) ]  reactorButton = group [ rect 20 20 |> filled black |> move (-55,0),  wedge 25 0.5 |> filled black |> rotate (degrees 180) |> move (-60,0),  text "Reactor" |> centered |> customFont "Courier New" |> filled (rgb 15 255 50) |> scale 0.5 |> move (-65,0) ]  mbBlueprint = group [ rect 50 50 |> filled blue |> move (20,-35),  rect 20 10 |> filled lightBlue |> move (0,-20) |> rotate (degrees 90) ]
secBlueprint = group [ rect 50 50 |> filled blue |> move (20,-35),  rect 35 10 |> filled lightBlue |> move (7.5,-20) |> rotate (degrees 90) ]  reacBlueprint = group [ rect 20 20 |> filled blue |> scale 1.5 |> move (-40,0),  wedge 30 0.5 |> filled blue |> scale 1.5 |> rotate (degrees 180) |> move (-50,0),  rect 35 10 |> filled lightBlue |> move (-7.5,0) ]
leaves = group [ circle 7 |> filled (rgb 237 255 0) |> addOutline (solid 1) yellow,  oval 2 7 |> filled yellow |> addOutline (solid 0.5) brown |> move (0,2),  circle 0.75 |> filled yellow |> addOutline (solid 0.5) brown |> move (0,-4) ]  leBlueprint = group [ polygon [(-50,0), (0,0), (0,-50), (-35,-50), (-50,-35)] |> filled blue |> move (-40, 55),  rect 20 10 |> filled lightBlue |> move (-30,30),  rect 10 60 |> filled lightBlue |> move (-20,5),  rect 90 10 |> filled lightBlue |> move (20,-20) ]  storageButton = group [ rect 40 40 |> filled black |> addOutline (solid 0.5) (rgb 15 255 50) |> move (85 ,-20),  text "Storage" |> centered |> customFont "Courier New" |> filled (rgb 15 255 50) |> scale 0.5 |> move (81,-20)  ]  electricalButton = group [ rect 40 30 |> filled black |> addOutline (solid 0.5) (rgb 15 255 50) |> move (25,30),
text "Electrical" |> centered |> customFont "Courier New" |> filled (rgb 15 255 50) |> scale 0.5 |> move (25,30)  ]   storageBlueprint = group [   rect 5 60 |> filled lightBlue |> move (-7,-13),  rect 20 10 |> filled blue |> move (-30,-40),  ngon 6 20 |> filled blue |> move (-7,-40) ]    adminButton = group [ rect 40 30 |> filled black |> addOutline (solid 0.5) (rgb 15 255 50),  text "Admin" |> centered |> customFont "Courier New" |> filled (rgb 15 255 50) |> scale 0.5  ]  cafeButton = group [ ngon 8 50 |> filled black |> addOutline (solid 0.5) (rgb 15 255 50) |> rotate (degrees 23),
text "Cafeteria" |> centered |> customFont "Courier New" |> filled (rgb 15 255 50) |> scale 0.5 |> move (0,-30)
]
--------------------------------------------------------------------------------------------- -- Admin Task --------------------------------------------------------------------------------------------------
dragging model state = case state of Wallet -> group [ card |> move (cardMove model.cardPosition) |> notifyTap ChangeCardPosition |> notifyMouseDown ChangeDragState,  cardReaderTop Wait  ,text (Debug.toString (model.cardMessage)) |> size 4 |> filled white |> move (80,-60) ] ReleasedW -> group [ card |> move model.pos |> notifyMouseDown ChangeDragState,  cardReaderTop Wait  ,text (Debug.toString (model.cardMessage)) |> size 4 |> filled white |> move (80,-60) ] ReleasedC -> group [ card |> move model.pos |> notifyMouseDown ChangeDragState ,  cardReaderTop model.cardMessage ] Dragging -> group [ card |> move model.pos |> notifyMouseDown ChangeDragState |> notifyMouseUp ChangeDragState |> notifyMouseUp ChangeMessage |> notifyMouseUp (adminTask1 model.pos (model.time - model.timeAdmin)) ,  cardReaderTop model.cardMessage ,  rect 400 400 |> ghost |> notifyMouseMoveAt DragAdmin |> notifyMouseUp ChangeDragState |> notifyMouseUpAt DragAdmin |> notifyMouseUp ChangeMessage |> notifyMouseUp (adminTask1 model.pos (model.time - model.timeAdmin)) ]
adminTask1 (x,y) time = if (x > 55 && time > 1 && time <= 2) then SwipePass else SwipeFail  adminTask2 (x,y) time m = if (x > 55 && time > 1 && time <= 2) then Successful else ( if (x > 55 && time > 2) then Slow else ( if (x > 55 && time <= 1 && time >= 0) then Fast else BadRead ) )
cardMessage message = case message of Wait -> "PLEASE SWIPE CARD..." Fast -> "TOO FAST. TRY AGAIN" Slow -> "TOO SLOW. TRY AGAIN" BadRead -> "BAD READ. TRY AGAIN" Successful -> "SUCCESSFUL "  cardMove cardpos = case cardpos of InWallet -> (0,-40) InReader -> (-40,25)
type CardPosition = InWallet | InReader
type DragState = Wallet | ReleasedW | Dragging | ReleasedC
type CardMessage = Wait | Fast | Slow | BadRead | Successful
backgroundAdmin = group [ rect 200 200 |> filled black,
roundedRect 100 20 5 |> filled darkCharcoal |> move (0,10) |> addOutline (solid 1) (black),  rect 100 70 |> filled charcoal |> move (0,-30) |> addOutline (solid 1) black ]
cardReaderTop message = group [ roundedRect 100 50 5 |> filled darkCharcoal |> move (0,50) |> addOutline (solid 1) black,
rect 90 10 |> filled (rgb 40 125 80) |> move (0,55) |> addOutline (solid 1) (black),
text (cardMessage message) |> centered |> customFont "Courier New" |> filled white |> scale 0.5 |> move (-8,54)
]
-- redLight = group [ circle 3 |> filled red |> move (32,33) |> addOutline (solid 0.7) black,
shine |> move (34.2,33.5) ]  greenLight = group [ circle 3 |> filled green |> move (40,33) |> addOutline (solid 0.7) black,
shine |> move (42,33.5) ]  shine = curve (0,0) [Pull (10,10) (10,20)] |> filled white |> rotate (degrees 90) |> scale 0.75 |> scale 0.2
-- Admin card design card = group [ roundedRect 70 45 5 |> filled lightGray |> addOutline (solid 1) black,
square 20 |> filled white |> move (-20,5),
text "Crewmate 1" |> customFont "Courier New" |> filled black |> move (-10,5) |> scale 0.5,  crewmate red |> scale 0.5 |> move (-20,0),  rect 22 10 |> filled lightGray |> move (-20,-10),  line (0,0) (60,0) |> outlined (solid 0.5) black |> move (-30,-8),  line (0,0) (60,0) |> outlined (solid 0.5) black |> move (-30,-13),  line (0,0) (60,0) |> outlined (solid 0.5) black |> move (-30,-18)
]  -- wallet design walletFront = group [ curve (10.312,-23.40) [Pull (10.312,-24.71) (10.312,-26.02),Pull (10.148,-39.44) (9.9846,-52.86),Pull (36.664,-53.03) (63.345,-53.19),Pull (64.654,-31.42) (65.964,-9.657),Pull (57.289,-11.45) (48.613,-13.25),Pull (39.774,-16.36) (30.936,-19.47),Pull (30.936,-19.47) (30.936,-19.47),Pull (25.534,-20.62) (20.132,-21.76),Pull (15.549,-22.42) (10.312,-23.40)] |> filled (rgb 101 67 33) |> addOutline (solid 1) black
, curve (16.859,-28.31) [Pull (16.859,-34.70) (16.859,-41.08),Pull (16.695,-46.15) (16.531,-51.23),Pull (16.368,-51.88) (16.204,-52.54),Pull (36.992,-52.70) (57.780,-52.86),Pull (58.434,-35.02) (59.089,-17.18),Pull (55.161,-18.33) (51.232,-19.47),Pull (48.286,-20.62) (45.340,-21.76),Pull (42.557,-22.75) (39.774,-23.73),Pull (34.046,-25.04) (28.317,-26.35),Pull (22.588,-26.84) (16.859,-28.31)] |> filled lightBlue |> addOutline (solid 1) black  , roundedRect 10 60 3 |> filled (rgb 101 67 33) |> move (6,-55) |> addOutline (solid 0.5) black
, curve (-66.61,-19.80) [Pull (-52.37,-17.51) (-38.13,-15.22),Pull (-36.82,-15.22) (-35.51,-15.22),Pull (-31.26,-16.04) (-27.00,-16.85),Pull (-23.40,-17.67) (-19.80,-18.49),Pull (-15.54,-19.80) (-11.29,-21.11),Pull (-4.910,-23.57) (1.4731,-26.02),Pull (1.4731,-26.02) (1.4731,-26.02),Pull (2.2915,-31.59) (3.1099,-37.15),Pull (3.4373,-43.04) (3.7647,-48.94),Pull (3.7647,-50.90) (3.7647,-52.86),Pull (-28.64,-52.86) (-61.05,-52.86),Pull (-63.83,-36.33) (-66.61,-19.80)] |> filled (rgb 101 67 33) |> addOutline (solid 1) black
, curve (2.1278,-34.20) [Pull (-12.27,-28.97) (-26.68,-23.73),Pull (-30.93,-23.24) (-35.19,-22.75),Pull (-40.10,-22.58) (-45.01,-22.42),Pull (-53.85,-23.89) (-62.69,-25.37),Pull (-64,-25.86) (-65.30,-26.35),Pull (-65.30,-26.51) (-65.30,-26.68),Pull (-62.03,-26.02) (-58.76,-25.37),Pull (-51.88,-24.55) (-45.01,-23.73),Pull (-40.42,-23.73) (-35.84,-23.73),Pull (-31.42,-24.38) (-27.00,-25.04),Pull (-22.75,-26.18) (-18.49,-27.33),Pull (-11.45,-29.79) (-4.419,-32.24),Pull (-1.145,-33.39) (2.1278,-34.20)] |> filled black
, curve (-64.98,-33.22) [Pull (-59.58,-32.08) (-54.17,-30.93),Pull (-54.17,-30.93) (-54.17,-30.93),Pull (-50.90,-30.44) (-47.63,-29.95),Pull (-43.70,-29.95) (-39.77,-29.95),Pull (-31.26,-30.93) (-22.75,-31.91),Pull (-22.75,-31.91) (-22.75,-31.91),Pull (-10.47,-35.35) (1.8005,-38.79),Pull (1.8005,-38.79) (1.8005,-38.79),Pull (-8.511,-36.50) (-18.82,-34.20),Pull (-26.51,-32.90) (-34.20,-31.59),Pull (-37.97,-31.59) (-41.73,-31.59),Pull (-45.34,-31.59) (-48.94,-31.59),Pull (-54.99,-32.40) (-61.05,-33.22),Pull (-62.52,-33.39) (-64.98,-33.22)] |> filled black
, curve (-63.34,-39.44) [Pull (-50.41,-38.79) (-37.48,-38.13),Pull (-29.13,-38.30) (-20.78,-38.46),Pull (-20.78,-38.46) (-20.78,-38.46),Pull (-17.84,-38.95) (-14.89,-39.44),Pull (-11.13,-40.10) (-7.365,-40.75),Pull (-2.946,-41.24) (1.4731,-41.73),Pull (1.6368,-42.23) (1.8005,-42.72),Pull (-7.202,-41.57) (-16.20,-40.42),Pull (-21.27,-40.10) (-26.35,-39.77),Pull (-39.93,-39.77) (-53.52,-39.77),Pull (-56.63,-39.77) (-59.74,-39.77),Pull (-60.89,-40.10) (-63.34,-39.44)] |> filled black ]  walletBack = group [ curve (65.964,-9.329) [Pull (65.636,-22.09) (65.309,-34.86),Pull (65.309,-34.86) (65.309,-34.86),Pull (65.145,-40.59) (64.982,-46.32),Pull (64.982,-49.75) (64.982,-53.19),Pull (1.9641,-53.36) (-61.05,-53.52),Pull (-62.19,-50.08) (-63.34,-46.64),Pull (-63.50,-43.21) (-63.67,-39.77),Pull (-65.80,-29.79) (-67.92,-19.80),Pull (-62.52,-17.84) (-57.12,-15.87),Pull (-53.52,-14.73) (-49.92,-13.58),Pull (-44.84,-12.43) (-39.77,-11.29),Pull (-31.09,-10.80) (-22.42,-10.31),Pull (-13.09,-10.63) (-3.764,-10.96),Pull (1.8005,-11.29) (7.3657,-11.62),Pull (14.731,-11.78) (22.097,-11.94),Pull (31.918,-12.27) (41.739,-12.60),Pull (41.739,-12.60) (41.739,-12.60),Pull (45.994,-12.27) (50.250,-11.94),Pull (53.033,-11.78) (65.964,-9.329)] |> filled (rgb 101 67 33) |> addOutline (solid 1) black
, curve (-66.61,-18.82) [Pull (-58.10,-15.87) (-49.59,-12.93),Pull (-39.93,-11.78) (-30.28,-10.63),Pull (-19.96,-10.47) (-9.657,-10.31),Pull (-4.092,-10.31) (1.4731,-10.31),Pull (7.0383,-10.80) (12.603,-11.29),Pull (18.659,-11.78) (24.716,-12.27),Pull (26.352,-12.43) (27.989,-12.60),Pull (34.209,-12.43) (40.429,-12.27),Pull (43.703,-12.27) (46.976,-12.27),Pull (49.759,-11.94) (52.542,-11.62),Pull (59.416,-10.31) (66.291,-9.002),Pull (46.322,-14.89) (26.352,-20.78),Pull (22.588,-21.60) (18.823,-22.42),Pull (14.731,-23.24) (10.639,-24.06),Pull (10.639,-24.06) (10.639,-24.06),Pull (10.639,-25.20) (10.639,-26.35),Pull (6.2199,-27.17) (1.8005,-27.98),Pull (1.4731,-27.17) (1.1457,-26.35),Pull (-7.856,-22.91) (-16.85,-19.47),Pull (-20.95,-18.16) (-25.04,-16.85),Pull (-27.00,-16.53) (-28.97,-16.20),Pull (-32.40,-15.87) (-35.84,-15.54),Pull (-39.44,-15.38) (-43.04,-15.22),Pull (-46.64,-15.54) (-50.25,-15.87),Pull (-54.01,-16.20) (-66.61,-18.82)] |> filled (rgb 101 67 33) |> addOutline (solid 1) black
, curve (-66.61,-18.82) [Pull (-58.10,-15.87) (-49.59,-12.93),Pull (-39.93,-11.78) (-30.28,-10.63),Pull (-19.96,-10.47) (-9.657,-10.31),Pull (-4.092,-10.31) (1.4731,-10.31),Pull (7.0383,-10.80) (12.603,-11.29),Pull (18.659,-11.78) (24.716,-12.27),Pull (26.352,-12.43) (27.989,-12.60),Pull (34.209,-12.43) (40.429,-12.27),Pull (43.703,-12.27) (46.976,-12.27),Pull (49.759,-11.94) (52.542,-11.62),Pull (59.416,-10.31) (66.291,-9.002),Pull (46.322,-14.89) (26.352,-20.78),Pull (22.588,-21.60) (18.823,-22.42),Pull (14.731,-23.24) (10.639,-24.06),Pull (10.639,-24.06) (10.639,-24.06),Pull (10.639,-25.20) (10.639,-26.35),Pull (6.2199,-27.17) (1.8005,-27.98),Pull (1.4731,-27.17) (1.1457,-26.35),Pull (-7.856,-22.91) (-16.85,-19.47),Pull (-20.95,-18.16) (-25.04,-16.85),Pull (-27.00,-16.53) (-28.97,-16.20),Pull (-32.40,-15.87) (-35.84,-15.54),Pull (-39.44,-15.38) (-43.04,-15.22),Pull (-46.64,-15.54) (-50.25,-15.87),Pull (-54.01,-16.20) (-66.61,-18.82)] |> filled black ]
-------------------------------------------------------------------------------------------------- -- Leaves Task --------------------------------------------------------------------------------------------------
type MousePressStates = Released | MouseDown type MousePressStates1 = Released1 | MouseDown1 type MousePressStates2 = Released2 | MouseDown2 type MousePressStates3 = Released3 | MouseDown3 type MousePressStates4 = Released4 | MouseDown4 type MousePressStates5 = Released5 | MouseDown5 type MousePressStates6 = Released6 | MouseDown6
-- Leaf designs leaf1 colour = group [ curve (0,0) [Pull (-20,13) (-17,48), Pull (0,42) (0,61), Pull (0,42) (17,48), Pull (19,13) (0,0) ] |> filled colour,  curve (0,-5) [Pull (1,12) (0,55), Pull (0,0) (0,0)] |> outlined (solid 0.5) (rgb 0 0 0),  curve (0,0) [Pull (30,-7) (70,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees 10) |> move(0,40),  curve (0,0) [Pull (30,-7) (70,10) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees 10) |> move(0,30),  curve (0,0) [Pull (30,-7) (63,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees 10) |> move(0,20),  curve (0,0) [Pull (17,-7) (50,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees 10) |> move(0,10),
curve (0,0) [Pull (30,-7) (70,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees -10) |> move(0,35),
curve (0,0) [Pull (30,-7) (70,10) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees -10) |> move(0,25),
curve (0,0) [Pull (30,-7) (60,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25|> scaleX -1|> rotate (degrees -10)|> move(0,15),
curve (0,0) [Pull (10,-5) (38,8) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees -10)|> move(0,5),
curve (0,0) [Pull (30,-7) (70,0) ]|> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees -10)|> move(0,43) ]
 leaf2 colour = group [ curve (0,0) [Pull (-44,-20) (0,52), Pull (44,-20) (0,0) ] |> filled colour,  curve (0,-7) [Pull (0,0) (0,52) ] |> outlined (solid 0.5) (rgb 0 0 0),
curve (0,0) [Pull (10,-3) (21,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees -10) |> move(0,43),
curve (0,0) [Pull (30,-7) (43,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees -10) |> move(0,35),
curve (0,0) [Pull (30,-7) (66,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees -10) |> move(0,25),
curve (0,0) [Pull (30,-7) (80,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees -10) |> move(0,15),
curve (0,0) [Pull (30,-7) (86,3) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> rotate (degrees -10) |> move(0,5),
curve (0,0) [Pull (10,-3) (21,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees 10) |> move(0,43),
curve (0,0) [Pull (30,-7) (43,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees 10) |> move(0,35),
curve (0,0) [Pull (30,-7) (66,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees 10) |> move(0,25),
curve (0,0) [Pull (30,-7) (80,0) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees 10) |> move(0,15),
curve (0,0) [Pull (30,-7) (86,3) ] |> outlined (solid 1) (rgb 0 0 0) |> scale 0.25 |> scaleX -1 |> rotate (degrees 10) |> move(0,5) ]
garbageChuteVisual = group [ square 200 |> filled (rgb 73 117 173) |> addOutline (solid 0.75) black --white bar at side --gradient 1 , rect 120 199 |> filled (rgb 77 120 175) |> rotate (degrees 0) |> move (10, 0) --gradient 2 , rect 60 199 |> filled (rgb 82 124 178) |> move (10, 0) , cleanUpBar |> move (-70, 0) ]
cleanUpBar = group [rect 50 150 |> filled grey |> addOutline (solid 0.75) black, rect 50 70 |> filled black |> scaleX 0.5 --down arrow , triangle 4 |> filled orange |> rotate (degrees 30) |> move (0, 40) |> addOutline (solid 0.3) black --up arrow , triangle 4 |> filled orange |> rotate (degrees -30) |> move (0, -40) |> addOutline (solid 0.3) black ] continue = group [ roundedRect 40 20 5 |> filled black |> addOutline (solid 1) (rgb 15 255 50),  text "CONTINUE" |> customFont "Courier New" |> centered |> filled (rgb 15 255 50) |> scale 0.6 ]
timer model = group [ roundedRect 40 20 5 |> filled black |> addOutline (solid 1) green , text "Timer:" |> centered |> customFont "Courier New" |> filled white |> scale 0.5  ,text (Debug.toString (model.time - model.startTime)) |> centered |> size 4 |> filled white |> move (0,-7) ]
-- repeat an animation for a given duration repeatDuration : Float -> Int -> Float -> Float -> Float repeatDuration speed duration startPosition time = speed * (time - toFloat duration * toFloat (floor time // duration)) + startPosition
-- repeat an animation for a given distance repeatDistance : Float -> Float -> Float -> Float -> Float repeatDistance speed distance startPosition time = repeatDuration speed (round <| distance / speed) startPosition time
