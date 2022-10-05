-- Animation view: https://macoutreach.rocks/share/db5e456d

myShapes model =
  [background2
   ,background
    |> move (-30*tan(model.time),0)
   ,car model.time
    |> scale 0.5
    |> move (-50,-40)
    |> move (30*tan(model.time),0)
   ,wheels model.time
    |> move (-100,-80)
    |> scale 0.5
    |> move (30*tan(model.time),0)
  ]
  

car model = group [body, doors, lights]

background2 = group [ rect 200 200
   |> filled lightBlue
   ,circle 10
   |> filled yellow
   |> move (-50,40)
   ,rect 200 30
   |> filled darkGreen
   |> move (-3,-30)
   ,rect 200 30
   |> filled lightCharcoal
   |> move (0,-50)
   ,rect 200 30
   |> outlined (solid 3) darkCharcoal
   |> move (0,-50)
   ]
   
body = group [roundedRect 100 50 30
               |> filled darkBlue
               |> move (0,10)
             ,rect 120 30
               |> filled darkBlue
               |> move (0,-2)
             ,circle 15
               |> filled darkBlue
               |> move (-58.5,-2)
             ,circle 15
               |> filled darkBlue
               |> move (58.5,-2)
            ]
            
wheels model = group [circle 15
                 |> filled darkCharcoal
                 |> rotate (degrees (45+50*model))
                 |> move (40,-15)
               ,circle 15
                 |> filled darkCharcoal
                 |> rotate (degrees (45+50*model))
                 |> move (-40,-15)
                ,circle 5
                |> filled gray
                |> rotate (degrees (45+50*model))
                |> move (-40,-15)
                ,circle 5
                |> filled gray
                |> rotate (degrees (45+50*model))
                |> move (40,-15)
                ,rect 30 1
                |> filled gray
                |> rotate (degrees (45+50*model))
                |> rotate (degrees 35)
                |> move (40,-15)
                ,rect 30 1
                |> filled gray
                |> rotate (degrees (45+50*model))
                |> rotate (degrees -35)
                |> move (-40,-15)
                ,rect 30 1
                |> filled gray
                |> rotate (degrees (45+50*model))
                |> rotate (degrees -35)
                |> move (40,-15)
                ,rect 30 1
                |> filled gray
                |> rotate (degrees (45+50*model))
                |> rotate (degrees 35)
                |> move (-40,-15)
                ,rect 30 1
                |> filled gray
                |> rotate (degrees (45+50*model))
                |> rotate (degrees 90)
                |> move (40,-15)
                ,rect 30 1
                |> filled gray
                |> rotate (degrees (45+50*model))
                |> rotate (degrees 90)
                |> move (-40,-15)
               ]

doors = group [roundedRect 120 95 30
                |> outlined (solid 1) black
                |> scale 0.4
                |> move (2,3)
              ,wedge 20 0.25
                |> filled gray
                |> rotate (degrees -225)
                |> move (-25,12)
              ,rect 48 20
                |> filled gray
                |> move (2,22)
              ,wedge 20 0.25
                |> filled gray
                |> rotate (degrees 45)
                |> move (27,12)
              ,oval 9 3
                |> filled darkCharcoal
                |> move (-15,7)
              ]
              

background = group [rect 15 30
               |> filled (rgb 97 27 0)
               |> move (50,-10)
             ,triangle 25
               |> filled darkGreen
               |> rotate (degrees 90)
               |> move (50,0)
             ,triangle 25
               |> filled darkGreen
               |> rotate (degrees 90)
               |> move (50,15)
             
             ]          


lights = group [oval 5 3
                |> filled yellow
                |> move (65,7)
               ,oval 5 3
               |> filled red
               |> move (-65,7)
                ]

