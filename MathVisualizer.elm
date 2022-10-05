-- Game view: https://macoutreach.rocks/share/a2c3b0ee

import Html 
import Html.Attributes exposing (..)
import Bootstrap.Form.Input as Input 
import Html.Events as Events

myShapes model =
    case model.state of
        Home  ->
            [
              homeBackground model,

              quizzesButton
              |> scale model.scalerQuiz
              |> move (-30,-20)
              |> notifyEnter HoverQuiz
              |> notifyLeave LeaveQuiz
              |> notifyTap ToTopics,

              supportButton
              |> scale model.scalerHelp
              |> move (30,-20)
              |> notifyEnter HoverHelp
              |> notifyLeave LeaveHelp
              |> notifyTap ToSupport
              |> notifyEnter HoverExplainHelp 
              |> notifyLeave LeaveExplainHelp 
              |> addHyperlink "https://docs.google.com/forms/d/e/1FAIpQLSfb7OHHpsT4Ug9eNHC2Gp58fM-aao_FYEuIkVacnR_Z97LtdQ/viewform?vc=0&c=0&w=1&flr=0&gxids=7628",

              text "DERIVATIVES!"
              |> customFont "Calibri"
              |> centered
              |> filled white
              |> scale 1
              |> move (0,25)

            , helper 
              |> makeTransparent model.transpExplainHelp
            ]
            
        Topics -> 
            [
              topicsBackground model

            , simpleButton
              |> scale model.scalerSimple
              |> move (0,40)
              |> notifyTap ToSD1
              |> notifyEnter HoverSimple
              |> notifyLeave LeaveSimple

            , appliedButton
              |> scale model.scalerApplied
              |> notifyEnter HoverApplied
              |> notifyLeave LeaveApplied
              |> notifyTap ToA1

            , challengeButton
              |> scale model.scalerChallenge
              |> move (0,-40)
              |> notifyEnter HoverChallenge
              |> notifyLeave LeaveChallenge
              |> notifyTap ToC1
            ]
        -- Simple Derivatives 1    
        SD1  ->
            [
              quizLayoutSimple (rgb 14 235 213) model
            , equationS "y = 2x + 3"
              |> move (0,28)
            , hintSD1 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        PassS1 -> 
            [
              quizLayoutSimple lightGreen model
            , equationS "y = 2x + 3"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD1 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        FailS1 -> 
            [
              quizLayoutSimple lightRed model
            , equationS "y = 2x + 3"
              |> move (0,28)
            , hintSD1 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        SkippedS1 -> 
            [
              quizLayoutSimple lightYellow model
            , equationS "y = 2x + 3"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD1 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        -- Simple Derivatives 2    
        SD2  ->
            [
              quizLayoutSimple (rgb 14 235 213) model
            , equationS "y = x"
              |> move (0,28)
            , hintSD2 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        PassS2 ->
            [
              quizLayoutSimple lightGreen model
            , equationS "y = x"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD2 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        FailS2 ->
            [
              quizLayoutSimple lightRed model
            , equationS "y = x"
              |> move (0,28)
            , hintSD2 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        SkippedS2 ->
            [
              quizLayoutSimple lightYellow model
            , equationS "y = x"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD2 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        -- Simple Derivatives 3    
        SD3  ->
            [
              quizLayoutSimple (rgb 14 235 213) model
            , equationS "y = sin(x)"
              |> move (0,28)
            , hintSD3 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        PassS3 ->
            [
              quizLayoutSimple lightGreen model
            , equationS "y = sin(x)"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD3 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        FailS3 ->
            [
              quizLayoutSimple lightRed model
            , equationS "y = sin(x)"
              |> move (0,28)
            , hintSD3 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        SkippedS3 ->
            [
              quizLayoutSimple lightYellow model
            , equationS "y = sin(x)"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD3 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        -- Simple Derivatives 4   
        SD4  ->
            [
              quizLayoutSimple (rgb 14 235 213) model
            , equationS "y = x³"
              |> move (0,28)
            , hintSD4 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        PassS4 ->
            [
              quizLayoutSimple lightGreen model
            , equationS "y = x³"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD4 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        FailS4 ->
            [
              quizLayoutSimple lightRed model
            , equationS "y = x³"
              |> move (0,28)
            , hintSD4 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        SkippedS4 ->
            [
              quizLayoutSimple lightYellow model
            , equationS "y = x³"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD4 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        -- Simple Derivatives 5    
        SD5  ->
            [
              quizLayoutSimple (rgb 14 235 213) model
            , equationS "y = 1/x"
              |> move (0,28)
            , hintSD5 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        PassS5 ->
            [
              quizLayoutSimple lightGreen model
            , equationS "y = 1/x"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD5 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        FailS5 ->
            [
              quizLayoutSimple lightRed model
            , equationS "y = 1/x"
              |> move (0,28)
            , hintSD5 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        SkippedS5 ->
            [
              quizLayoutSimple lightYellow model
            , equationS "y = 1/x"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD5 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        -- Simple Derivatives 6   
        SD6  ->
            [
              quizLayoutSimple (rgb 14 235 213) model
            , equationS "5x³"
              |> move (0,28)
            , hintSD6 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        PassS6 ->
            [
              quizLayoutSimple lightGreen model
            , equationS "5x³"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD6 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        FailS6 ->
            [
              quizLayoutSimple lightRed model
            , equationS "5x³"
              |> move (0,28)
            , hintSD6 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        SkippedS6 ->
            [
              quizLayoutSimple lightYellow model
            , equationS "5x³"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD6 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        -- Simple Derivatives 7
        SD7  ->
            [
              quizLayoutSimple (rgb 14 235 213) model
            , equationS "y = x³ + x⁴"
              |> move (0,28)
            , hintSD7 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        PassS7 ->
            [
              quizLayoutSimple lightGreen model
            , equationS "y = x³ + x⁴"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD7 model
             |> scale 0.7
             |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
             |> move (-50,-55)
            ]
        FailS7 ->
            [
              quizLayoutSimple lightRed model
            , equationS "y = x³ + x⁴"
              |> move (0,28)
            , hintSD7 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        SkippedS7 ->
            [
              quizLayoutSimple lightYellow model
            , equationS "y = x³ + x⁴"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD7 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        -- Simple Derivatives 8    
        SD8  ->
            [
              quizLayoutSimple (rgb 14 235 213) model
            , equationS "y = cos(x)sin(x)"
              |> move (0,28)
            , hintSD8 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        PassS8 ->
            [
              quizLayoutSimple lightGreen model
            , equationS "y = cos(x)sin(x)"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD8 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        FailS8 ->
            [
              quizLayoutSimple lightRed model
            , equationS "y = cos(x)sin(x)"
              |> move (0,28)
            , hintSD8 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        SkippedS8 ->
            [
              quizLayoutSimple lightYellow model
            , equationS "y = cos(x)sin(x)"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD8 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        -- Simple Derivatives 9   
        SD9  ->
            [
              quizLayoutSimple (rgb 14 235 213) model
            , equationS "y = cos(x)/x"
              |> move (0,28)
            , hintSD9 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        PassS9 ->
            [
              quizLayoutSimple lightGreen model
            , equationS "y = cos(x)/x"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD9 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        FailS9 ->
            [
              quizLayoutSimple lightRed model
            , equationS "y = cos(x)/x"
              |> move (0,28)
            , hintSD9 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        SkippedS9 ->
            [
              quizLayoutSimple lightYellow model
            , equationS "y = cos(x)/x"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD9 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        -- Simple Derivatives 10  
        SD10  ->
            [
              quizLayoutSimple (rgb 14 235 213) model
            , equationS "y = sin(x²)"
              |> move (0,28)
            , hintSD10 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        PassS10 ->
            [
              quizLayoutSimple lightGreen model
            , equationS "y = sin(x²)"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD10 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        FailS10 ->
            [
              quizLayoutSimple lightRed model
            , equationS "y = sin(x²)"
              |> move (0,28)
            , hintSD10 model
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        SkippedS10 ->
            [
             quizLayoutSimple lightYellow model
            , equationS "y = sin(x²)"
              |> move (0,28)
            , answerSDLayout
            , answerDesSD10 model
              |> scale 0.7
              |> move (-39,1)
            , next |> notifyTap Next
            , howToAnswerQ model
              |> move (-50,-55)
            ]
        -- Applied Derivatives 1    
        AA1  ->
            [
              quizLayoutApplied (rgb 14 235 213) model
            , hintAA1 model
            , insertPic model "https://user-images.githubusercontent.com/80813838/111591382-bf0f5380-879d-11eb-997e-11ed6e4ad766.PNG"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassA1 -> 
            [
              quizLayoutApplied lightGreen model
            , answerAA model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/80813838/111591382-bf0f5380-879d-11eb-997e-11ed6e4ad766.PNG"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        FailA1 -> 
            [
              quizLayoutApplied lightRed model
            , hintAA1 model
            , insertPic model "https://user-images.githubusercontent.com/80813838/111591382-bf0f5380-879d-11eb-997e-11ed6e4ad766.PNG"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        SkippedA1 ->
            [
              quizLayoutApplied lightYellow model
            , answerAA model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/80813838/111591382-bf0f5380-879d-11eb-997e-11ed6e4ad766.PNG"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        -- Applied Derivatives 2   
        AA2 -> 
            [  
              quizLayoutApplied2 (rgb 14 235 213) model
            , hintAA2 model
            , insertPic model "https://user-images.githubusercontent.com/30901422/113950962-94367f00-97e0-11eb-90fa-971d8ac4b8ce.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassA2 -> 
            [
              quizLayoutApplied2 lightGreen model
            , answerAA2 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/30901422/113950962-94367f00-97e0-11eb-90fa-971d8ac4b8ce.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        FailA2 -> 
            [
              quizLayoutApplied2 lightRed model
            , hintAA2 model
            , insertPic model "https://user-images.githubusercontent.com/30901422/113950962-94367f00-97e0-11eb-90fa-971d8ac4b8ce.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        SkippedA2 ->
            [
              quizLayoutApplied2 lightYellow model
            , answerAA2 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/30901422/113950962-94367f00-97e0-11eb-90fa-971d8ac4b8ce.png"
              |> move (3,45)              
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        -- Applied Derivatives 3    
        AA3 -> 
            [  
              quizLayoutApplied3 (rgb 14 235 213) model
            , hintAA3 model
            , insertPic model "https://user-images.githubusercontent.com/30901422/113932436-989f6f80-97c1-11eb-8b1f-c58463326e6d.png"
              |> move (3,45)              
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassA3 -> 
            [
              quizLayoutApplied3 lightGreen model
            , answerAA3 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/30901422/113932436-989f6f80-97c1-11eb-8b1f-c58463326e6d.png"
              |> move (3,45)   
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        FailA3 ->
            [
              quizLayoutApplied3 lightRed model
            , hintAA3 model
            , insertPic model "https://user-images.githubusercontent.com/30901422/113932436-989f6f80-97c1-11eb-8b1f-c58463326e6d.png"
              |> move (3,45)      
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        SkippedA3 ->
            [
              quizLayoutApplied3 lightYellow model
            , answerAA3 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/30901422/113932436-989f6f80-97c1-11eb-8b1f-c58463326e6d.png"
              |> move (3,45)             
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        -- Applied Derivatives 4   
        AA4 -> 
            [  
              quizLayoutApplied4 (rgb 14 235 213) model
            , hintAA4 model
            , insertPic model "https://user-images.githubusercontent.com/30901422/113951277-440bec80-97e1-11eb-9608-857c6d4ad745.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassA4 -> 
            [
              quizLayoutApplied4 lightGreen model
            , answerAA4 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/30901422/113951277-440bec80-97e1-11eb-9608-857c6d4ad745.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        FailA4 -> 
            [
              quizLayoutApplied4 lightRed model
            , hintAA4 model
            , insertPic model "https://user-images.githubusercontent.com/30901422/113951277-440bec80-97e1-11eb-9608-857c6d4ad745.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        SkippedA4 ->
            [
              quizLayoutApplied4 lightYellow model
            , answerAA4 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/30901422/113951277-440bec80-97e1-11eb-9608-857c6d4ad745.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        -- Applied Derivatives 5
        AA5 -> 
            [  
              quizLayoutApplied5 (rgb 14 235 213) model
            , hintAA5 model
            , insertPic model "https://user-images.githubusercontent.com/30901422/113951603-df9d5d00-97e1-11eb-94a5-de2c9d7c5c4b.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassA5 -> 
            [
              quizLayoutApplied5 lightGreen model
            , answerAA5 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/30901422/113951603-df9d5d00-97e1-11eb-94a5-de2c9d7c5c4b.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        FailA5 -> 
            [
              quizLayoutApplied5 lightRed model
            , hintAA3 model
            , insertPic model "https://user-images.githubusercontent.com/30901422/113951603-df9d5d00-97e1-11eb-94a5-de2c9d7c5c4b.png"
              |> move (3,45)     
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        SkippedA5 ->
            [
              quizLayoutApplied5 lightYellow model
            , answerAA5 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/30901422/113951603-df9d5d00-97e1-11eb-94a5-de2c9d7c5c4b.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        -- Applied Derivatives 6    
        AA6 -> 
            [
              quizLayoutApplied6 (rgb 14 235 213) model
            , hintAA6 model
            , insertPic model "https://user-images.githubusercontent.com/30901422/113929856-8839c580-97be-11eb-91e5-8515e1ab4201.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassA6 -> 
            [
              quizLayoutApplied6 lightGreen model
            , answerAA6 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/30901422/113929856-8839c580-97be-11eb-91e5-8515e1ab4201.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        FailA6 -> 
            [
              quizLayoutApplied6 lightRed model
            , hintAA6 model
            , insertPic model "https://user-images.githubusercontent.com/30901422/113929856-8839c580-97be-11eb-91e5-8515e1ab4201.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        SkippedA6 ->
            [
              quizLayoutApplied6 lightYellow model
            , answerAA6 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://user-images.githubusercontent.com/30901422/113929856-8839c580-97be-11eb-91e5-8515e1ab4201.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        -- Applied Derivatives 7    
        AA7  ->
            [
              quizLayoutApplied7 (rgb 14 235 213) model
            , hintAA7 model
            , insertPic model "https://i.imgur.com/NZ0VFZL.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassA7 -> 
            [
              quizLayoutApplied7 lightGreen model
            , answerAA7 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://i.imgur.com/NZ0VFZL.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        FailA7 -> 
            [
              quizLayoutApplied7 lightRed model
            , hintAA7 model
            , insertPic model "https://i.imgur.com/NZ0VFZL.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        SkippedA7 ->
            [
              quizLayoutApplied7 lightYellow model
            , answerAA7 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://i.imgur.com/NZ0VFZL.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        -- Applied Derivatives 8  
        AA8  ->
            [
              quizLayoutApplied8 (rgb 14 235 213) model
            , hintAA8 model
            , insertPic model "https://i.imgur.com/fSgnaQD.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassA8 -> 
            [
              quizLayoutApplied8 lightGreen model
            , answerAA8 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://i.imgur.com/fSgnaQD.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        FailA8 -> 
            [
              quizLayoutApplied8 lightRed model
            , hintAA8 model
            , insertPic model "https://i.imgur.com/fSgnaQD.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        SkippedA8 ->
            [
              quizLayoutApplied8 lightYellow model
            , answerAA8 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://i.imgur.com/fSgnaQD.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        -- Applied Derivatives 9  
        AA9  ->
            [
              quizLayoutApplied9 (rgb 14 235 213) model
            , hintAA9 model
            , insertPic model "https://i.imgur.com/gZqVVYY.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassA9 -> 
            [
              quizLayoutApplied9 lightGreen model
            , answerAA9 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://i.imgur.com/gZqVVYY.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        FailA9 -> 
            [
              quizLayoutApplied9 lightRed model
            , hintAA9 model
            , insertPic model "https://i.imgur.com/gZqVVYY.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        SkippedA9 ->
            [
              quizLayoutApplied9 lightYellow model
            , answerAA9 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://i.imgur.com/gZqVVYY.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        -- Applied Derivatives 10
        AA10  ->
            [
              quizLayoutApplied10 (rgb 14 235 213) model
            , hintAA10 model
            , insertPic model "https://i.imgur.com/HZH9igx.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassA10 -> 
            [
              quizLayoutApplied10 lightGreen model
            , answerAA10 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://i.imgur.com/HZH9igx.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        FailA10 -> 
            [
              quizLayoutApplied10 lightRed model
            , hintAA10 model
            , insertPic model "https://i.imgur.com/HZH9igx.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        SkippedA10 ->
            [
              quizLayoutApplied10 lightYellow model
            , answerAA10 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , insertPic model "https://i.imgur.com/HZH9igx.png"
              |> move (3,45)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        -- Challenge Questions 1    
        CC1  ->
            [
              quizLayoutChallenge (rgb 14 235 213) model "1" qc
            , hintCC1 model
            , aquarium model
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassC1  ->
            [
              quizLayoutChallenge lightGreen model "1" qc
            , answerCC model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , aquarium model
            , statusAlert model "Good Job!" green
            , howToAnswerQ model
              |> move (-8,-50)
            ] 
        Fail1C1  ->
            [
              quizLayoutChallenge lightRed model "1" qc
            , hintCC1 model
            , aquarium model
            , statusAlert model "Oops! Try again..." red
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        Fail2C1  ->
            [
              quizLayoutChallenge lightRed model "1" qc
            , hintCC1 model
            , aquarium model
            , statusAlert model "!!OVERFLOW!!" red
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        SkippedC1  ->
            [
              quizLayoutChallenge lightYellow model "1" qc
            , answerCC model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , aquarium model
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        -- Challenge Questions 2  
        CC2 -> 
            [
              quizLayoutChallenge (rgb 14 235 213) model "2" qc2
            , hintCC2 model
              |> move (0,-5)
            , cc2 model
              |> scale 0.55
              |> move (45,0)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassC2  ->
            [
              quizLayoutChallenge lightGreen model "2" qc2
            , answerCC2 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , cc2 model
              |> scale 0.55
              |> move (45,0)
            , statusAlert model "Good Job!" green
            , howToAnswerQ model
              |> move (-8,-50)
            ] 
        FailC2  ->
            [
              quizLayoutChallenge lightRed model "2" qc2
            , hintCC2 model
              |> move (0,-5)
            , cc2 model
              |> scale 0.55
              |> move (45,0)
            , statusAlert model "Oops! Try again..." red
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        SkippedC2  ->
            [
              quizLayoutChallenge lightYellow model "2" qc2
            , answerCC2 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , cc2 model
              |> scale 0.55
              |> move (45,0)
            , howToAnswerQ model
              |> move (-8,-50)
            ] 
        -- Challenge Questions 3   
        CC3 -> 
            [
              quizLayoutChallenge (rgb 14 235 213) model "3" qc3
            , insertPic model "https://user-images.githubusercontent.com/80813838/113772085-34fa4100-96f2-11eb-9d1a-698e398b8054.PNG"
              |> scale 0.4
              |> move (-70,25)
            , hintCC3 model
              |> move (0,-5)
            , cc3 model
              |> scale 0.5
              |> move (51,-3)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassC3  ->
            [
              quizLayoutChallenge lightGreen model "3" qc3
            , answerCC3 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , cc3 model
              |> scale 0.5
              |> move (51,-3)
            , statusAlert model "Good Job! She's safe" green
              |> scale 0.9
              |> move (10,10)
            , howToAnswerQ model
              |> move (-8,-50)
            ] 
        Fail1C3  ->
            [
              quizLayoutChallenge lightRed model "3" qc3
            , insertPic model "https://user-images.githubusercontent.com/80813838/113772085-34fa4100-96f2-11eb-9d1a-698e398b8054.PNG"
              |> scale 0.4
              |> move (-70,25)
            , hintCC3 model
              |> move (0,-5)
            , cc3 model
              |> scale 0.5
              |> move (51,-3)
            , statusAlert model "You can't stop in the middle of the road!" red
              |> scale 0.45
              |> move (45,30)
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        Fail2C3  ->
            [
              quizLayoutChallenge lightRed model "3" qc3
            , insertPic model "https://user-images.githubusercontent.com/80813838/113772085-34fa4100-96f2-11eb-9d1a-698e398b8054.PNG"
              |> scale 0.4
              |> move (-70,25)
            , hintCC3 model
              |> move (0,-5)
            , cc3 model
              |> scale 0.5
              |> move (51,-3)
            , statusAlert model "Oh no! She's dead" red
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        SkippedC3  ->
            [
              quizLayoutChallenge lightYellow model "3" qc3
            , answerCC3 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , cc3 model
              |> scale 0.5
              |> move (51,-3)
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        -- Challenge Questions 4   
        CC4 -> 
            [
              quizLayoutChallenge (rgb 14 235 213) model "4" qc4
            , insertPic model "https://user-images.githubusercontent.com/80813838/113961786-93a7e380-97f4-11eb-953c-ec1d27a3f334.PNG"
              |> scale 0.3
              |> move (-70,37)
            , hintCC4 model
              |> move (0,-5)
            , cc4 model
              |> scale 1.5
              |> move (-5,0)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassC4  ->
            [
              quizLayoutChallenge lightGreen model "4" qc4
            , insertPic model "https://user-images.githubusercontent.com/80813838/113961786-93a7e380-97f4-11eb-953c-ec1d27a3f334.PNG"
              |> scale 0.3
              |> move (-70,37)
            , answerCC4 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , cc4 model
              |> scale 1.5
              |> move (-5,0)
            , statusAlert model "Good Job!" green
              |> scale 1.5
              |> move (-5,0)
            , howToAnswerQ model
              |> move (-8,-50)
            ] 
        Fail1C4  ->
            [
              quizLayoutChallenge lightRed model "4" qc4
            , insertPic model "https://user-images.githubusercontent.com/80813838/113961786-93a7e380-97f4-11eb-953c-ec1d27a3f334.PNG"
              |> scale 0.3
              |> move (-70,37)
            , hintCC4 model
              |> move (0,-5)
            , cc4 model
              |> scale 1.5
              |> move (-5,0)
            , statusAlert model "The ball did not reach the basket!" red
              |> scale 0.45
              |> move (45,30)
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        Fail2C4  ->
            [
              quizLayoutChallenge lightRed model "4" qc4
            , insertPic model "https://user-images.githubusercontent.com/80813838/113961786-93a7e380-97f4-11eb-953c-ec1d27a3f334.PNG"
              |> scale 0.3
              |> move (-70,37)
            , hintCC4 model
              |> move (0,-5)
            , cc4 model
              |> scale 1.5
              |> move (-5,0)
            , statusAlert model "Oh no!" red
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        SkippedC4  ->
            [
              quizLayoutChallenge lightYellow model "4" qc4
            , insertPic model "https://user-images.githubusercontent.com/80813838/113961786-93a7e380-97f4-11eb-953c-ec1d27a3f334.PNG"
              |> scale 0.3
              |> move (-70,37)
            , answerCC4 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , cc4 model
              |> scale 1.5
              |> move (-5,0)
            , howToAnswerQ model
              |> move (-8,-50)
            ]   
        -- Challenge Questions 5
        CC5 -> 
            [
              quizLayoutChallenge (rgb 14 235 213) model "5" qc5
            , hintCC5 model
              |> move (0,-5)
            , cc5 model
              |> clip (square 130|>ghost)
              |> scale 1.5
              |> move (-3,0)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        PassC5  ->
            [
              quizLayoutChallenge lightGreen model "5" qc5
            , answerCC5 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , cc5 model
              |> clip (square 130|>ghost)
              |> scale 1.5
              |> move (-3,0)
            , statusAlert model "Good Job!" green
              |> scale 0.9
              |> move (10,10)
            , howToAnswerQ model
              |> move (-8,-50)
            ] 
        Fail1C5  ->
            [
              quizLayoutChallenge lightRed model "5" qc5
            , hintCC5 model
              |> move (0,-5)
            , cc5 model
              |> clip (square 130|>ghost)
              |> scale 1.5
              |> move (-3,0)
            , statusAlert model "The trees are dead!" red
              |> move (5,0)
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        Fail2C5  ->
            [
              quizLayoutChallenge lightRed model "5" qc5
            , hintCC5 model
              |> move (0,-5)
            , cc5 model
              |> clip (square 130|>ghost)
              |> scale 1.5
              |> move (-3,0)
            , statusAlert model "The trees are dead!" red
              |> move (5,0)
            , howToAnswerQ model
              |> move (-8,-50)
            ]  
        SkippedC5  ->
            [
              quizLayoutChallenge lightYellow model "5" qc5
            , answerCC5 model
            , next |> scale 0.75 |> move (-69,-15) |> notifyTap Next
            , cc5 model
              |> clip (square 130|>ghost)
              |> scale 1.5
              |> move (-3,0)
            , howToAnswerQ model
              |> move (-8,-50)
            ]
        GoodJob -> 
            [ 
              goodJob model,
              homeButton |> notifyTap ToHome
            ]
          
type Msg = Tick Float GetKeyState
           -- for visible confirmation
           | HoverQuiz
           | HoverHelp
           | LeaveQuiz
           | LeaveHelp
           | HoverSimple
           | HoverApplied
           | HoverChallenge
           | LeaveChallenge
           | LeaveApplied
           | LeaveSimple
           | HoverExit
           | LeaveExit
           | HoverExplainHelp
           | LeaveExplainHelp
           -- state changes
           | ToHome
           | ToSupport
           | ToTopics
           | ToSD1
           | ToA1
           | ToC1
           | Next
           -- Hints and quiz submission
           | Submit 
           | Skip
           | OpenHint1
           | OpenHint2
           | OpenHint3
           | CloseHint
           -- answer box
           | SetText String
           | ChangeTab Tabs
           --how to answer
           | HowToAnswerOpen               

-- Answers Steps
type Tabs
    = Step1
    | Step2
    | Step3
    | Step4
   
-- HintStates  
type HintState = Open1
               | Open2 
               | Open3 
               | Closed

type State = Home
           | Topics 
           | SD1
           | SD2
           | SD3 
           | SD4 
           | SD5 
           | SD6 
           | SD7 
           | SD8 
           | SD9 
           | SD10
           | AA1
           | AA2
           | AA3
           | AA4
           | AA5
           | AA6
           | AA7
           | AA8
           | AA9
           | AA10
           | CC1 
           | CC2
           | CC3
           | CC4
           | CC5
           | PassS1
           | FailS1
           | SkippedS1
           | PassS2 
           | FailS2 
           | SkippedS2 
           | PassS3 
           | FailS3 
           | SkippedS3 
           | PassS4 
           | FailS4 
           | SkippedS4 
           | PassS5 
           | FailS5 
           | SkippedS5 
           | PassS6 
           | FailS6 
           | SkippedS6 
           | PassS7 
           | FailS7 
           | SkippedS7 
           | PassS8 
           | FailS8 
           | SkippedS8 
           | PassS9 
           | FailS9 
           | SkippedS9 
           | PassS10 
           | FailS10 
           | SkippedS10 
           | PassA1
           | FailA1
           | SkippedA1
           | PassA2 
           | FailA2 
           | SkippedA2 
           | PassA3
           | FailA3
           | SkippedA3
           | PassA4
           | FailA4
           | SkippedA4
           | PassA5
           | FailA5
           | SkippedA5
           | PassA6
           | FailA6
           | SkippedA6
           | PassA7
           | FailA7
           | SkippedA7
           | PassA8
           | FailA8
           | SkippedA8
           | PassA9
           | FailA9
           | SkippedA9
           | PassA10
           | FailA10
           | SkippedA10
           | PassC1
           | Fail1C1
           | Fail2C1
           | SkippedC1
           | PassC2
           | FailC2
           | SkippedC2
           | PassC3
           | Fail1C3
           | Fail2C3
           | SkippedC3
           | PassC4
           | Fail1C4
           | Fail2C4
           | SkippedC4
           | PassC5
           | Fail1C5
           | Fail2C5
           | SkippedC5
           | GoodJob

update msg model =
    case msg of
        Tick t _ -> { model | time = t } 
        
        --for visual confirmation (Hover)
        HoverQuiz -> { model | scalerQuiz = 0.85}
        HoverHelp -> { model | scalerHelp = 0.85}
        HoverSimple -> { model | scalerSimple = 0.9}
        HoverApplied -> { model | scalerApplied = 0.9}
        HoverChallenge -> { model | scalerChallenge = 0.9}
        HoverExplainHelp -> { model | transpExplainHelp = 1}
        HoverExit -> { model | scalerExit = 1.1}
        
        --for visual confirmation (Leave Hover)
        LeaveQuiz -> { model | scalerQuiz = 0.75}
        LeaveHelp -> { model | scalerHelp = 0.75}
        LeaveSimple -> { model | scalerSimple = 0.8}
        LeaveApplied -> { model | scalerApplied = 0.8}
        LeaveChallenge -> { model | scalerChallenge = 0.8}
        LeaveExit -> { model | scalerExit = 1}
        LeaveExplainHelp -> { model | transpExplainHelp = 0}
        
        --state changes
        ToHome -> { model | state = Home
                          , hintState = Closed
                          , scalerExit = 1
                          , scalerQuiz = 0.75
                          , scalerHelp = 0.75
                          , scalerSimple = 0.8
                          , scalerApplied = 0.8
                          , scalerChallenge = 0.8
                          , transpExplainHelp = 0
                  }     
        ToSupport -> { model | state = Home }
        ToTopics -> { model | state = Topics }
        ToSD1 -> { model | state = SD1, itext = "" }
        ToA1 -> { model | state = AA1, itext = "" }
        ToC1 -> { model | state = CC1, itext = "" }
        
        -- Next button
        Next -> { model | state = case model.state of 
                                    PassS1 -> SD2
                                    SkippedS1 -> SD2
                                    PassS2 -> SD3 
                                    SkippedS2 -> SD3 
                                    PassS3 -> SD4 
                                    SkippedS3 -> SD4 
                                    PassS4 -> SD5 
                                    SkippedS4 -> SD5 
                                    PassS5 -> SD6 
                                    SkippedS5 -> SD6 
                                    PassS6 -> SD7 
                                    SkippedS6 -> SD7 
                                    PassS7 -> SD8 
                                    SkippedS7 -> SD8 
                                    PassS8 -> SD9 
                                    SkippedS8 -> SD9 
                                    PassS9 -> SD10 
                                    SkippedS9 -> SD10 
                                    PassS10 -> GoodJob 
                                    SkippedS10 -> GoodJob 
                                    PassA1 -> AA2
                                    SkippedA1 -> AA2
                                    PassA2 -> AA3
                                    SkippedA2 -> AA3
                                    PassA3 -> AA4
                                    SkippedA3 -> AA4
                                    PassA4 -> AA5
                                    SkippedA4 -> AA5
                                    PassA5 -> AA6
                                    SkippedA5 -> AA6
                                    PassA6 -> AA7
                                    SkippedA6 -> AA7
                                    PassA7 -> AA8
                                    SkippedA7 -> AA8
                                    PassA8 -> AA9
                                    SkippedA8 -> AA9
                                    PassA9 -> AA10
                                    SkippedA9 -> AA10
                                    PassA10 -> GoodJob
                                    SkippedA10 -> GoodJob
                                    PassC1 -> CC2
                                    SkippedC1 -> CC2
                                    PassC2 -> CC3
                                    SkippedC2 -> CC3
                                    PassC3 -> CC4
                                    SkippedC3 -> CC4
                                    PassC4 -> CC5
                                    SkippedC4 -> CC5
                                    PassC5 -> GoodJob
                                    SkippedC5 -> GoodJob
                                    otherwise -> model.state
                 , deltaTime = model.time
                 , hintState = Closed 
                 , transpExplainHelp = 0
                 , how = 0
                 , itext = ""
                 }
        
        -- quiz submission and hints
        Submit -> { model | state = 
                                 let 
                                    ans = case String.toInt model.itext of
                                            Just x -> x
                                            Nothing -> 0
                                 in
                                    case model.state of
                                      SD1 -> if model.itext == answerS1 
                                             then PassS1
                                             else FailS1
                                      FailS1 -> if model.itext == answerS1 
                                             then PassS1
                                             else FailS1
                                      SD2 -> if model.itext == answerS2 
                                             then PassS2
                                             else FailS2
                                      FailS2 -> if model.itext == answerS2
                                             then PassS2
                                             else FailS2
                                      SD3 -> if model.itext == answerS3 
                                             then PassS3
                                             else FailS3
                                      FailS3 -> if model.itext == answerS3
                                             then PassS3
                                             else FailS3
                                      SD4 -> if model.itext == answerS4
                                             then PassS4
                                             else FailS4
                                      FailS4 -> if model.itext == answerS4
                                             then PassS4
                                             else FailS4
                                      SD5 -> if model.itext == answerS5 
                                             then PassS5
                                             else FailS5
                                      FailS5 -> if model.itext == answerS5 
                                             then PassS5
                                             else FailS5
                                      SD6 -> if model.itext == answerS6   
                                             then PassS6
                                             else FailS6
                                      FailS6 -> if model.itext == answerS6  
                                             then PassS6
                                             else FailS6
                                      SD7 -> if model.itext == answerS7 
                                             then PassS7
                                             else FailS7
                                      FailS7 -> if model.itext == answerS7 
                                             then PassS7
                                             else FailS7
                                      SD8 -> if model.itext == answerS8 
                                             then PassS8
                                             else FailS8
                                      FailS8 -> if model.itext == answerS8 
                                             then PassS8
                                             else FailS8
                                      SD9 -> if model.itext == answerS9 
                                             then PassS9
                                             else FailS9
                                      FailS9 -> if model.itext == answerS9 
                                             then PassS9
                                             else FailS9
                                      SD10 -> if model.itext == answerS10 
                                             then PassS10
                                             else FailS10
                                      FailS10 -> if model.itext == answerS10 
                                             then PassS10
                                             else FailS10
                                      AA1 -> if model.itext == answerA1 
                                             then PassA1
                                             else FailA1
                                      FailA1 -> if model.itext == answerA1 
                                             then PassA1
                                             else FailA1
                                      AA2 -> if model.itext == answerA2 
                                             then PassA2
                                             else FailA2
                                      FailA2 -> if model.itext == answerA2 
                                             then PassA2
                                             else FailA2
                                      AA3 -> if model.itext == answerA3 
                                             then PassA3
                                             else FailA3
                                      FailA3 -> if model.itext == answerA3 
                                             then PassA3
                                             else FailA3
                                      AA4 -> if model.itext == answerA4 
                                             then PassA4
                                             else FailA4
                                      FailA4 -> if model.itext == answerA4 
                                             then PassA4
                                             else FailA4
                                      AA5 -> if model.itext == answerA5 
                                             then PassA5
                                             else FailA5
                                      FailA5 -> if model.itext == answerA5 
                                             then PassA5
                                             else FailA5
                                      AA6 -> if model.itext == answerA6 
                                             then PassA6
                                             else FailA6
                                      FailA6 -> if model.itext == answerA6 
                                             then PassA6
                                             else FailA6
                                      AA7 -> if model.itext == answer7A   
                                             then PassA7
                                             else FailA7
                                      FailA7 -> if model.itext == answer7A 
                                             then PassA7
                                             else FailA7
                                      AA8 -> if model.itext == answer8A 
                                             then PassA8
                                             else FailA8
                                      FailA8 -> if model.itext == answer8A  
                                             then PassA8
                                             else FailA8
                                      AA9 -> if model.itext == answer9A  
                                             then PassA9
                                             else FailA9
                                      FailA9 -> if model.itext == answer9A 
                                             then PassA9
                                             else FailA9
                                      AA10 -> if model.itext == answer10A 
                                             then PassA10
                                             else FailA10
                                      FailA10 -> if model.itext == answer10A 
                                             then PassA10
                                             else FailA10
                                      CC1 -> if ans < answerC1 
                                             then Fail1C1
                                             else if ans > answerC1
                                             then Fail2C1
                                             else PassC1
                                      Fail1C1 -> if ans < answerC1 
                                                 then Fail1C1
                                                 else if ans > answerC1
                                                 then Fail2C1
                                                 else PassC1
                                      Fail2C1 -> if ans < answerC1 
                                                 then Fail1C1
                                                 else if ans > answerC1
                                                 then Fail2C1
                                                 else PassC1
                                      CC2 -> if ans == answer2C
                                             then PassC2
                                             else FailC2
                                      FailC2 -> if ans == answer2C 
                                                then PassC2
                                                else FailC2
                                      CC3 -> if ans < answerC3 
                                             then Fail1C3
                                             else if ans > answerC3
                                             then Fail2C3
                                             else PassC3
                                      Fail1C3 -> if ans < answerC3
                                                 then Fail1C3
                                                 else if ans > answerC3
                                                 then Fail2C3
                                                 else PassC3
                                      Fail2C3 -> if ans < answerC3
                                                 then Fail1C3
                                                 else if ans > answerC3
                                                 then Fail2C3
                                                 else PassC3
                                      CC4 -> if ans < answerC4 
                                             then Fail1C4
                                             else if ans > answerC4
                                             then Fail2C4
                                             else PassC4
                                      Fail1C4 -> if ans < answerC4
                                                 then Fail1C4
                                                 else if ans > answerC4
                                                 then Fail2C4
                                                 else PassC4
                                      Fail2C4 -> if ans < answerC4
                                                 then Fail1C4
                                                 else if ans > answerC4
                                                 then Fail2C4
                                                 else PassC4
                                      CC5 -> if ans < answerC5 
                                             then Fail1C5
                                             else if ans > answerC5
                                             then Fail2C5
                                             else PassC5
                                      Fail1C5 -> if ans < answerC5
                                                 then Fail1C5
                                                 else if ans > answerC5
                                                 then Fail2C5
                                                 else PassC5
                                      Fail2C5 -> if ans < answerC5
                                                 then Fail1C5
                                                 else if ans > answerC5
                                                 then Fail2C5
                                                 else PassC5
                                      otherwise -> model.state
                          
                           , deltaTime = model.time }
        
        -- Skip button
        Skip -> { model | state = case model.state of
                                    SD1 -> SkippedS1
                                    FailS1 -> SkippedS1
                                    SD2 -> SkippedS2 
                                    FailS2 -> SkippedS2 
                                    SD3 -> SkippedS3 
                                    FailS3 -> SkippedS3 
                                    SD4 -> SkippedS4 
                                    FailS4 -> SkippedS4
                                    SD5 -> SkippedS5
                                    FailS5 -> SkippedS5
                                    SD6 -> SkippedS6
                                    FailS6 -> SkippedS6 
                                    SD7 -> SkippedS7 
                                    FailS7 -> SkippedS7
                                    SD8 -> SkippedS8 
                                    FailS8 -> SkippedS8 
                                    SD9 -> SkippedS9 
                                    FailS9 -> SkippedS9
                                    SD10 -> SkippedS10 
                                    FailS10 -> SkippedS10
                                    AA1 -> SkippedA1
                                    FailA1 -> SkippedA1
                                    AA2 -> SkippedA2 
                                    FailA2 -> SkippedA2
                                    AA3 -> SkippedA3
                                    FailA3 -> SkippedA3
                                    AA4 -> SkippedA4
                                    FailA4 -> SkippedA4
                                    AA5 -> SkippedA5
                                    FailA5 -> SkippedA5
                                    AA6 -> SkippedA6
                                    FailA6 -> SkippedA6
                                    AA7 -> SkippedA7
                                    FailA7 -> SkippedA7
                                    AA8 -> SkippedA8
                                    FailA8 -> SkippedA8
                                    AA9 -> SkippedA9
                                    FailA9 -> SkippedA9
                                    AA10 -> SkippedA10
                                    FailA10 -> SkippedA10
                                    CC1 -> SkippedC1
                                    Fail1C1 -> SkippedC1
                                    Fail2C1 -> SkippedC1
                                    CC2 -> SkippedC2
                                    FailC2 -> SkippedC2
                                    CC3 -> SkippedC3
                                    Fail1C3 -> SkippedC3
                                    Fail2C3 -> SkippedC3
                                    CC4 -> SkippedC4
                                    Fail1C4 -> SkippedC4
                                    Fail2C4 -> SkippedC4
                                    CC5 -> SkippedC5
                                    Fail1C5 -> SkippedC5
                                    Fail2C5 -> SkippedC5
                                    otherwise -> model.state 
                                    
                          , deltaTime = model.time }
        
        -- Hints
        OpenHint1 -> { model | hintState = Open1 }
        OpenHint2 -> { model | hintState = Open2 }
        OpenHint3 -> { model | hintState = Open3 }
        CloseHint -> { model | hintState = Closed }
        
        SetText text -> { model | itext = text }      -- text box   
        ChangeTab tabs -> { model | tabState = tabs } -- changing tabs
        HowToAnswerOpen ->  { model | how = if model.how == 0 then 1 else 0 } -- answer instructions


type alias Model =
    { time : Float
    , state : State
    , pos : (Float, Float)
    , scalerQuiz : Float
    , scalerHelp : Float
    , scalerSimple : Float
    , scalerApplied : Float
    , scalerChallenge : Float
    , scalerExit : Float
    , hintState : HintState
    , itext : String
    , tabState : Tabs
    , deltaTime : Float
    , transpExplainHelp : Float
    , how : Float
    }

init : Model
init = { time = 0 
       , deltaTime = 0
       , state = Home
       , pos = (0,0)
       , scalerQuiz = 0.75
       , scalerHelp = 0.75
       , scalerSimple = 0.8
       , scalerApplied = 0.8
       , scalerChallenge = 0.8
       , scalerExit = 1
       , hintState = Closed
       , itext = ""
       , tabState = Step1
       , transpExplainHelp = 0
       , how = 0
       }  

-- Answers
{-----------------------------------------------------------------------------------
------------------------------------------------------------------------------------}
-- Simple derivatives answer
answerS1 = "2"
answerS2 = "1"
answerS3 = "cos(x)"
answerS4 = "3x^2" 
answerS5 = "-1/(x^2)" 
answerS6 = "15x^2" 
answerS7 = "3x^2 – 4x^3" 
answerS8 = "cos(x)^2 – sin2(x)^2" 
answerS9 = "− (xsin(x) + cos(x))/x^2" 
answerS10 = "2xcos(x^2)" 

-- Applied answers
answerA1 = "y=4"
answerA2 = "4" -- ADD here
answerA3 = "-4,4"-- ADD here
answerA4 = "y=-18x+35"-- ADD here
answerA5 = "y=x+11"-- ADD here
answerA6 = "y=x+4"-- ADD here
answer7A = "d"
answer8A = "a"
answer9A = "y=4x+1"
answer10A = "b"

-- Challenge answers
answerC1 = 27
answer2C = -12
answerC3 = 5
answerC4 = 86
answerC5 = 15

{--
ANSWER DESIGNS ----------------- Simple derivatives
--}
answerDesSD1 model = insertPic model "https://user-images.githubusercontent.com/80813838/111440218-8491b200-86dc-11eb-9a8a-fc9218d0c9c0.PNG"
answerDesSD2 model = insertPic model "https://user-images.githubusercontent.com/39256132/114322965-181b9e80-9b34-11eb-89b3-bd9a760131ff.PNG"
answerDesSD3 model = insertPic model "https://user-images.githubusercontent.com/39256132/114322967-18b43500-9b34-11eb-9f71-a6a1ccf5ef2b.PNG"

answerDesSD4 model = insertPic model "https://user-images.githubusercontent.com/39256132/114322968-194ccb80-9b34-11eb-8ce1-5ae16d0d6f30.PNG"
answerDesSD5 model = insertPic model "https://user-images.githubusercontent.com/39256132/114322970-194ccb80-9b34-11eb-863e-7d56971e82a3.PNG"
                      |> scale 0.8
                      |> move(5,5)
answerDesSD6 model = insertPic model "https://user-images.githubusercontent.com/39256132/114322964-17830800-9b34-11eb-8a7f-43ad90c05d46.PNG"
                      |> move(0,12)
answerDesSD7 model = insertPic model "https://user-images.githubusercontent.com/39256132/114323003-54e79580-9b34-11eb-9c65-c9a9e93c15ef.PNG"
                      |> move(0,12)
answerDesSD8 model = insertPic model "https://user-images.githubusercontent.com/39256132/114323005-55802c00-9b34-11eb-8f09-744ca7cb9fef.PNG"
answerDesSD9 model = insertPic model "https://user-images.githubusercontent.com/39256132/114323006-55802c00-9b34-11eb-8212-c4d4c7d19dce.PNG" --Added Here
answerDesSD10 model = insertPic model "https://user-images.githubusercontent.com/39256132/114323007-5618c280-9b34-11eb-9af2-d8d7a016197e.PNG"
                       |> move(0,12)
                       
answerSDLayout = group 
            [
             rect 80 60
             |> filled white
             |> addOutline (solid 1) (rgb 14 235 213)
             |> move (0,-12),
             
             text "Answer:"
             |> customFont "Calibri"
             |> centered
             |> underline
             |> bold
             |> filled black
             |> scale 0.5
             |> move (-27,10)
            ]  
 
{--
ANSWER DESIGNS ----------------- Applied derivatives
--}

answerAA model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)
                  
                  ,answerA model
                   |> scale 0.3
                   |> move (-90,22.5)
                 ]

answerAA2 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)

                  ,answerAQ2 model
                   |> scale 0.3
                   |> move (-90,22.5)
                 ]

answerAA3 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)

                  ,answerAQ3 model
                   |> scale 0.3
                   |> move (-90,22.5)
                 ]

answerAA4 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)

                  ,answerAQ4 model
                   |> scale 0.3
                   |> move (-90,22.5)
                 ]

answerAA5 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)

                  ,answerAQ5 model
                   |> scale 0.3
                   |> move (-90,22.5)
                 ]

answerAA6 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)

                  ,answerAQ6 model
                   |> scale 0.3
                   |> move (-90,22.5)
                 ]

answerA model = GraphicSVG.html 280 200 ( 
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContent model.tabState
                                        ])

renderTabContent currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/80813838/111882890-77035300-898e-11eb-9d10-3ed8fffa8db1.PNG"
                                   , class "d-inline-block align-top"
                                   , style  "width" "265px" 
                                   ] [] ] 

        Step2 ->
            Html.div [] [Html.img [ src "https://user-images.githubusercontent.com/80813838/111882886-710d7200-898e-11eb-862f-559cd1eec2a1.PNG"
                                  , class "d-inline-block align-top"
                                  , style  "width" "280px" 
                                  ] [] ] 

        Step3 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/80813838/111581720-26bea200-8790-11eb-8265-095dab0149a7.PNG"
                                 , class "d-inline-block align-top"
                                 , style  "width" "290px" 
                                  ] [] ] 
        otherwise -> Html.div [] []

answerAQ2 model = GraphicSVG.html 280 200 (
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContent2 model.tabState
                                        ])

answerAQ3 model = GraphicSVG.html 280 200 (
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContent3 model.tabState
                                        ])

answerAQ4 model = GraphicSVG.html 280 200 (
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContent4 model.tabState
                                        ])

answerAQ5 model = GraphicSVG.html 280 200 (
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContent5 model.tabState
                                        ])
                                        
answerAQ6 model = GraphicSVG.html 280 200 (
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContent6 model.tabState
                                        ])

renderTabContent2 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/30901422/113961792-9571a700-97f4-11eb-91e2-c637bf5d257d.png"
                                   , class "d-inline-block align-top"
                                   , style  "width" "265px"
                                   ] [] ]

        Step2 ->
            Html.div [] [Html.img [ src "https://user-images.githubusercontent.com/30901422/113961845-a8847700-97f4-11eb-8062-70239158c3e0.png"
                                  , class "d-inline-block align-top"
                                  , style  "width" "280px"
                                  ] [] ]

        Step3 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/30901422/113961970-df5a8d00-97f4-11eb-838a-fc2a5942a0d7.png"
                                 , class "d-inline-block align-top"
                                 , style  "width" "290px"
                                  ] [] ]
        otherwise -> Html.div [] []

renderTabContent3 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/30901422/114066102-57629a80-9869-11eb-886c-7ab39a58748c.png"
                                   , class "d-inline-block align-top"
                                   , style  "width" "265px"
                                   ] [] ]

        Step2 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/30901422/114066249-837e1b80-9869-11eb-8298-825ba4ded2f0.png"
                                  , class "d-inline-block align-top"
                                  , style  "width" "280px"
                                  ] [] ]

        Step3 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/30901422/114066290-92fd6480-9869-11eb-992e-68cb8d62321e.png"
                                 , class "d-inline-block align-top"
                                 , style  "width" "290px"
                                  ] [] ]
        otherwise -> Html.div [] []

renderTabContent4 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/30901422/114066843-2767c700-986a-11eb-9cde-1188b3564902.png"
                                   , class "d-inline-block align-top"
                                   , style  "width" "265px"
                                   ] [] ]

        Step2 ->
            Html.div [] [Html.img [ src "https://user-images.githubusercontent.com/30901422/114066642-f1c2de00-9869-11eb-83e5-1553b3f02f49.png"
                                  , class "d-inline-block align-top"
                                  , style  "width" "280px"
                                  ] [] ]

        Step3 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/30901422/114066937-3d758780-986a-11eb-878d-1abb46368da3.png"
                                 , class "d-inline-block align-top"
                                 , style  "width" "290px"
                                  ] [] ]
        otherwise -> Html.div [] []

renderTabContent5 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/30901422/114067086-6b5acc00-986a-11eb-80dc-e563bd96e717.png"
                                   , class "d-inline-block align-top"
                                   , style  "width" "265px"
                                   ] [] ]

        Step2 ->
            Html.div [] [Html.img [ src "https://user-images.githubusercontent.com/30901422/114067145-7a417e80-986a-11eb-969d-6c16592313e2.png"
                                  , class "d-inline-block align-top"
                                  , style  "width" "280px"
                                  ] [] ]

        Step3 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/30901422/114067187-862d4080-986a-11eb-8a02-5530127f0e36.png"
                                 , class "d-inline-block align-top"
                                 , style  "width" "290px"
                                  ] [] ]
        otherwise -> Html.div [] []

renderTabContent6 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/30901422/114067951-5cc0e480-986b-11eb-9b21-70c328959985.png"
                                   , class "d-inline-block align-top"
                                   , style  "width" "265px"
                                   ] [] ]

        Step2 ->
            Html.div [] [Html.img [ src "https://user-images.githubusercontent.com/30901422/114068010-6ea28780-986b-11eb-9477-1fdef8f9320d.png"
                                  , class "d-inline-block align-top"
                                  , style  "width" "280px"
                                  ] [] ]

        Step3 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/30901422/114068054-7a8e4980-986b-11eb-9b95-a29847ac3054.png"
                                 , class "d-inline-block align-top"
                                 , style  "width" "290px"
                                  ] [] ]
        otherwise -> Html.div [] []

renderHeaders currentTab =
    Html.ul [ class "nav nav-tabs" ]
        [ Html.li [ class "nav-item" ]
            [ Html.a
                [ class "nav-link"
                , Events.onClick (ChangeTab Step1)
                , classList [ ( "active", currentTab == Step1 ) ]
                ]
                [ Html.text "Step 1" ]
            ]
        , Html.li [ class "nav-item" ]
            [ Html.a
                [ class "nav-link"
                , Events.onClick (ChangeTab Step2)
                , classList [ ( "active", currentTab == Step2 ) ]
                ]
                [ Html.text "Step 2" ]
            ]
        , Html.li [ class "nav-item" ]
            [ Html.a
                [ class "nav-link"
                , Events.onClick (ChangeTab Step3)
                , classList [ ( "active", currentTab == Step3 ) ]
                ]
                [ Html.text "Step 3" ]
            ]
        ]

answerAA7 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)
                  
                  ,answerA7 model
                   |> scale 0.3
                   |> move (-90,22.5)
                 ]

answerA7 model = GraphicSVG.html 280 200 ( 
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContent7 model.tabState
                                        ])

answerAA8 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)
                  
                  ,answerA8 model
                   |> scale 0.3
                   |> move (-90,22.5)
                 ]

answerA8 model = GraphicSVG.html 280 200 ( 
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContent8 model.tabState
                                        ])

answerAA9 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)
                  
                  ,answerA9 model
                   |> scale 0.3
                   |> move (-90,22.5)
                 ]

answerA9 model = GraphicSVG.html 280 200 ( 
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContent9 model.tabState
                                        ])

answerAA10 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)
                  
                  ,answerA10 model
                   |> scale 0.3
                   |> move (-90,22.5)
                 ]

answerA10 model = GraphicSVG.html 280 200 ( 
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContent10 model.tabState
                                        ])

renderTabContent7 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://i.imgur.com/VZhHQVZ.png"
                                   , class "d-inline-block align-top"
                                   , style  "width" "265px" 
                                   ] [] ] 

        Step2 ->
            Html.div [] [Html.img [ src "https://i.imgur.com/O3xr8MD.png"
                                  , class "d-inline-block align-top"
                                  , style  "width" "280px" 
                                  ] [] ] 

        Step3 ->
            Html.div [] [Html.img [src "https://i.imgur.com/uFEzjKJ.png"
                                 , class "d-inline-block align-top"
                                 , style  "width" "290px" 
                                  ] [] ] 
        otherwise -> Html.div [] [] 

renderTabContent8 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://i.imgur.com/kiRONZC.png"
                                   , class "d-inline-block align-top"
                                   , style  "width" "265px" 
                                   ] [] ] 

        Step2 ->
            Html.div [] [Html.img [ src "https://i.imgur.com/JnGlxvT.png"
                                  , class "d-inline-block align-top"
                                  , style  "width" "280px" 
                                  ] [] ] 

        Step3 ->
            Html.div [] [Html.img [src "https://i.imgur.com/J9MTV0w.png"
                                 , class "d-inline-block align-top"
                                 , style  "width" "290px" 
                                  ] [] ] 
        otherwise -> Html.div [] []

renderTabContent9 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://i.imgur.com/RGpnK3A.png"
                                   , class "d-inline-block align-top"
                                   , style  "width" "265px" 
                                   ] [] ] 

        Step2 ->
            Html.div [] [Html.img [ src "https://i.imgur.com/nuUVpIO.png"
                                  , class "d-inline-block align-top"
                                  , style  "width" "280px" 
                                  ] [] ] 

        Step3 ->
            Html.div [] [Html.img [src "https://i.imgur.com/c8DqUzN.png"
                                 , class "d-inline-block align-top"
                                 , style  "width" "290px" 
                                  ] [] ] 
        otherwise -> Html.div [] []

renderTabContent10 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://i.imgur.com/3UumOuJ.png"
                                   , class "d-inline-block align-top"
                                   , style  "width" "265px" 
                                   ] [] ] 

        Step2 ->
            Html.div [] [Html.img [ src "https://i.imgur.com/WbVaJbV.png"
                                  , class "d-inline-block align-top"
                                  , style  "width" "280px" 
                                  ] [] ] 

        Step3 ->
            Html.div [] [Html.img [src "https://i.imgur.com/td5GRVq.png"
                                 , class "d-inline-block align-top"
                                 , style  "width" "290px" 
                                  ] [] ] 
        otherwise -> Html.div [] []

--applied question 7
q7 = group 
     [
      text "Given the following equation, chose the"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,
       
       text "graph that lines up with its derivative."
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13)
     ]


eq7 = group
     [
       text "f(x) = (4x² - 3x + 2)⁻²"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black
       |> scale 0.9
      ]
--applied question 8 (no eq8)
q8 = group 
     [
      text "Which function has its derivative represented"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,
       
       text "by this graph?"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13)
     ]
--applied question 9 (no eq9)
q9 = group 
     [
      text "Given the following points, find the"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,
       
       text "equation for this functions derivative."
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13)
     ]
--applied question 10

q10 = group 
     [
      text "Given the following equation, chose the"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,
       
       text "graph that lines up with its derivative."
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13)
     ]


eq10 = group
     [
       text "f(x) = (6x²+7x)⁴"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black
      ]



{--
ANSWER DESIGNS ----------------- Challenge answers
--}
-- ANSWERC1
answerCC model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)
                  
                  ,answerC model
                   |> scale 0.25
                   |> move (-90,22.5)
                 ]

answerC model = GraphicSVG.html 350 250 ( 
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeadersC model.tabState
                                        , renderTabContentC model.tabState])
          
renderTabContentC currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/80813838/111690017-15fb4400-8803-11eb-8877-15b7768a0e7f.PNG"
                                   , class "d-inline-block align-top"
                                   , style  "width" "340px" 
                                   ] [] ] 

        Step2 ->
            Html.div [] [Html.img [ src "https://user-images.githubusercontent.com/80813838/111690368-77231780-8803-11eb-848c-0191b6a3a545.PNG"
                                  , class "d-inline-block align-top"
                                  , style  "width" "360px" 
                                  ] [] ] 

        Step3 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/80813838/111691247-82c30e00-8804-11eb-9c4d-96c64f99c53f.PNG"
                                 , class "d-inline-block align-top"
                                 , style  "width" "250px" 
                                  ] [] ] 
        Step4 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/80813838/111691943-37f5c600-8805-11eb-8ccc-224eaf0df0d6.PNG"
                                 , class "d-inline-block align-top"
                                 , style  "width" "200px" 
                                  ] [] ] 

renderHeadersC currentTab =
    Html.ul [ class "nav nav-tabs" ]
        [ Html.li [ class "nav-item" ]
            [ Html.a
                [ class "nav-link"
                , Events.onClick (ChangeTab Step1)
                , classList [ ( "active", currentTab == Step1 ) ]
                ]
                [ Html.text "Step 1" ]
            ]
        , Html.li [ class "nav-item" ]
            [ Html.a
                [ class "nav-link"
                , Events.onClick (ChangeTab Step2)
                , classList [ ( "active", currentTab == Step2 ) ]
                ]
                [ Html.text "Step 2" ]
            ]
        , Html.li [ class "nav-item" ]
            [ Html.a
                [ class "nav-link"
                , Events.onClick (ChangeTab Step3)
                , classList [ ( "active", currentTab == Step3 ) ]
                ]
                [ Html.text "Step 3" ]
            ]
        , Html.li [ class "nav-item" ]
            [ Html.a
                [ class "nav-link"
                , Events.onClick (ChangeTab Step4)
                , classList [ ( "active", currentTab == Step4 ) ]
                ]
                [ Html.text "Step 4" ]
            ]
        ]
                 
-- ANSWERC2
answerCC2 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)
                  
                , answerC2 model
                  |> scale 0.25
                  |> move (-90,22.5)
                 ]

answerC2 model = GraphicSVG.html 350 250 ( 
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContentC2 model.tabState])
          
renderTabContentC2 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/80813838/112696743-c1884200-8e5c-11eb-93c7-a453743978b2.PNG"
                                   , class "d-inline-block align-top"
                                   , style  "width" "250px" 
                                   ] [] ] 

        Step2 ->
            Html.div [] [Html.img [ src "https://user-images.githubusercontent.com/80813838/112696754-c77e2300-8e5c-11eb-808f-d0ba24e2553d.PNG"
                                  , class "d-inline-block align-top"
                                  , style  "width" "310px" 
                                  ] [] ] 

        Step3 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/80813838/112696764-ccdb6d80-8e5c-11eb-81de-ac8a26026337.PNG"
                                 , class "d-inline-block align-top"
                                 , style  "width" "240px" 
                                  ] [] ] 
        
        otherwise -> Html.div [] []

-- ANSWER CC3
answerCC3 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)
                  
                  ,answerC33 model
                   |> scale 0.25
                   |> move (-90,22.5)
                 ]

answerC33 model = GraphicSVG.html 350 250 ( 
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContentC3 model.tabState])

renderTabContentC3 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/80813838/113772983-67586e00-96f3-11eb-8664-7cc339bf0a4d.PNG"
                                   , class "d-inline-block align-top"
                                   , style  "width" "350px" 
                                   ] [] ] 

        Step2 ->
            Html.div [] [Html.img [ src "https://user-images.githubusercontent.com/80813838/113773033-750df380-96f3-11eb-970e-9bba277a6672.PNG"
                                  , class "d-inline-block align-top"
                                  , style  "width" "300px" 
                                  ] [] ] 

        Step3 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/80813838/113773007-6e7f7c00-96f3-11eb-9432-f294219e4221.PNG"
                                 , class "d-inline-block align-top"
                                 , style  "width" "350px" 
                                  ] [] ] 
        
        otherwise -> Html.div [] []

-- ANSWER CC4
answerCC4 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)
                  
                , answerC44 model
                  |> scale 0.25
                  |> move (-90,22.5)
                 ]

answerC44 model = GraphicSVG.html 350 250 ( 
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContentC4 model.tabState])

renderTabContentC4 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/80813838/113965465-69a5ef80-97fb-11eb-96f9-f06c6797ae58.PNG"
                                   , class "d-inline-block align-top"
                                   , style  "width" "200px" 
                                   ] [] ] 

        Step2 ->
            Html.div [] [Html.img [ src "https://user-images.githubusercontent.com/80813838/113965475-6e6aa380-97fb-11eb-81d7-77e68cc11cae.PNG"
                                  , class "d-inline-block align-top"
                                  , style  "width" "350px" 
                                  ] [] ] 

        Step3 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/80813838/113965494-7a566580-97fb-11eb-9e19-d496b19bc85b.PNG"
                                 , class "d-inline-block align-top"
                                 , style  "width" "350px" 
                                  ] [] ] 
        
        otherwise -> Html.div [] []

-- ANSWER CC5
answerCC5 model = group
                 [
                  rect 90 65
                  |> filled white
                  |> addOutline (solid 1) (rgb 14 235 213)
                  |> move (-47,-7.5)
                  
                  ,answerC55 model
                   |> scale 0.25
                   |> move (-90,22.5)
                 ]

answerC55 model = GraphicSVG.html 350 250 ( 
                                        Html.div []
                                        [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                        , renderHeaders model.tabState
                                        , renderTabContentC5 model.tabState])

renderTabContentC5 currentTab =
    case currentTab of
        Step1 ->
            Html.div []  [Html.img [ src "https://user-images.githubusercontent.com/80813838/114074521-73b70500-9872-11eb-99c2-14ff2beb3983.PNG"
                                   , class "d-inline-block align-top"
                                   , style  "width" "200px" 
                                   ] [] ] 

        Step2 ->
            Html.div [] [Html.img [ src "https://user-images.githubusercontent.com/80813838/114074543-7ca7d680-9872-11eb-9e0d-dfd4ac2170b9.PNG"
                                  , class "d-inline-block align-top"
                                  , style  "width" "350px" 
                                  ] [] ] 

        Step3 ->
            Html.div [] [Html.img [src "https://user-images.githubusercontent.com/80813838/114074562-80d3f400-9872-11eb-9b1d-4643c9f2bc04.PNG"
                                 , class "d-inline-block align-top"
                                 , style  "width" "350px" 
                                  ] [] ] 
        
        otherwise -> Html.div [] []

-- Hints
{-----------------------------------------------------------------------------------
------------------------------------------------------------------------------------}
-- Simple derivatives hints

hintS1_1 model = group 
         [ 
          text "Recall the Constant rule!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          insertPic model "https://user-images.githubusercontent.com/80813838/111433751-11387200-86d5-11eb-86aa-c9ff625b6a65.PNG"   
          |> scale 0.4
          |> move (-20,-5)
         ]
         
hintS1_2 model = group 
         [ 
          text "Recall the Coefficient rule!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          insertPic model "https://user-images.githubusercontent.com/80813838/111435335-0a126380-86d7-11eb-8513-6e02414b734e.PNG"
          |> scale 0.4
          |> move (-23,-2)
         ]

hintSD1 model = case model.hintState of
                Open1 -> openedHint model (hintS1_1 model) |> notifyTap CloseHint
                Open2 -> openedHint model (hintS1_2 model) |> notifyTap CloseHint
                otherwise -> group [closedHint |> notifyTap OpenHint1
                                    , closedHint |> move (0,-30)|> notifyTap OpenHint2]


hintS2_1 model = group  --Added Here
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107373-f1662980-98e1-11eb-83cf-396109deb98e.PNG"   
          |> scale 0.4
          |> move (-20,0)
         ]
         
hintS2_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107373-f1662980-98e1-11eb-83cf-396109deb98e.PNG"
          |> scale 0.4
          |> move (-20,0)
         ]

hintSD2 model = case model.hintState of
                Open1 -> openedHint model (hintS2_1 model) |> notifyTap CloseHint
                Open2 -> openedHint model (hintS2_2 model) |> notifyTap CloseHint
                otherwise -> group [closedHint |> notifyTap OpenHint1
                                    , closedHint |> move (0,-30)|> notifyTap OpenHint2]

hintS3_1 model = group  --Added Here
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107412-05aa2680-98e2-11eb-96ee-e081deffcf25.PNG"   
          |> scale 0.4
          |> move (-20,0)
         ]
         
hintS3_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107412-05aa2680-98e2-11eb-96ee-e081deffcf25.PNG"
          |> scale 0.4
          |> move (-20,0)
         ]

hintSD3 model = case model.hintState of
                Open1 -> openedHint model (hintS3_1 model) |> notifyTap CloseHint
                Open2 -> openedHint model (hintS3_2 model) |> notifyTap CloseHint
                otherwise -> group [closedHint |> notifyTap OpenHint1
                                    , closedHint |> move (0,-30)|> notifyTap OpenHint2]

hintS4_1 model = group  --Added Here --Added Here
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107448-18bcf680-98e2-11eb-80e3-6e88f55de7a4.PNG"   
          |> scale 0.4
          |> move (-20,0)
         ]
         
hintS4_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107448-18bcf680-98e2-11eb-80e3-6e88f55de7a4.PNG"
          |> scale 0.4
          |> move (-20,0)
         ]

hintSD4 model = case model.hintState of
                Open1 -> openedHint model (hintS4_1 model) |> notifyTap CloseHint
                Open2 -> openedHint model (hintS4_2 model) |> notifyTap CloseHint
                otherwise -> group [closedHint |> notifyTap OpenHint1
                                    , closedHint |> move (0,-30)|> notifyTap OpenHint2]

hintS5_1 model = group  --Added Here
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107512-34c09800-98e2-11eb-8e9c-a6f2b4e07854.PNG"   
          |> scale 0.4
          |> move (-20,0)
         ]
         
hintS5_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107512-34c09800-98e2-11eb-8e9c-a6f2b4e07854.PNG"
          |> scale 0.4
          |> move (-20,0)
         ]

hintSD5 model = case model.hintState of
                Open1 -> openedHint model (hintS5_1 model) |> notifyTap CloseHint
                Open2 -> openedHint model (hintS5_2 model) |> notifyTap CloseHint
                otherwise -> group [closedHint |> notifyTap OpenHint1
                                    , closedHint |> move (0,-30)|> notifyTap OpenHint2]

hintS6_1 model = group  --Added Here
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107583-5752b100-98e2-11eb-83e7-c816285ab6d4.PNG"   
          |> scale 0.4
          |> move (-20,0)
         ]
         
hintS6_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107583-5752b100-98e2-11eb-83e7-c816285ab6d4.PNG"
          |> scale 0.4
          |> move (-20,0)
         ]

hintSD6 model = case model.hintState of
                Open1 -> openedHint model (hintS6_1 model) |> notifyTap CloseHint
                Open2 -> openedHint model (hintS6_2 model) |> notifyTap CloseHint
                otherwise -> group [closedHint |> notifyTap OpenHint1
                                    , closedHint |> move (0,-30)|> notifyTap OpenHint2]

hintS7_1 model = group  --Added Here
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107617-66d1fa00-98e2-11eb-9cbb-773a82c64512.PNG"   
          |> scale 0.4
          |> move (-20,0)
         ]
         
hintS7_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107617-66d1fa00-98e2-11eb-9cbb-773a82c64512.PNG"
          |> scale 0.4
          |> move (-20,0)
         ]

hintSD7 model = case model.hintState of
                Open1 -> openedHint model (hintS7_1 model) |> notifyTap CloseHint
                Open2 -> openedHint model (hintS7_2 model) |> notifyTap CloseHint
                otherwise -> group [closedHint |> notifyTap OpenHint1
                                    , closedHint |> move (0,-30)|> notifyTap OpenHint2]

hintS8_1 model = group  --Added Here
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107649-781b0680-98e2-11eb-9c01-b4067667f488.PNG"   
          |> scale 0.4
          |> move (-20,0)
         ]
         
hintS8_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107649-781b0680-98e2-11eb-9c01-b4067667f488.PNG"
          |> scale 0.4
          |> move (-20,0)
         ]

hintSD8 model = case model.hintState of
                Open1 -> openedHint model (hintS8_1 model) |> notifyTap CloseHint
                Open2 -> openedHint model (hintS8_2 model) |> notifyTap CloseHint
                otherwise -> group [closedHint |> notifyTap OpenHint1
                                    , closedHint |> move (0,-30)|> notifyTap OpenHint2]

hintS9_1 model = group  --Added Here
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107699-8ec15d80-98e2-11eb-87e8-09506faca72d.PNG"   
          |> scale 0.4
          |> move (-20,0)
         ]
         
hintS9_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107699-8ec15d80-98e2-11eb-87e8-09506faca72d.PNG"
          |> scale 0.4
          |> move (-20,0)
         ]

hintSD9 model = case model.hintState of
                Open1 -> openedHint model (hintS9_1 model) |> notifyTap CloseHint
                Open2 -> openedHint model (hintS9_2 model) |> notifyTap CloseHint
                otherwise -> group [closedHint |> notifyTap OpenHint1
                                    , closedHint |> move (0,-30)|> notifyTap OpenHint2]

hintS10_1 model = group  --Added Here
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107740-a0a30080-98e2-11eb-9696-d40b09138f22.PNG"   
          |> scale 0.4
          |> move (-20,0)
         ]
         
hintS10_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/39256132/114107740-a0a30080-98e2-11eb-9696-d40b09138f22.PNG"
          |> scale 0.4
          |> move (-20,0)
         ]

hintSD10 model = case model.hintState of
                Open1 -> openedHint model (hintS10_1 model) |> notifyTap CloseHint
                Open2 -> openedHint model (hintS10_2 model) |> notifyTap CloseHint
                otherwise -> group [closedHint |> notifyTap OpenHint1
                                    , closedHint |> move (0,-30)|> notifyTap OpenHint2]
                                    
-- Applied derivatives hints
hintA1_1 model = group 
         [ 
          text "y = mx + c"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          text "Recall: The equation of a straight line ^^"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (38.5,-10),
              
          text "To find the slope of the tangent, recall:"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (36,-19),
              
          text "slope of curve at (0,4) = slope of tangent"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (39.5,-28)
         ]
         
hintA1_2 model = group 
         [ 
          text "To find the slope of the curve,"
              |> customFont "Calibri"
              |> bold
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (22,0),
              
          text "Find the derivative at (0,4)!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (15,-10)
         ]

hintA1_3 model = group 
         [ 
          text "y = mx + c"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          text "Plug in values for x, y and m to find c"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (33.5,-10),
              
          text "Then, you're ready to write the "
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (24,-19),
          
          text "equation!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (-18.5,-28)
         ]

hintAA1 model = case model.hintState of
                Open1 -> openedHint model (hintA1_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintA1_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintA1_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]

hintA2_1 model = group
         [
          text "y = mx + c"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,

          text "Recall: The equation of a straight line ^^"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (38.5,-10),

          text "To find the slope of the tangent, recall:"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (36,-19),

          text "slope of curve at (2,4) = slope of tangent"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (39.5,-28)

         ]

hintA2_2 model = group
         [
          text "To find the slope of the curve,"
              |> customFont "Calibri"
              |> bold
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (22,0),

          text "Find the derivative at (2,4)!"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10)
         ]

hintA2_3 model = group
         [
          text "y = mx + c"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,

          text "Plug in values for x, y and m to find c"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10),

          text "Then, you're ready to answer"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-19),

          text "equation!"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-28)]

hintA3_1 model = group
         [
          text "Find the points on the graph"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,0),

          text "where f(x) intersects y"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10)
         ]

hintA3_2 model = group
         [
          text "Find the derivative at the points "
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4,

          text "you found"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10)
         ]

hintA3_3 model = group
         [
          text "enter the values you found"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,0),


          text "in the answer box seperated by commas"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10),

          text "Then, you're ready to write the "
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-19),

          text "Ex. 1,1"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-28)]

hintA4_1 model = group
         [
          text "Find the derivative of f(x)"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4
         ]

hintA4_2 model = group
         [
          text "Find the slope of the tangent line"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4,

          text "by solving f'(x) with the x value given"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10)
         ]

hintA4_3 model = group
         [
          text "find the corisponding y value"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4,

          text "to the x value givin use"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10),

          text "y = mx + b to solve equation"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-19)
      ]

hintA5_1 model = group
         [
          text "the derivative of a function at a point "
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4,

          text "gives the slope of the tangent line"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10)
         ]

hintA5_2 model = group
         [
          text "Find the a point of f(x) to help find "
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4,

          text "the tangent line"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10)
         ]

hintA5_3 model = group
         [
          text "use y - y1 = m(x + x1) to solve for"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4,

          text "the tangent line"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10)
         ]

hintA6_1 model = group
         [
          text "find the derivitive of f(x)"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
         ]

hintA6_2 model = group
         [
          text "find the slope of the tangent line"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4,

          text "using the point(1,5)"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10)
         ]

hintA6_3 model = group
         [
          text " use y - y1 = m(x - x1) with"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4,

          text "P(1,5) and the slope you found"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10),

          text "to determine of the tangent line"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-19)
          ]

--hint 7 plus model
hintA7_1 model = group 
         [ 
          text "Use the chain rule!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          text "The derivative of f(g(x)) is equal to"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (30.5,-10),
              
          text "f’(g(x)) * g’(x)"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (15,-19)
         ]
         
hintA7_2 model = group 
         [ 
          text "Make sure you're using the chain rule correctly!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.3
              |> move (1,0),
              
          text "In terms of f’(g(x)) * g’(x), f(x) = x⁻²"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (30,-10),
              
          text "while g(x) would be equal to 4x² - 3x +2"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (38.5,-19)
         ]

hintA7_3 model = group 
         [ 
          text "Consider the roots of each equation!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          text "Each graph has roots in unique spots!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (33.5,-10),
              
          text "These unique roots can be used to help"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (37.5,-19),
              
          text "make sure you have the right equation!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (37.5,-28)
         ]

hintAA7 model = case model.hintState of
                Open1 -> openedHint model (hintA7_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintA7_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintA7_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]

hintA8_1 model = group 
         [ 
          text "The derivative of sinx is cosx"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          text "One answer can be easily eliminated!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (36.5,-10)
         ]
         
hintA8_2 model = group 
         [ 
          text "Your equation doesn't need to be exact!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4
              |> move (1,0),
              
          text "Finding a simple rough equation of the"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (36.5,-10),
              
          text "graph can help a lot!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (1,-19)
         ]

hintA8_3 model = group 
         [ 
          text "Consider the roots of each equation!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          text "Each graph has roots in unique spots!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (33.5,-10),
              
          text "These unique roots can be used to help"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (37.5,-19),
              
          text "make sure you have the right equation!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (37.5,-28)
         ]

hintAA8 model = case model.hintState of
                Open1 -> openedHint model (hintA8_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintA8_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintA8_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]

--hint 9 plus model                                    
hintA9_1 model = group 
         [ 
          text "ax² + bx + c"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          text "This is the form of the graph!^^"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (30.5,-10)
         ]
         
hintA9_2 model = group 
         [ 
          text "The graph goes through (0,0)"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4
              |> move (1,0),
              
          text "This must mean that c is 0!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (13.5,-10)
         ]

hintA9_3 model = group 
         [ 
          text "Some graphs pass through similar points!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.367,
              
          text "Try comparing points between 2 graphs"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (38,-10),
              
          text "x² + x seems like a good starting point!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (36,-19)
         ]

hintAA9 model = case model.hintState of
                Open1 -> openedHint model (hintA9_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintA9_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintA9_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]

--hint 10 plus model
hintA10_1 model = group 
         [ 
          text "Use the chain rule!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          text "The derivative of f(g(x)) is equal to"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (30.5,-10),
              
          text "f’(g(x)) * g’(x)"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (15,-19)  
         ]
         
hintA10_2 model = group 
         [ 
          text "Make sure you're using the chain rule correctly!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.3
              |> move (1,0),
              
          text "In terms of f’(g(x)) * g’(x), f(x) = x⁴"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (30,-10),
              
          text "while g(x) would be equal to 6x² + 7x"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (35.5,-19)
         ]

hintA10_3 model = group 
         [ 
          text "Consider the roots of each equation!"
              |> customFont "Calibri"
              |> bold
              |> centered
              |> filled black
              |> scale 0.4,
              
          text "Each graph has roots in unique spots!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (33.5,-10),
              
          text "These unique roots can be used to help"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (37.5,-19),
              
          text "make sure you have the right equation!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (37.5,-28)
         ]

hintAA10 model = case model.hintState of
                Open1 -> openedHint model (hintA10_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintA10_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintA10_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]
-- hint AA2 ******************************************************************************************
hintAA2 model = case model.hintState of
                Open1 -> openedHint model (hintA2_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintA2_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintA2_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]
-- hint AA3 ******************************************************************************************
hintAA3 model = case model.hintState of
                Open1 -> openedHint model (hintA3_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintA3_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintA3_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]
-- hint AA4 ******************************************************************************************
hintAA4 model = case model.hintState of
                Open1 -> openedHint model (hintA4_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintA4_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintA4_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]
-- hint AA5 ******************************************************************************************
hintAA5 model = case model.hintState of
                Open1 -> openedHint model (hintA5_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintA5_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintA5_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]
-- hint AA6 ******************************************************************************************
hintAA6 model = case model.hintState of
                Open1 -> openedHint model (hintA6_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintA6_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintA6_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]

-- Challenge hints      
-- CC Question 5
hintC5_1 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/114074521-73b70500-9872-11eb-99c2-14ff2beb3983.PNG"
          |> scale 0.55
          |> move (-39,9)     
         ]

hintC5_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/114074575-8598a800-9872-11eb-8f3e-d89f986bfd7f.PNG"
          |> scale 0.75
          |> move (-39,9)     
         ]
         
hintC5_3 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/114074589-8a5d5c00-9872-11eb-9c41-fffe4b905e10.PNG"
          |> scale 0.5
          |> move (-39,9) 
         ]

hintCC5 model = case model.hintState of
                Open1 -> openedHint model (hintC5_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintC5_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintC5_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]

-- CC Question 4
hintC4_1 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/113965426-55fa8900-97fb-11eb-9b78-4fa20ac5c156.PNG"
          |> scale 0.45
          |> move (-39,9)     
         ]

hintC4_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/113965441-5bf06a00-97fb-11eb-920d-63d195dd2959.PNG"
          |> scale 0.75
          |> move (-39,9)     
         ]
         
hintC4_3 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/113965459-6579d200-97fb-11eb-90f1-b5055a179340.PNG"
          |> scale 0.75
          |> move (-39,9) 
         ]

hintCC4 model = case model.hintState of
                Open1 -> openedHint model (hintC4_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintC4_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintC4_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]


-- CC Question 3
hintC3_1 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/113773089-8820c380-96f3-11eb-90ed-8ffa6bd151ee.PNG"
          |> scale 0.75
          |> move (-39,9)     
         ]

hintC3_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/113773072-822ae280-96f3-11eb-9416-8788332cb6f5.PNG"
          |> scale 0.75
          |> move (-39,9)     
         ]
         
hintC3_3 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/113773046-7b03d480-96f3-11eb-8fa1-7eaf17bdb1e2.PNG"
          |> scale 0.75
          |> move (-39,9) 
         ]

hintCC3 model = case model.hintState of
                Open1 -> openedHint model (hintC3_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintC3_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintC3_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]

--CC -- question 2
hintC2_1 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/112696743-c1884200-8e5c-11eb-93c7-a453743978b2.PNG"
          |> scale 0.75
          |> move (-39,9)     
         ]

hintC2_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/112696754-c77e2300-8e5c-11eb-808f-d0ba24e2553d.PNG"
          |> scale 0.75
          |> move (-39,9)     
         ]
         
hintC2_3 model = group 
         [ 
          text "Find x using the Pythagorean theorem"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,0)  ,
              
          text "and then use the derivatives equation"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-10),
              
          text "and to find rate of change of dy/dx!"
              |> customFont "Calibri"
              |> centered
              |> filled black
              |> scale 0.4
              |> move (0,-20)
         ]

hintCC2 model = case model.hintState of
                Open1 -> openedHint model (hintC2_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintC2_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintC2_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]
         
-- question 1
hintC1_1 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/111685194-00375000-87fe-11eb-8777-2db7f8c8ef05.PNG"
          |> scale 0.75
          |> move (-39,9)     
         ]
         
hintC1_2 model = group 
         [ 
          insertPic model "https://user-images.githubusercontent.com/80813838/111685741-a84d1900-87fe-11eb-91d6-c53ccb1d7acd.PNG"
          |> scale 0.75
          |> move (-39,9),
              
          text "Combine these two equations!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (21,-30)
         ]

hintC1_3 model = group 
         [    
          text "At the minimum point, the derivative"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (34,0),
          
          text "of an equation is 0!"
              |> customFont "Calibri"
              |> alignRight
              |> filled black
              |> scale 0.4
              |> move (0,-10)
         ]

hintCC1 model = case model.hintState of
                Open1 -> openedHint model (hintC1_1 model) |> move (-48,0)|> notifyTap CloseHint
                Open2 -> openedHint model (hintC1_2 model) |> move (-48,0)|> notifyTap CloseHint
                Open3 -> openedHint model (hintC1_3 model) |> move (-48,0)|> notifyTap CloseHint
                otherwise -> group [closedHint |> scale 0.5 |> move (-50,10) |> notifyTap OpenHint1
                                    , closedHint |> scale 0.5 |> move (-50,-10)|> notifyTap OpenHint2
                                    , closedHint |> scale 0.5 |> move (-50,-30)|> notifyTap OpenHint3]

{-
----------------------------------------------------------------------------------
-- general layout stuff
-}
userBox model = GraphicSVG.html 200 50 ( Html.div [] [ Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
                                       , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
                                       , Input.text [ Input.attrs [placeholder "Type answer", value model.itext, Events.onInput SetText ]]])
                
answerBox colour model = group 
                         [
                          userBox model
                          |> scale 0.25
                          |> move (-90,-46.5),

                          roundedRect 50 11 5
                          |> animationPieces [(0.1,(\x -> outlined (solid 1) colour)),
                                              (0.1,(\x -> outlined (solid 1) white)),
                                              (0.1,(\x -> outlined (solid 1) colour)),
                                              (0.1,(\x -> outlined (solid 1) white)),
                                              (0.1,(\x -> outlined (solid 1) colour)),
                                              (0.1,(\x -> outlined (solid 1) white)),
                                              (0.1,(\x -> outlined (solid 1) colour)),
                                              (0.1,(\x -> outlined (solid 1) white))]
                                             (\x -> outlined (solid 1) colour)
                                             (model.time-model.deltaTime)
                          |> move (-65,-52.5)
                         ]
                         
insertPic model pic = GraphicSVG.html 100 100 (Html.div [] [Html.img [ src pic
                                                                      , class "d-inline-block align-top"
                                                                      , style  "width" "100px" 
                                                                      ] [] ])

divider = line (0,200) (0,-200)
          |> outlined (solid 1) black
          
exit model = group [
                   roundedRect 10 10 5
                   |> filled red
                   |> addOutline (solid 1) black
                    ,
                   text "X"
                   |> customFont "Courier New"
                   |> centered
                   |> bold
                   |> filled white
                   |> scale 0.75
                   |> move (0,-2.5)
                   ] 
                   |> scale model.scalerExit
                   |> notifyTap ToHome 
                   |> notifyEnter HoverExit
                   |> notifyLeave LeaveExit
                   
-- Hints Layout                   
closedHint = group 
       [
        rect 80 20
        |> filled (rgb 14 235 213)
        |> move (0,-5),

        text "Open Hint"
        |> customFont "Calibri"
        |> bold
        |> centered
        |> filled white
        |> move (0,-8.5)
        |> scale 1
       ] |> move (0,10)

openedHint model addHint = group 
                   [
                    rect 80 50
                    |> filled white
                    |> addOutline (solid 1) (rgb 14 235 213)
                    |> move (0,-10),

                    text "Click to close hint"
                    |> customFont "Calibri"
                    |> bold
                    |> underline
                    |> centered
                    |> filled black
                    |> scale 0.4
                    |> move (-20,10)

                    , addHint
                   ]                
         
submit = group 
         [
          rect 30 10
          |> filled green
          |> move (65,-35),
          
          text "Submit"
          |> customFont "Calibri"
          |> bold
          |> centered
          |> filled white
          |> scale 0.5
          |> move (65,-36)
         ] |> notifyTap Submit
         
skip = group 
       [
        rect 30 10
        |> filled yellow
        |> move (65,-50),

        text "Skip"
        |> customFont "Calibri"
        |> bold
        |> centered
        |> filled white
        |> scale 0.5
        |> move (65,-51)
      ] |> notifyTap Skip

next = group 
       [
        rect 30 25
        |> filled pink
        |> move (65,-50),

        text "Next >>>"
        |> customFont "Calibri"
        |> bold
        |> centered
        |> filled white
        |> scale 0.5
        |> move (65,-51)
       ] |> move (-8,0)

-- Answer Status bar
statusAlert model x c = group
                    [ 
                      text x
                       |> customFont "Calibri"
                       |> alignRight
                       |> bold
                       |> filled c
                       |> scale 0.8
                       |> move (75,50)
                    ]

equationS t = text t
             |> customFont "Sans Serif"
             |> italic
             |> centered
             |> filled black

-- Question Layouts
quizLayoutSimple colour model = group 
                   [
                    text "Find the derivative of:"
                    |> customFont "Calibri"
                    |> centered
                    |> filled black
                    |> move (-35,50)
                    
                   ,exit model
                    |> move (85,53.5)
                    
                   ,rect 80 20
                    |> outlined (solid 1) (rgb 14 235 213)
                    |> move (0,30)
                    
                   ,submit |> scale 0.9 |> move (0,-14.5)
                   ,skip |> scale 0.9 |> move (0,-12.5)
                   
                   ,answerBox colour model
                    |> scale 1.6
                    |> move (104,30)
                   ]

quizLayoutApplied colour model = group 
                    [
                     divider,
             
                     exit model
                     |> move (85,53.5),
                     
                     rect 50 10
                     |> outlined (solid 1) (rgb 14 235 213)
                     |> move (-50,35), 
             
                     eq1
                     |> scale 0.5
                     |> move (-50,33),
                     
                     q1
                     |> scale 0.4
                     |> move (-92,50),
                     
                     text "Question 1:"
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)
                     
                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)
                      
                     ,answerBox colour model
                     
                    ]

-- APPLIED Question 2
quizLayoutApplied2 colour model = group
                    [
                     divider,

                     exit model
                     |> move (85,53.5),

                     rect 50 10
                     |> outlined (solid 1) (rgb 14 235 213)
                     |> move (-50,35),

                     eq2
                     |> scale 0.5
                     |> move (-50,33),

                     q2
                     |> scale 0.4
                     |> move (-92,50),

                     text "Question 2:"
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)

                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)

                     ,answerBox colour model

                    ]
-- APPLIED Question 3
quizLayoutApplied3 colour model = group
                    [
                     divider,

                     exit model
                     |> move (85,53.5),

                     rect 50 10
                     |> outlined (solid 1) (rgb 14 235 213)
                     |> move (-50,35),

                     eq3
                     |> scale 0.5
                     |> move (-50,33),

                     q3
                     |> scale 0.4
                     |> move (-92,50),

                     text "Question 3:"
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)

                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)

                     ,answerBox colour model

                    ]

-- APPLIED Question 4
quizLayoutApplied4 colour model = group
                    [
                     divider,

                     exit model
                     |> move (85,53.5),

                     rect 50 10
                     |> outlined (solid 1) (rgb 14 235 213)
                     |> move (-50,35),

                     eq4
                     |> scale 0.5
                     |> move (-50,33),

                     q4
                     |> scale 0.4
                     |> move (-92,50),

                     text "Question 4:"
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)

                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)

                     ,answerBox colour model
                    ]

-- APPLIED Question 5
quizLayoutApplied5 colour model = group
                    [
                     divider,

                     exit model
                     |> move (85,53.5),

                     rect 50 10
                     |> outlined (solid 1) (rgb 14 235 213)
                     |> move (-50,35),

                     eq5
                     |> scale 0.5
                     |> move (-50,33),

                     q5
                     |> scale 0.4
                     |> move (-92,50),

                     text "Question 5:"
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)

                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)

                     ,answerBox colour model
                    ]

-- APPLIED Question 6
quizLayoutApplied6 colour model = group
                    [
                     divider,

                     exit model
                     |> move (85,53.5),

                     rect 50 10
                     |> outlined (solid 1) (rgb 14 235 213)
                     |> move (-50,35),

                     eq6
                     |> scale 0.5
                     |> move (-50,33),

                     q6
                     |> scale 0.4
                     |> move (-92,50),

                     text "Question 6:"
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)

                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)

                     ,answerBox colour model
                    ]

quizLayoutChallenge colour model num question = group 
                    [
                     divider,
             
                     exit model
                     |> move (85,53.5), 
                     
                     question
                     |> scale 0.4
                     |> move (-92,50),
                     
                     text ("Question " ++ num ++ ":")
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)
                     
                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)
                      
                     ,answerBox colour model
                    ]

-- Challenge questions

{-
An open-topped glass aquarium with a square base is designed to hold 
13.5 cubic feet of water. What is the minimum exterior surface area of 
the aquarium? Answer: 27 square feet 
-}

qc = group 
     [
      text "An open-topped glass aquarium with a square"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,
       
       text "base is designed to hold 13.5 cubic feet of "
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13),
       
       text "water. What is the minimum exterior surface "
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-26),
       
       text "area of the aquarium (in cubic feet)?"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-39)
     ]

{-
Q. A 25-meter ladder is sliding down a vertical wall so the distance 
between the bottom of the ladder and the wall is increasing at 3.5 meters 
per minute.
At a certain instant, the top of the ladder is 7 meters from the ground.
What is the rate of change of the distance between the top of the ladder 
and the ground at that instant (in meters per minute)?

-}

qc2 = group 
     [
      text "A 25 meter ladder is sliding down a vertical"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,
       
       text "wall so the distance between the bottom of "
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13),
       
       text "the ladder and the wall is increasing at 3.5 m"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-26),
       
       text "per minute. At a certain instant, the top of the"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-39),
       
       text "ladder is 7m from the ground. What is the rate"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-52),
       
       text "of change of the distance between the top of "
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-65),
       
       text "the ladder and the ground at that instant?"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-78)
     ]

qc3 = group
     [
       text "On a stormy night, the stop sign at an inter-"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,
       
       text "section fell. A car is 25m from the crosswalk"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13),

       text "when he sees a person crossing. What is the"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-26),
       
       text "maximum time he needs to come to a full stop"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-39),

       text "if his car is moving in the formula: "
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-52)
            ]

qc4 = group
     [
      text "If a ball is given a push so that it has an initial "
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,
      
       text "velocity of 6 m/s down a certain inclined plane,"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13),
    
       text "then the distance it has after t seconds is: "
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-26),
      
       text "What is the velocity of the ball when it reaches"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-60),
      
       text "the basket if horizontal distance and vertical "
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-73),
       
       text "distances are both 325 m?"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-86)
     ]

qc5 = group
       [
        text "There are 50 apple trees in an orchard. Each"
         |> customFont "Calibri"
         |> alignLeft
         |> filled black,

         text "tree produces 800 apples. For each additional"
         |> customFont "Calibri"
         |> alignLeft
         |> filled black
         |> move (0,-13),

         text "tree planted in the orchard, the output per tree"
         |> customFont "Calibri"
         |> alignLeft
         |> filled black
         |> move (0,-26),

         text "drops by 10 apples. How many trees should be"
         |> customFont "Calibri"
         |> alignLeft
         |> filled black
         |> move (0,-39),

         text "added to the existing orchard in order to "
         |> customFont "Calibri"
         |> alignLeft
         |> filled black
         |> move (0,-52),
         
          text "maximize the total output of the trees?"
         |> customFont "Calibri"
         |> alignLeft
         |> filled black
         |> move (0,-65)
       ]


-- APPLIED QUESTIONS

q1 = group 
     [
      text "A straight line intersects with the curve f(x) at"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,
       
       text "(0,4). Find the equation of the straight line."
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13)
     ]


eq1 = group
     [
       text "f(x) = 6x − 9x + 4"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black,
       
       text "3"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black
       |> scale 0.6
       |> move (0,6),
       
       text "2"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black
       |> scale 0.6
       |> move (26,6)
      ]

-- Question 2
q2 = group
     [
      text "Find the slope of the tangent line at (2,4) of the"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,

       text "function f(x)."
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13)
     ]



eq2 = group
     [
       text "f(x) = x"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black,


       text "2"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black
       |> scale 0.6
       |> move (20,6)
      ]

-- Question 3
q3 = group
     [
      text "Find 2 slopes of the tangent line of f(x) when"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,

       text "y = 10. Separate the answers with commas"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13)
     ]



eq3 = group
     [
       text "f(x) = x + 6"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black,


       text "2"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black
       |> scale 0.6
       |> move (9,6)
      ]


-- Question 4
q4 = group
     [
      text "Find the tangent line to f(x) at x=1."
       |> customFont "Calibri"
       |> alignLeft
       |> filled black

     ]



eq4 = group
     [
       text "f(x) = 7x + 8x + 2x"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black,

       text "4"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black
       |> scale 0.6
       |> move (-1,6),

       text "-6"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black
       |> scale 0.6
       |> move (24,6)
      ]
-- Question 5
q5 = group
     [
      text "Find the equation of the tangent line of f(x)"
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,

       text "at x = -4."
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13)
     ]



eq5 = group
     [
       text "f(-4)=7 and f'(-4)=1"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black


      ]
-- Question 6
q6 = group
     [
      text "Find the equation of the tangent line at point "
       |> customFont "Calibri"
       |> alignLeft
       |> filled black,

       text "(1,5) of the function f(x)."
       |> customFont "Calibri"
       |> alignLeft
       |> filled black
       |> move (0,-13)
     ]



eq6 = group
     [
       text "f(x) = (4x)  + 3"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black,

       text "1/2"
       |> customFont "Sans Serif"
       |> centered
       |> italic
       |> filled black
       |> scale 0.6
       |> move (17,6)


      ]

quizLayoutApplied10 colour model = group 
                    [
                     divider,
             
                     exit model
                     |> move (85,53.5),
                     
                     rect 50 10
                     |> outlined (solid 1) (rgb 14 235 213)
                     |> move (-50,35), 
             
                     eq10
                     |> scale 0.5
                     |> move (-50,33),
                     
                     q10
                     |> scale 0.4
                     |> move (-92,50),
                     
                     text "Question 10:"
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)
                     
                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)
                      
                     ,answerBox colour model
                     
                    ]

-- Homepage
homeBackground model = group 
                 [
                  rect 300 300 
                  |> filled (rgb 255 196 0),
                  
                  triangle 100
                  |> filled orange
                  |> makeTransparent 0.5
                  |> move (repeatDuration 5 50 -50 model.time, 10),
                  
                  circle 100 
                  |> filled orange
                  |> makeTransparent 0.5
                  |> move (20,repeatDuration -5 60 100 model.time),
                  
                  triangle 100
                  |> filled orange
                  |> makeTransparent 0.5
                  |> move (repeatDuration -5 60 100 model.time, repeatDuration 5 60 -100 model.time)
                 ]
quizzesButton = group 
                [
                 rect 55 25 
                 |> filled (rgb 209 33 33)
                 |> addOutline (solid 2) darkRed
                 |> move (0, 2.5)
                
                ,text "Quizzes"
                 |> customFont "Calibri"
                 |> centered
                 |> filled white
                ]

supportButton = group 
                [
                 rect 55 25 
                 |> filled (rgb 209 33 33)
                 |> addOutline (solid 2) darkRed
                 |> move (0, 2.5)
                
                ,text "Help"
                 |> customFont "Calibri"
                 |> centered
                 |> filled white
                ]

-- Topics Page
topicsBackground model = group 
                   [
                    triangle 100
                  |> filled (rgb 255 196 0)
                  |> makeTransparent 0.5
                  |> move (repeatDuration 5 50 -50 model.time, 10),
                  
                  circle 100 
                  |> filled (rgb 255 196 0)
                  |> makeTransparent 0.5
                  |> move (20,repeatDuration -5 60 100 model.time),
                  
                  triangle 100
                  |> filled (rgb 255 196 0)
                  |> makeTransparent 0.5
                  |> move (repeatDuration -5 60 100 model.time, repeatDuration 5 60 -100 model.time)
                   ]

simpleButton  = group 
                [
                 rect 55 25 
                 |> filled (rgb 209 33 33)
                 |> addOutline (solid 2) darkRed
                 |> move (0, 2.5)
                
                ,text "Simple"
                 |> customFont "Calibri"
                 |> centered
                 |> filled white
                 |> scale 0.6
                 |> move (0,5)
                 
                ,text "Derivatives"
                 |> customFont "Calibri"
                 |> centered
                 |> filled white
                 |> scale 0.6
                 |> move (0,-2)
                ] 

appliedButton  = group 
                [
                 rect 55 25 
                 |> filled (rgb 209 33 33)
                 |> addOutline (solid 2) darkRed
                 |> move (0, 2.5)
                
                ,text "Applied"
                 |> customFont "Calibri"
                 |> centered
                 |> filled white
                 |> scale 0.6
                 |> move (0,5)
                 
                ,text "Questions"
                 |> customFont "Calibri"
                 |> centered
                 |> filled white
                 |> scale 0.6
                 |> move (0,-2)
                ] 
                
challengeButton  = group 
                  [
                   rect 55 25 
                   |> filled (rgb 209 33 33)
                   |> addOutline (solid 2) darkRed
                   |> move (0, 2.5)

                  ,text "Challenge"
                   |> customFont "Calibri"
                   |> centered
                   |> filled white
                   |> scale 0.6
                   |> move (0,5)

                  ,text "Yourself!"
                   |> customFont "Calibri"
                   |> centered
                   |> filled white
                   |> scale 0.6
                   |> move (0,-2)
                  ] 

-- Aquarium (normal)
aquarium model = (group
                (
                  [aquariumCube] ++
                  
                  aquariumAnimations model
                  ++
                 
                 [
                 rect 97 200
                 |> filled white
                 |> move (200,0),
                 rect 95 200
                 |> filled white
                 |> move (-148,0)
                 ,rect 200 160
                 |> outlined (solid 3) black
                 |> move (0,-5)
                 ,polygon [(150,-30), (100,-85), (100,-30)]
                 |> filled white
                 |> rotate (degrees 180)
                 |> scale 1.1
                 |> move (265,-120),
                 rect 300 200
                 |> filled white
                 |> move (0,-186)
                 
               ])) |>  scale 0.25 |> move (50,-10)

aquariumCube = group [
                  rect 200 160
                 |> outlined (solid 3) black
                 |> move (0,-5)
                 ,rect 200 160
                 |> outlined (solid 3) black
                 |> move (50,50)
                    ,line (0,0) (50,55)
                 |> outlined (solid 3) black
                 |> move (-100,75)
                 ,line (0,0) (50,55)
                 |> outlined (solid 3) black
                 |> move (100,75)
                  ,polygon [(-100,-85), (-50,-30), (150,-30), (100,-85), (-100,-85)]
                  |> filled brown
                  |> addOutline (solid 3) black
                ]
aquariumAnimations model = 
          case model.state of
            CC1 -> []
            PassC1 -> 
                 [ rect 200 150 |> filled (rgb 50 100 200)

                 , shark |> scale 0.4 |> move (repeatDistance -10 300 160 model.time, -40)
                 , shark |> scale 0.4 |> move (repeatDistance -20 300 130 model.time, 5)
                 , shark |> scale 0.1 |> move (repeatDistance -30 300 130 model.time, 50)
                 
                 , sand lightBrown |> move (0,10)
                 , sand darkBrown
                 , bubbles |> move (1*cos(3*model.time),3*sin(model.time))

                 , seaweed |> scale 0.5  |> move (-90,-30) |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.25 |> move (-50,-40) |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.5  |> move (-30,-30) |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.25 |> move (10,-40)  |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.5  |> move (30,-30)  |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.25 |> move (70,-40)  |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.5  |> move (90,-30)  |> move (5*cos(model.time),0)

                 , fish (rgb 230 125 50) darkOrange |> scale 0.3 |> move (repeatDistance 10 300 -100 model.time, 15)
                 , fish lightBlue darkBlue          |> scale 0.3 |> move (repeatDistance 20 300 -160 model.time, -20)
                 , fish lightPurple darkPurple      |> scale 0.3 |> move (repeatDistance 30 300 -160 model.time, -10)
                 , fish lightGreen darkGreen        |> scale 0.3 |> move (repeatDistance 15 300 -160 model.time, -35)
                 , fish pink hotPink                |> scale 0.3 |> move (repeatDistance 10 300 -160 model.time, 30)
                 , fish lightYellow darkYellow      |> scale 0.3 |> move (repeatDistance 30 300 -160 model.time, 50)

                 -- put ahead of the fishes, it'll look more natural
                 , seaweed |> scale 0.75 |> move (50,-30) |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.75 |> move (-70,-30) |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.75 |> move (-10,-30) |> move (5*cos(model.time),0)
                 ]
                 --UNDERFLOW
            Fail1C1 -> 
                        [ rect 200 150 |> filled (rgb 50 100 200) |> move (0,-80) |> move (0 , 7*sin(model.time))
  
                        , shark |> scale 0.4 |> move (20,-40)

                        , sand lightBrown |> move (0,10)
                        , sand darkBrown

                        , seaweed |> scale 0.5  |> move (-90,-30)
                        , seaweed |> scale 0.25 |> move (-50,-40)
                        , seaweed |> scale 0.5  |> move (-30,-30)
                        , seaweed |> scale 0.25 |> move (10,-40)
                        , seaweed |> scale 0.5  |> move (30,-30)
                        , seaweed |> scale 0.25 |> move (70,-40)
                        , seaweed |> scale 0.5  |> move (90,-30)

                        , fish (rgb 230 125 50) darkOrange |> scale 0.3 |> move (20,15)  |> rotate (degrees 180) |> move (-2*cos(model.time),0)
                        , fish lightBlue darkBlue          |> scale 0.3 |> move (50,15)  |> rotate (degrees 180) |> move (-2*cos(model.time),0)
                        , fish lightPurple darkPurple      |> scale 0.3 |> move (80,15)  |> rotate (degrees 180) |> move (-2*cos(model.time),0)
                        , fish lightGreen darkGreen        |> scale 0.3 |> move (-20,15) |> rotate (degrees 180) |> move (-2*cos(model.time),0)
                        , fish pink hotPink                |> scale 0.3 |> move (-50,15) |> rotate (degrees 180) |> move (-2*cos(model.time),0)
                        , fish lightYellow darkYellow      |> scale 0.3 |> move (-85,15) |> rotate (degrees 180) |> move (-2*cos(model.time),0)

                          -- put ahead of the fishes, it'll look more natural
                        , seaweed |> scale 0.75 |> move (50,-30)
                        , seaweed |> scale 0.75 |> move (-70,-30)
                        , seaweed |> scale 0.75 |> move (-10,-30)
                        
                        ,polygon [(0,-10), (50,50), (50,100), (0,50)]
                        |> filled blue
                        |> move (100,-80)

                        ]
                        --OVERFLOW
            Fail2C1 ->  
              [ rect 200 150 |> filled (rgb 50 100 200)

                 , shark |> scale 0.4 |> move (-40, repeatDistance 10 300 -100 model.time)
                 , shark |> scale 0.4 |> move (5, repeatDistance 20 300 -100 model.time)
                 , shark |> scale 0.1 |> move (50, repeatDistance 30 300 -100 model.time)

                 , sand lightBrown |> move (0,10)
                 , sand darkBrown
                 , bubbles |> move (1*cos(3*model.time),3*sin(model.time))

                 , seaweed |> scale 0.5  |> move (-90,-30) |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.25 |> move (-50,-40) |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.5  |> move (-30,-30) |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.25 |> move (10,-40)  |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.5  |> move (30,-30)  |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.25 |> move (70,-40)  |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.5  |> move (90,-30)  |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.75 |> move (50,-30)  |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.75 |> move (-70,-30) |> move (5*cos(model.time),0)
                 , seaweed |> scale 0.75 |> move (-10,-30) |> move (5*cos(model.time),0)
                 
                                 
                 , fish (rgb 230 125 50) darkOrange |> scale 0.3 |> move (-40, repeatDistance 10 300 -100 model.time)
                 , fish lightBlue darkBlue          |> scale 0.3 |> move (20, repeatDistance 20 300 -160 model.time)
                 , fish lightPurple darkPurple      |> scale 0.3 |> move (-10, repeatDistance 30 300 -160 model.time)
                 , fish lightGreen darkGreen        |> scale 0.3 |> move (35, repeatDistance 15 300 -160 model.time)
                 , fish pink hotPink                |> scale 0.3 |> move (-60, repeatDistance 10 300 -160 model.time)
                 , fish lightYellow darkYellow      |> scale 0.3 |> move (60, repeatDistance 25 300 -160 model.time)
              
                 ,polygon [(0,-10), (50,10), (50,70), (0,51)]
                        |> filled blue
                        |> scaleY 3
                        |> move (100,-80)
              ]
            otherwise -> []

fish color color2 = group [ triangle 15 |> outlined (solid 1) black |> rotate (degrees 120) |> move (-35,0)
                          , triangle 15 |> filled color |> rotate (degrees 120) |> move (-35,0)
                          
                          , curve (-49.26,-36.17) [Pull (-49.26,-36.17) (-49.26,-36.17) ,Pull (-49.26,-36.17) (-49.26,-36.17) ,Pull (-48.77,-36.01) (-48.28,-35.84) ,Pull (-47.79,-35.35) (-47.30,-34.86), Pull (-46.97,-34.53) (-46.64,-34.20) ,Pull (-46.32,-34.37) (-45.99,-34.53) ,Pull (-45.50,-34.70) (-45.01,-34.86) ,Pull (-44.68,-34.86) (-44.35,-34.86)
                                                  ,Pull (-43.86,-34.53) (-43.37,-34.20) ,Pull (-43.04,-33.71) (-42.72,-33.22) ,Pull (-41.73,-33.39) (-40.75,-33.55) ,Pull (-40.26,-33.55) (-39.77,-33.55), Pull (-39.61,-33.71) (-39.44,-33.88) ,Pull (-38.95,-34.20) (-38.46,-34.53) ,Pull (-37.64,-33.55) (-36.82,-32.57) ,Pull (-36.17,-32.57) (-35.51,-32.57) 
                                                  ,Pull (-35.35,-32.73) (-35.19,-32.90) ,Pull (-34.86,-33.39) (-34.53,-33.88) ,Pull (-34.86,-34.37) (-35.19,-34.86) ,Pull (-42.23,-35.68) (-49.26,-36.17)]
                            |> filled color2 |> move (41,41) |> scale 3
                            
                          , curve (-49.26,-36.17) [Pull (-49.26,-36.17) (-49.26,-36.17) ,Pull (-49.26,-36.17) (-49.26,-36.17) ,Pull (-48.77,-36.01) (-48.28,-35.84) ,Pull (-47.79,-35.35) (-47.30,-34.86), Pull (-46.97,-34.53) (-46.64,-34.20) ,Pull (-46.32,-34.37) (-45.99,-34.53) ,Pull (-45.50,-34.70) (-45.01,-34.86) ,Pull (-44.68,-34.86) (-44.35,-34.86)
                                                  ,Pull (-43.86,-34.53) (-43.37,-34.20) ,Pull (-43.04,-33.71) (-42.72,-33.22) ,Pull (-41.73,-33.39) (-40.75,-33.55) ,Pull (-40.26,-33.55) (-39.77,-33.55), Pull (-39.61,-33.71) (-39.44,-33.88) ,Pull (-38.95,-34.20) (-38.46,-34.53) ,Pull (-37.64,-33.55) (-36.82,-32.57) ,Pull (-36.17,-32.57) (-35.51,-32.57) 
                                                  ,Pull (-35.35,-32.73) (-35.19,-32.90) ,Pull (-34.86,-33.39) (-34.53,-33.88) ,Pull (-34.86,-34.37) (-35.19,-34.86) ,Pull (-42.23,-35.68) (-49.26,-36.17)]
                            |> outlined (solid 0.25) black |> move (41,41) |> scale 3

                          , oval 40 65 |> filled color |> rotate (degrees 90)
                          , oval 40 65 |> outlined (solid 1) black |> rotate (degrees 90)

                          , circle 4 |> filled black |> move (15,10)
                          , curve (0,0) [Pull (7,0) (10,-5)] |> filled black |> rotate (degrees 210) |> move (33, 0)
                          , triangle 10 |> filled color2 |> rotate (degrees 120)
                          , triangle 10 |> outlined (solid 1) black |> rotate (degrees 120)
                    ]
                    
shark = curve (-79.71,-2.127) [Pull (-77.74,-0.982) (-75.78,0.1636), Pull (-70.71,2.1278) (-65.63,4.0920), Pull (-63.50,5.0741) (-61.38,6.0562),Pull (-58.59,6.8746) (-55.81,7.6930) ,Pull (-52.37,8.6751) (-48.94,9.6572), Pull (-45.34,10.312) (-41.73,10.966), Pull (-37.81,11.948) (-33.88,12.930),Pull (-29.62,13.421) (-25.37,13.913)
                              ,Pull (-20.29,14.404) (-15.22,14.895), Pull (-12.60,14.895) (-9.984,14.895), Pull (-4.583,15.222) (0.8184,15.549),Pull (1.9641,15.713) (3.1099,15.877) ,Pull (5.4015,19.314) (7.6930,22.751), Pull (10.639,27.335) (13.585,31.918), Pull (15.386,34.700) (17.186,37.483),Pull (18.005,38.138) (18.823,38.792)
                              ,Pull (19.314,38.465) (19.805,38.138), Pull (19.969,37.483) (20.132,36.828), Pull (20.460,34.864) (20.787,32.900),Pull (21.278,30.772) (21.769,28.644) ,Pull (22.097,26.516) (22.424,24.388), Pull (23.079,22.751) (23.734,21.115), Pull (24.552,19.478) (25.370,17.841),Pull (25.861,16.859) (26.352,15.877)
                              ,Pull (27.498,14.240) (28.644,12.603), Pull (29.135,11.621) (29.626,10.639), Pull (30.936,10.148) (32.245,9.6572),Pull (34.373,9.1662) (36.501,8.6751) ,Pull (39.283,8.5115) (42.066,8.3478), Pull (42.393,8.1841) (42.721,8.0204), Pull (44.849,7.3657) (46.976,6.7109),Pull (48.122,6.7109) (49.268,6.7109)
                              ,Pull (51.396,6.0562) (53.524,5.4015), Pull (54.833,5.4015) (56.143,5.4015), Pull (57.289,5.0741) (58.434,4.7468),Pull (60.562,6.2199) (62.690,7.6930) ,Pull (63.017,5.8925) (63.345,4.0920), Pull (65.145,4.0920) (66.946,4.0920), Pull (68.746,4.0920) (70.547,4.0920),Pull (73.984,12.603) (77.421,21.115)
                              ,Pull (78.404,24.061) (79.386,27.007), Pull (80.531,29.135) (81.677,31.263), Pull (82.987,32.409) (84.296,33.554),Pull (85.278,34.864) (86.260,36.173) ,Pull (87.242,37.156) (88.225,38.138), Pull (88.225,34.864) (88.225,31.590), Pull (87.570,30.445) (86.915,29.299),Pull (85.442,17.677) (83.969,6.0562)
                              ,Pull (88.552,-7.856) (93.135,-21.76), Pull (88.879,-19.64) (84.624,-17.51), Pull (82.332,-14.89) (80.040,-12.27),Pull (77.094,-8.511) (74.148,-4.746) ,Pull (72.020,-5.401) (69.892,-6.056), Pull (70.547,-8.347) (71.202,-10.63), Pull (68.419,-9.820) (65.636,-9.002),Pull (60.890,-11.94) (56.143,-14.89)
                              ,Pull (58.434,-18.00) (60.726,-21.11), Pull (53.851,-19.31) (46.976,-17.51), Pull (44.194,-20.13) (41.411,-22.75),Pull (39.938,-21.60) (38.465,-20.46) ,Pull (30.772,-22.09) (23.079,-23.73), Pull (15.222,-24.71) (7.3657,-25.69), Pull (9.0025,-29.29) (10.639,-32.90),Pull (11.948,-34.20) (13.258,-35.51)
                              ,Pull (8.5115,-36.17) (3.7647,-36.82), Pull (1.1457,-36.33) (-1.473,-35.84), Pull (-3.764,-34.70) (-6.056,-33.55),Pull (-7.529,-32.90) (-9.002,-32.24) ,Pull (-10.63,-32.40) (-12.27,-32.57), Pull (-14.24,-31.09) (-16.20,-29.62), Pull (-17.51,-28.15) (-18.82,-26.68),Pull (-19.47,-26.18) (-20.13,-25.69)
                              ,Pull (-33.06,-23.89) (-45.99,-22.09), Pull (-53.03,-19.96) (-60.07,-17.84), Pull (-61.21,-17.18) (-62.36,-16.53),Pull (-63.50,-15.38) (-64.65,-14.24) ,Pull (-64,-13.25) (-63.34,-12.27), Pull (-66.94,-11.13) (-70.54,-9.984), Pull (-73.82,-8.838) (-77.09,-7.693),Pull (-78.40,-6.383) (-79.71,-5.074), Pull (-79.71,-4.419) (-79.71,-2.127)]
                              |> filled darkCharcoal |> makeTransparent 0.3
                              
sand color = group [oval 50 30 |> filled color |> move (-90,-70)
                  , oval 50 30 |> filled color |> move (-70,-70)
                  , oval 50 30 |> filled color |> move (-50,-70)
                  , oval 50 30 |> filled color |> move (-30,-70)
                  , oval 50 30 |> filled color |> move (-10,-70)
                  , oval 50 30 |> filled color |> move (10,-70)
                  , oval 50 30 |> filled color |> move (30,-70)
                  , oval 50 30 |> filled color |> move (50,-70)
                  , oval 50 30 |> filled color |> move (70,-70)
                  , oval 50 30 |> filled color |> move (90,-70) 
                  ] 

                      
bubbles = group [circle 2 |> outlined (solid 1) white |> makeTransparent 0.5 |> move (-30,-40)
               , circle 2 |> outlined (solid 1) white |> makeTransparent 0.5 |> move (15,20)
               , circle 2 |> outlined (solid 1) white |> makeTransparent 0.5 |> move (50,-10)
               , circle 2 |> outlined (solid 1) white |> makeTransparent 0.5 |> move (50,-25)
               , circle 2 |> outlined (solid 1) white |> makeTransparent 0.5 |> move (5,-20)
               , circle 2 |> outlined (solid 1) white |> makeTransparent 0.5 |> move (-70,20)
               , circle 2 |> outlined (solid 1) white |> makeTransparent 0.5 |> move (-90,-30)
               , circle 2 |> outlined (solid 1) white |> makeTransparent 0.5 |> move (70,20)   
                ]
              
seaweed = polygon [(0,73),(1,-34),(6,10)] |> filled darkGreen

-- ladder and wall (normal)

cc2 model =
            group
            [
              wall

            , ladder
              |> rotate (degrees (repeatDuration (-1) 35 0 (model.time-model.deltaTime)))
              |> move (repeatDuration (-1) 35 0 (model.time-model.deltaTime), repeatDuration (-1) 35 0 (model.time-model.deltaTime))
            ]

ladder = group [
                rung |> move (45,30)
              , rung |> move (40,25)
              , rung |> move (35,20)
              , rung |> move (30,15)
              , rung |> move (25,10)
              , rung |> move (20,5)
              , rung |> move (15,0)
              , rung |> move (10,-5)
              , rung |> move (5,-10)
              , rung |> move (0,-15)
              , rung |> move (-5,-20)
              , rung |> move (-10,-25)
              , rung |> move (-15,-30) 
              , rung |> move (-20,-35)

              , rect 5 120
                |> filled darkRed
                |> rotate (degrees -45)
                |> move (15,-5)
                |> addOutline (solid 0.5) black
                
              , rect 4 110
                |> filled darkRed
                |> rotate (degrees -45)
                |> move (10,0)
                |> addOutline (solid 0.5) black
                ]
               
rung = group
       [
        rect 2 10
        |> filled darkRed
        |> rotate (degrees 50)
        |> addOutline (solid 0.75) black
       ]

wall = group [
              rect 30 145
              |> filled darkBrown
              |> move (65,0)

            , rect 35 150
              |> filled darkBrown
              |> rotate (degrees 90)
              |> move (0,-55)
             ]


--challenge question 3
cc3 model = group ([ 
                  background
                 ]
                 ++
                 case model.state of
                   CC3 ->
                    [
                      movingCar model
                       |> move (-100,10)
                       |> scale 0.7
                       |> animationPieces [ (5, (\x -> move (15*(model.time - model.deltaTime), 0)))] 
                                          (\x -> move (75,0)) (model.time - model.deltaTime)
                    , granny
                      |> scale 0.7
                      |> animationPieces [ (5, (\x -> move (40, (3*(model.time - model.deltaTime)))))] 
                                          (\x -> move (40,15)) (model.time - model.deltaTime)

                    , group [speechBubble, speechText]
                      |> scale 0.9
                      |> move (50,30)
                      |> animationPieces [ (5.5, (\x -> makeTransparent 0))] 
                                          (\x -> makeTransparent 1) (model.time - model.deltaTime)
                    ]
                   PassC3 ->
                    [
                      movingCar model
                       |> move (-100,10)
                       |> scale 0.7
                       |> animationPieces [ (5, (\x -> move (15*((model.time - model.deltaTime)), 0))),(15,(\x -> move (75,0)))] 
                                          (\x -> move (75+15*((model.time - model.deltaTime)-20),0)) (model.time - model.deltaTime)
                    , granny
                      |> scale 0.7
                      |> animationPieces [ (20, (\x -> move (40, (3*(model.time - model.deltaTime)))))] 
                                          (\x -> move (40,60)) (model.time - model.deltaTime)
                    ]
                   Fail1C3 ->
                     [
                      movingCar model
                       |> move (-100,10)
                       |> scale 0.7
                       |> animationPieces [ (3, (\x -> move (15*((model.time - model.deltaTime)), 0)))] 
                                          (\x -> move (45,0)) (model.time - model.deltaTime)
                    , granny
                      |> scale 0.7
                      |> animationPieces [ (5, (\x -> move (40, (3*(model.time - model.deltaTime)))))] 
                                          (\x -> move (40,15)) (model.time - model.deltaTime)
                    ]
                   Fail2C3 ->
                    [
                     bloodSplotch 
                     |> move (60,0)
                     |> animationPieces [ (6, (\x -> makeTransparent 0))] 
                                          (\x -> makeTransparent 1) (model.time - model.deltaTime)
                    , granny
                      |> scale 0.7
                      |> animationPieces [ (6, (\x -> move (40, (3*(model.time - model.deltaTime)))))] 
                                          (\x -> move (0,60) >> rotate (degrees -90)) (model.time - model.deltaTime)
                    , movingCar model
                       |> move (-100,10)
                       |> scale 0.7
                       |> move (15*((model.time - model.deltaTime)),0)
                    ]
                    
                   SkippedC3 ->
                     [
                      movingCar model
                       |> move (-100,10)
                       |> scale 0.7
                       |> animationPieces [ (5, (\x -> move (15*((model.time - model.deltaTime)), 0)))] 
                                          (\x -> move (75,0)) (model.time - model.deltaTime)
                    , granny
                      |> scale 0.7
                      |> animationPieces [ (5, (\x -> move (40, (3*(model.time - model.deltaTime)))))] 
                                          (\x -> move (40,15)) (model.time - model.deltaTime)

                    , group [speechBubble, speechText]
                      |> scale 0.9
                      |> move (50,30)
                      |> animationPieces [ (5.5, (\x -> makeTransparent 0))] 
                                          (\x -> makeTransparent 1) (model.time - model.deltaTime)
                    ]
                   otherwise -> []
                   ) 
                   |> clip (square 200 |> ghost)

background = group 
             [
               rect 300 200 |> filled darkGreen,
               rect 300 70 |> filled charcoal |> addOutline (solid 1) black,
               rect 300 50 |> filled darkCharcoal |> addOutline (solid 1) black,
               crosswalk,
               stopSign |> rotate (degrees 270) |> move (20,50)
             ]
             
crosswalk = group  
            [
              whiteLine |> move (30,0)
            , whiteLine |> move (30,5)
            , whiteLine |> move (30,10)
            , whiteLine |> move (30,15)
            , whiteLine |> move (30,20)
            , whiteLine |> move (30,-5)
            , whiteLine |> move (30,-10)
            , whiteLine |> move (30,-15)
            , whiteLine |> move (30,-20) 
            ]

whiteLine = line (0,0) (20,0)
            |> outlined (solid 3) white
                        
stopSign = group
           [
             rect 5 30
             |> filled gray
             
           , triangle 7
             |> filled gray
             |> rotate (degrees 90)
             |> move (0,-15)
             
           , ngon 6 12
             |> filled gray
             |> move (0,20)
           
           , ngon 6 11
             |> filled darkRed
             |> move (0,20)
           
           , text "STOP"
             |> customFont "Courier New"
             |> centered
             |> filled white
             |> scale 0.6
             |> move (0,18)
           
           ] |> addOutline (solid 1) black
           
granny = group          
         [
          roundedRect 25 30 10
          |> filled brown
          |> move (0,-5)
          |> addOutline (solid 0.5) black,
           
         circle 10
         |> filled (rgb 255 186 130)
         |> addOutline (solid 0.5) (black),
           
         circle 1
         |> filled black
         |> move (-3,2),
         
         circle 1
         |> filled black
         |> move (3,2),
         
         curve (0,0) [Pull (10,0) (20,-10)]
         |> filled red
         |> rotate (degrees 205)
         |> scale 0.5
         |> move (5,-4),
         
         line (0,0) (0,20)
         |> outlined (solid 1.5) black
         |> move (0,-30),
         
         line (0,0) (0,10)
         |> outlined (solid 1.5) black
         |> rotate (degrees -30)
         |> move (-5,-45),
         
         line (0,0) (0,10)
         |> outlined (solid 1.5) black
         |> rotate (degrees 30)
         |> move (5,-45),
         
         triangle 10
         |> filled pink
         |> rotate (degrees 90)
         |> move (0,-35)
         |> addOutline (solid 0.5) black,
         
         line (0,0) (0,10)
         |> outlined (solid 1.5) black
         |> rotate (degrees 45)
         |> move (0,-20),
         
         line (0,0) (0,10)
         |> outlined (solid 1.5) black
         |> rotate (degrees -45)
         |> move (0,-20)     
         ]

speechBubble = group 
               [
                oval 30 15 
                |> filled white
                |> move (10,5)
                |> scale 2
                
               
               , triangle 10 
                 |> filled white
                 
               ] |> addOutline (solid 1) black

speechText = group 
             [
              text "So today's the"
              |> customFont "Comic Sans MS"
              |> centered
              |> filled black
              |> scale 0.5
              |> move (20,12)
              
              ,text " day I die..."
              |> customFont "Comic Sans MS"
              |> centered
              |> filled black
              |> scale 0.5
              |> move (20,2)
             ]

bloodSplotch = group 
               [
                oval 30 10 
                |> filled red,
                
                oval 15 10 
                |> filled red
                |> move (5,5),
                oval 20 10 
                |> filled red
                |> rotate (degrees -30)
                |> move (10,0)
                ]|> addOutline (solid 1) black
             
-- The bumps of the car
-- And the rotating wheels
movingCar pic = group 
                [
                car
                |> move (0,1*sin(5*pic.time)),

                wheel
                |> rotate (degrees(-30*pic.time))
                |> move (-50, -29),

                wheel
                |> rotate (degrees(-30*pic.time))
                |> move (10, -29)
                ]

-- Design of the car
car = group 
      [
      -- top
      oval 25 20
      |> filled lightGreen
      |> scale 2
      |> addOutline (solid 0.5) (rgb 0 0 0)
      |> move (-20,-5),

      -- window
      oval 25 20
      |> filled (rgb 100 199 230)
      |> scale 1.5
      |> addOutline (solid 0.5) (rgb 0 0 0)
      |> move (-20,-5),

      -- window line
      rect 0.5 30
      |> outlined (solid 0.5) black
      |> move (-20,-5),

      -- main body
      roundedRect 80 20 5
      |> filled lightGreen
      |> addOutline (solid 1) (rgb 0 0 0)
      |> move (-20,-15),

      -- front door  
      rect 19 20
      |> outlined (solid 0.75) black
      |> move (-29.5,-15),

      -- back door  
      rect 19 20
      |> outlined (solid 0.75) black
      |> move (-10.5,-15),

      -- front door handle
      rect 3 0.5
      |> outlined (solid 0.5) black
      |> move (-15,-10),

      -- back door handle
      rect 3 0.5
      |> outlined (solid 0.5) black
      |> move (-35,-10),

      -- headlight
      curve (0,0) [Pull (-12,8) (0,15)]
      |> filled lightYellow
      |> addOutline (solid 1) (rgb 0 0 0)
      |> move (19.5, -23),

      -- brakelight
      curve (0,0) [Pull (-12,8) (0,15)]
      |> filled red
      |> addOutline (solid 1) (rgb 0 0 0)
      |> rotate (degrees 180)
      |> move (-59.5, -7),

      -- window shine front door  
      curve (0,0) [Pull (13,1) (20,-10)]
      |> filled white
      |> scale 0.4
      |> move (-14, 6),

      -- window shine back door  
      curve (0,0) [Pull (9,1) (15,-20)]
      |> filled white
      |> scale 0.3
      |> move (2, 33)
      |> rotate (degrees 90)
      ]

-- Design of the wheel and hubcaps
wheel = group 
        [ 
        -- wheel
        circle 8
        |> filled lightCharcoal
        |> addOutline (solid 1) (rgb 0 0 0),

        -- hubcap
        circle 8
        |> filled gray
        |> addOutline (solid 1) (rgb 0 0 0)
        |> scale 0.7,

        wedge 6 0.1
        |> filled darkCharcoal,

        wedge 6 0.1
        |> filled darkCharcoal
        |> rotate (degrees 90),

        wedge 6 0.1
        |> filled darkCharcoal
        |> rotate (degrees 180),

        wedge 6 0.1
        |> filled darkCharcoal
        |> rotate (degrees 270)  
        ]
        
        
-- Question 4
-- Ball and Basket

--Challenge Question 4 (ball and basket)

cc4 model = (
                 case model.state of
                   CC4 ->
                      group [rightTriangle 100 100
                          |> filled darkBlue
                          |> move (-100,-50)
                        , ball 
                        , basket]
                          |> scale 0.38
                          |> move (48,0)
                          
                   PassC4 ->
                      group [
                           rectangle 200 150 |> filled white,
                           rightTriangle 100 100
                           |> filled darkBlue
                           |> move (-100,-50),
                           basketBack, 
                           ball |> animationPieces [ (4.5, (\x -> move (20*(model.time-model.deltaTime), -20*(model.time-model.deltaTime)))), 
                                                     (0.5, (\x -> move (95,-75) >> move (0, -20*(model.time-model.deltaTime-3.5))))] 
                                                   (\x -> move(95,-105))  (model.time-model.deltaTime),
                           basketFront
                            ]
                            |> scale 0.38
                            |> move (48,0)
                      
                   Fail1C4 ->
                      group [
                               rightTriangle 100 100
                                |> filled darkBlue
                                |> move (-100,-50)
                              , ball
                                |> animationPieces [ (4.5, (\x -> move (10*(model.time-model.deltaTime), -10*(model.time-model.deltaTime))))] (\x -> move(45,-45)) (model.time-model.deltaTime)
                              , basket
                              , textArrowUnder
                                |> animationPieces [ (4.5, (\x -> makeTransparent 0))] (\x -> makeTransparent 1) (model.time-model.deltaTime)
                              ]
                              |> scale 0.38
                              |> move (48,0)
                          
                   Fail2C4 ->
                    
                         group [
                         rightTriangle 100 100
                          |> filled darkBlue
                          |> move (-100,-50)
                        , ball
                          |> animationPieces [ (3.2, (\x -> move (75*(model.time-model.deltaTime), -75*(model.time-model.deltaTime))))
                                             ] (\x -> move (500,500))  (model.time-model.deltaTime)
                        , basket
                        ]
                          |> scale 0.38
                          |> move (48,0)
                   SkippedC4 ->
                     
                     group [rightTriangle 100 100
                          |> filled darkBlue
                          
                          |> move (-100,-50)
                        , ball 
                        , basket]
                          |> scale 0.38
                          |> move (48,0)
                   otherwise -> group []
                   ) 
                   |> clip (square 200 |> ghost)
             
---------------------Common------------------------

ball = group [circle 10
              |> filled darkOrange
              |> move (-86,50)
              |> addOutline (solid 0.25) black
            , roundedRect 1 20 3
              |> filled black
              |> move (-86,50)
            , roundedRect 1 20 3
              |> filled black
              |> rotate (degrees 90)
              |> move (-86,50)
            , roundedRect 1 20 3
              |> filled black
              |> rotate (degrees 220)
              |> move (-86,50)
            , roundedRect 1 20 3
              |> filled black
              |> rotate (degrees 130)
              |> move (-86.2,50)
             ]

basket = group [oval 21 7
                |> filled lightCharcoal
                |> addOutline (solid 0.5) black
                |> move (10,-50)
              , polygon [(27,0),(-27,0),(-15,-35),(15,-35)]
                |> filled lightCharcoal
                |> addOutline (solid 1) black
                |> scale 0.4
                |> move (10,-50)]
                
----------------------Under------------------------

textArrowUnder = group [
                   rect 50 25 |> outlined (solid 1) red |> rotate (degrees -45) |> move(40,-10),
                   rect 15 5 |> filled red,
                   triangle 7 |> filled red |> rotate (degrees 60) |> move(-10,0),
                   textUnderMsg
                  ]
                  |> rotate (degrees 45) 
                  |> move (-15,25)
                  
textUnderMsg = group [text "Under Value,"
                      |> filled black
                      |> scale 0.7
                      |> move(13,25),
                      text "try again..."
                      |> filled black
                      |> scale 0.7
                      |> move(13,15)
                     ]
                     |> rotate (degrees -45)
 
----------------------Over------------------------  

textArrowOver = group [
                   rect 50 25 |> outlined (solid 1) red |> rotate (degrees -135) |> move(40,15),
                   rect 15 5 |> filled red,
                   triangle 7 |> filled red |> rotate (degrees 60) |> move(-10,0),
                   textOverMsg
                  ]
                  |> rotate (degrees 135) 
                  |> move (-20,30)
                  
textOverMsg = group [text "Over Value,"
                      |> filled black
                      |> scale 0.7
                      |> move(-62,20),
                      text "try again..."
                      |> filled black
                      |> scale 0.7
                      |> move(-62,10)
                     ]
                     |> rotate (degrees -135)
                 
-----------------------Pass----------------------------

basketFront = polygon [(27,0),(-27,0),(-15,-35),(15,-35)]
                |> filled lightCharcoal
                |> addOutline (solid 1) black
                |> scale 0.4
                |> move (10,-50)

basketBack = oval 21 7
                |> filled lightCharcoal
                |> addOutline (solid 0.5) black
                |> move (10,-50)
                
--- Quesrion 5
-- Orchard
cc5 model =
          case model.state of
            CC5 -> group [backgroundApple
                  , treeArrangement model
                  ,  rect 200 100
                    |> filled white
                    |> move (-20,-115)
                  ]
                  |> scale 0.38
                  |> move (48,0)
                  
                  
            PassC5 ->
                 group [ backgroundApple
                   , treeArrangement model
                   , (html 1000000 10000 <| Html.img [Html.Attributes.src happyFarmerURL] [])
                   |> scale 0.4
                   |> move (0,17)
                 ]
                 |> scale 0.38
                 |> move (48,0)
                 
            Fail1C5 ->
                        group [ -- under value goes here
                         backgroundApple
                         , treeArrangementUnder model
                         , (html 1000000 10000 <| Html.img [Html.Attributes.src sadFarmerURL] [])
                         |> scale 0.6
                         |> move (40,17)
                        ]
                        |> scale 0.38
                        |> move (48,0)
            Fail2C5 -> 
              group [ -- over value goes here
                backgroundApple
                , treeArrangementOver model
                , (html 1000000 10000 <| Html.img [Html.Attributes.src sadFarmerURL] [])

                |> scale 0.6

                |> move (40,17)

              ]

              |> scale 0.38

              |> move (48,0)
            otherwise -> group []

 

------------------- Normal & Pass --------------------------

treeArrangement model = group [-- top row

                               tree model |> move (-90,0)

                             , tree model |> move (-45,0)

                             , tree model |> move (0,0)

                             , tree model |> move (45,0)

                             , tree model |> move (90,0)

                               -- middle row

                             , tree model |> move (-70,-20)

                             , tree model |> move (-35,-20)

                             , tree model |> move (0,-20)

                             , tree model |> move (35,-20)

                             , tree model |> move (70,-20)
                             ]

tree model = group [rect 10 75
                    |> filled (rgb 83 49 24)

                  , rect 5 30
                    |> filled (rgb 83 49 24)
                    |> rotate (degrees 30)

                    |> move (-10,23)

                  , rect 5 30

                    |> filled (rgb 83 49 24)

                    |> rotate (degrees -30)

                    |> move (10,23)

                  , bushGood  |> addOutline (solid 1) black

                  , topRowApples |> move (0, -20*(model.time-model.deltaTime))

                  , middleRowApples |> move (0, -30*(model.time-model.deltaTime))

                  , bottomRowApples |> move (0, -20*(model.time-model.deltaTime))
                  
                  
                  
                  

                  ]

                  |> scale 0.5

 

topRowApples = group [apple |> addOutline (solid 1) black |> move (-25,70)

                     , apple |> addOutline (solid 1) black |> move (0,70)

                     , apple |> addOutline (solid 1) black |> move (25,70)

                     ]

                

middleRowApples = group [apple |> addOutline (solid 1) black |> move (-40,50)

                 , apple |> addOutline (solid 1) black |> move (-20,50)

                 , apple |> addOutline (solid 1) black |> move (0,50)

                 , apple |> addOutline (solid 1) black |> move (20,50)

                 , apple |> addOutline (solid 1) black |> move (40,50)]

 

bottomRowApples = group [apple |> addOutline (solid 1) black |> move (-30,30)

                 , apple |> addOutline (solid 1) black |> move (30,30)]

bushGood = group [leavesGood |> rotate (degrees 30)  |> move (10,10)

            , leavesGood |> move (10,5)

            , leavesGood |> rotate (degrees -30) |> move (10,0)

            , leavesGood |> rotate (degrees 30)  |> move (10,30)

            , leavesGood |> move (10,25)

            , leavesGood |> rotate (degrees -30) |> move (10,20)

            , leavesGood |> rotate (degrees 60)  |> move (10,40)

            , leavesGood |> move (10,25)

            , leavesGood |> rotate (degrees -60) |> move (10,20)

            , leavesGood |> rotate (degrees 90)  |> move (15,45)

            , leavesGood |> rotate (degrees -90) |> move (-15,25)

            ]

             

leavesGood = group [oval 30 15

                |> filled darkGreen

                |> rotate (degrees -60)

                |> move (-15,40)

              , oval 30 15

                |> filled darkGreen

                |> rotate (degrees -90)

                |> move (-10,50)

              , oval 30 15

                |> filled darkGreen

                |> rotate (degrees -120)

                |> move (-5,40)

               ]

          

backgroundApple = group [rect 240 50

                    |> filled darkGreen

                    |> move (0,-40)

                  , rect 240 80

                    |> filled (rgb 135 206 235)

                    |> move (0, 25)

                   ]

 

apple = group [circle 20

              |> filled darkRed

            , rect 2 10

              |> filled (rgb 0 110 7)

              |> move (0,20)

            , curve (0,0) [Pull (5,0) (15,-10)]

              |> filled black

              |> rotate (degrees 210)

              |> move (10,15)

            , oval 10 25

              |> filled (rgb 0 110 7)

              |> scale 0.5

              |> rotate (degrees -60)

              |> move (5,27)

            , oval 10 25

              |> filled (rgb 0 110 7)

              |> scale 0.5

              |> rotate (degrees 60)

              |> move (-5,27)

              ]

              |> scale 0.2

             

happyFarmerURL = "https://user-images.githubusercontent.com/80813838/112688831-cabee200-8e4f-11eb-92c1-ead4599c7d56.png"

--------------------------------------------------------------

 

-------------- Over Things --------------

treeBad model = group [rect 10 75

                    |> filled (rgb 83 49 24)

                  , rect 5 30

                    |> filled (rgb 83 49 24)

                    |> rotate (degrees 30)

                    |> move (-10,23)

                  , rect 5 30

                    |> filled (rgb 83 49 24)

                    |> rotate (degrees -30)

                    |> move (10,23)

                  , bushBad  model |> addOutline (solid 1) black

                  ]

                  |> scale 0.5

 

bushBad model = group [leavesBad model |> rotate (degrees 30)  |> move (10,10)

                      , leavesBad model |> move (10,5)

                      , leavesBad model |> rotate (degrees -30) |> move (10,0)

                      , leavesBad model |> rotate (degrees 30)  |> move (10,30)

                      , leavesBad model |> move (10,25)

                      , leavesBad model |> rotate (degrees -30) |> move (10,20)

                      , leavesBad model |> rotate (degrees 60)  |> move (10,40)

                      , leavesBad model |> move (10,25)

                      , leavesBad model |> rotate (degrees -60) |> move (10,20)

                      , leavesBad model |> rotate (degrees 90)  |> move (15,45)

                      , leavesBad model |> rotate (degrees -90) |> move (-15,25)

                 ]

            

leavesBad model = group [oval 30 15

                      |> animationPieces [ (13.5, (\x -> filled (rgb (21+20*sin model.time) (89-34*sin model.time) 0) ))] (\x -> (filled (rgb 71 25 0))) model.time

                      |> rotate (degrees -60)

                      |> move (-15,40)

                      , oval 30 15

                      |> animationPieces [ (13.5, (\x -> filled (rgb (21+20*sin model.time) (89-34*sin model.time) 0) ))] (\x -> (filled (rgb 71 25 0))) model.time

                      |> rotate (degrees -90)

                      |> move (-10,50)

                      , oval 30 15

                      |> animationPieces [ (13.5, (\x -> filled (rgb (21+20*sin model.time) (89-34*sin model.time) 0) ))] (\x -> (filled (rgb 71 25 0))) model.time

                      |> rotate (degrees -120)

                      |> move (-5,40)
                      ]  
                      
treeArrangementOver model = group [-- top row

                               treeBad model |> move (-90,0)

                             , treeBad model |> move (-45,0)

                             , treeBad model

                             , treeBad model |> move (45,0)

                             , treeBad model |> move (90,0)

                               -- middle row

                             , treeBad model |> move (-70,-20)

                             , treeBad model |> move (-35,-20)

                             , treeBad model |> move (0,-20)

                             , treeBad model |> move (35,-20)

                             , treeBad model |> move (70,-20)

                              -- bottom row

                             , treeBad model |> move (-80,-40)

                             , treeBad model |> move (-40,-40)

                             , treeBad model |> move (0,-40)

                             , treeBad model |> move (40,-40)

                             , treeBad model |> move (80,-40)

                             ]
                             
sadFarmerURL = "https://user-images.githubusercontent.com/80813838/112688786-b67ae500-8e4f-11eb-8ee4-3b950e359ee0.png"

------------------- Under Things --------------------------

treeArrangementUnder model = group [-- top row

                               treeBad model |> move (-90,0)

                             , treeBad model |> move (0,0)

                             , treeBad model |> move (90,0)

                               -- middle row

                             , treeBad model |> move (-35,-30)

                             , treeBad model |> move (35,-30)

                             ]


-- EXTRA STUFF

helper = group 
         [
          group 
          [
            rect 50 20
               |> filled black
         ,  triangle 5
               |> filled black 
               |> rotate (degrees 90)
               |> move (0,12.5)
          ]
          |> makeTransparent 0.6
          |> addOutline (solid 1) black
          
          , text "Let us know how"
          |> customFont "Calibri"
          |> centered
          |> filled white
          |> scale 0.5
          |> move (0,4)
          
          , text "we can improve!"
          |> customFont "Calibri"
          |> centered
          |> filled white
          |> scale 0.5
          |> move (0,-3)
         ] |> move (30,-50) 



--applied q7
quizLayoutApplied7 colour model = group 
                    [
                     divider,
             
                     exit model
                     |> move (85,53.5),
                     
                     rect 50 10
                     |> outlined (solid 1) (rgb 14 235 213)
                     |> move (-50,35), 
             
                     eq7
                     |> scale 0.5
                     |> move (-50,33),
                     
                     q7
                     |> scale 0.4
                     |> move (-92,50),
                     
                     text "Question 7:"
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)
                     
                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)
                      
                     ,answerBox colour model
                     
                    ]
                    
--applied q8
quizLayoutApplied8 colour model = group 
                    [
                     divider,
             
                     exit model
                     |> move (85,53.5),
                     
                     q8
                     |> scale 0.4
                     |> move (-92,50),
                     
                     text "Question 8:"
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)
                     
                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)
                      
                     ,answerBox colour model
                     
                    ]
--applied q9
quizLayoutApplied9 colour model = group 
                    [
                     divider,
             
                     exit model
                     |> move (85,53.5),
                     
                     q9
                     |> scale 0.4
                     |> move (-92,50),
                     
                     text "Question 9:"
                     |> customFont "Calibri"
                     |> centered
                     |> bold
                     |> filled black
                     |> scale 0.5
                     |> move (-78, 60)
                     
                     ,submit
                      |> scale 0.75
                      |> move (-75,-21)
                     ,skip
                      |> scale 0.75
                      |> move (-75,-19)
                      
                     ,answerBox colour model
                    ]


howToAnswerQ model = group (
               [ group [
                roundedRect 10 10 2
                |> filled (rgb 66 194 186)
                |> addOutline (solid 1) lightBlue
                
                , text "?"
                  |> customFont "Arial"
                  |> centered
                  |> filled white
                  |> scale 0.8
                  |> move (0,-3)] |> notifyTap HowToAnswerOpen
               ]
                ++
                 [ howhow
                   |> makeTransparent model.how
                 ]
               )

howhow = group 
         [
          group 
          [
            rect 60 40
               |> filled white
               |> move (0,34.5)
         ,  triangle 5
               |> filled white 
               |> rotate (degrees 30)
               |> move (0,12.5)
          ] |> addOutline (solid 1) black
          , text "How to answer: "
          |> customFont "Calibri"
          |> centered
          |> bold
          |> filled black
          |> scale 0.4
          |> move (0,50)
          
          , text "- No spaces"
          |> customFont "Calibri"
          |> alignLeft
          |> filled black
          |> scale 0.3
          |> move (-29,45)
          
          , text "- Power sign = ^"
          |> customFont "Calibri"
          |> alignLeft
          |> filled black
          |> scale 0.3
          |> move (-29,40)
          , text "- No units needed"
          |> customFont "Calibri"
          |> alignLeft
          |> filled black
          |> scale 0.3
          |> move (-29,35)
          , text "- For equations, write it like: y=mx+c"
          |> customFont "Calibri"
          |> alignLeft
          |> filled black
          |> scale 0.3
          |> move (-29,30)
          , text "- For cos / sin / tan, put x in ()"
          |> customFont "Calibri"
          |> alignLeft
          |> filled black
          |> scale 0.3
          |> move (-29,25)
          , text "- Use brackets to separate things that "
          |> customFont "Calibri"
          |> alignLeft
          |> filled black
          |> scale 0.3
          |> move (-29,20)
          , text "  are being divided"
          |> customFont "Calibri"
          |> alignLeft
          |> filled black
          |> scale 0.3
          |> move (-29,15.5)
          
          ]

goodJob model = group
                  [
                    rect 200 200 |> filled black,
                    backgroundWD model,
                    roundedRect 130 20 10 |> filled white |> addOutline (solid 1) black|> move (0,-35),
                    text "Well Done!"
                      |> GraphicSVG.size 20
                      |> customFont "Calibri"
                      |> bold
                      |> fixedwidth
                      |> centered
                      |> filled green
                      |> move (0,-41),
                    (html 100000 10000 <| Html.img [Html.Attributes.src thumbsUp] [])
                      |> scale 0.05
                      |> move (-20,50),
                    sparkles model
                    
                  ]

backgroundWD model = group
                        [
                        isosceles 30 110
                          |> filled (rgb (150+100*sin model.time) (150-100*sin model.time) (150-100*sin model.time))
                          |> move (0,-110)
                      , isosceles 30 110
                          |> filled (rgb (150-100*sin model.time) (150+100*sin model.time) (150-100*sin model.time))
                          |> rotate (degrees 45)
                          |> move (78,-78)
                      , isosceles 30 100
                          |> filled (rgb (150+100*sin model.time) (150-100*sin model.time) (150-100*sin model.time))
                          |> rotate (degrees 90)
                          |> move (100,0)
                      , isosceles 30 110
                          |> filled (rgb (150-100*sin model.time) (150+100*sin model.time) (150-100*sin model.time))
                          |> rotate (degrees 135)
                          |> move (78,78)
                      , isosceles 30 110
                          |> filled (rgb (150+100*sin model.time) (150-100*sin model.time) (150-100*sin model.time))
                          |> rotate (degrees 180)
                          |> move (0,110)
                      , isosceles 30 110
                          |> filled (rgb (150-100*sin model.time) (150+100*sin model.time) (150-100*sin model.time))
                          |> rotate (degrees 225)
                          |> move (-78,78)
                      , isosceles 30 100
                          |> filled (rgb (150+100*sin model.time) (150-100*sin model.time) (150-100*sin model.time))
                          |> rotate (degrees 270)
                          |> move (-100,0)
                      , isosceles 30 110
                          |> filled (rgb (150-100*sin model.time) (150+100*sin model.time) (150-100*sin model.time))
                          |> rotate (degrees 315)
                          |> move (-78,-78) 
                        ]

sparkles model = group
                      [
                      (html 100000 10000 <| Html.img [Html.Attributes.src sparkle] [])
                        |> scale 0.1
                        |> scale (0.5*sin(1*model.time))
                        |> move (60,-15),
                      (html 100000 10000 <| Html.img [Html.Attributes.src sparkle] [])
                        |> scale 0.1
                        |> scale (0.5*sin(1*model.time))
                        |> move (-100,-15),
                      (html 100000 10000 <| Html.img [Html.Attributes.src sparkle] [])
                        |> scale 0.1
                        |> scale (0.5*sin(1*model.time))
                        |> move (40,50),
                      (html 100000 10000 <| Html.img [Html.Attributes.src sparkle] [])
                        |> scale 0.1
                        |> scale (0.5*sin(1*model.time))
                        |> move (-80,45),
                      (html 100000 10000 <| Html.img [Html.Attributes.src sparkle] [])
                        |> scale 0.1
                        |> scale (0.5*sin(1*model.time))
                        |> move (-20,70),
                      (html 100000 10000 <| Html.img [Html.Attributes.src sparkle] [])
                        |> scale 0.1
                        |> scale (0.5*sin(1*model.time))
                        |> move (10,45),
                      (html 100000 10000 <| Html.img [Html.Attributes.src sparkle] [])
                        |> scale 0.1
                        |> scale (0.5*sin(1*model.time))
                        |> move (-50,50),
                      (html 100000 10000 <| Html.img [Html.Attributes.src sparkle] [])
                        |> scale 0.1
                        |> scale (0.5*sin(1*model.time))
                        |> move (20,15),
                      (html 100000 10000 <| Html.img [Html.Attributes.src sparkle] [])
                        |> scale 0.1
                        |> scale (0.5*sin(1*model.time))
                        |> move (-60,15)
                      ]
                      |> move (17,-20)
                      
                      
thumbsUp = "https://user-images.githubusercontent.com/80813838/114321457-dc0f1c00-9ae8-11eb-8cd8-a29ea5dd7f21.png"
  

sparkle = "https://cliply.co/wp-content/uploads/2019/05/391905030_SPARKLES_400.png"


homeButton = group
              [
                roundedRect 40 10 5
                |> filled darkGreen
                |> addOutline (solid 0.8) black
                |> move (70,55),
                text "Exit"
                |> GraphicSVG.size 6
                |> bold
                |> fixedwidth
                |> centered
                |> filled white
                |> move (70,53)
              ]

-- repeat an animation for a given duration
repeatDuration : Float -> Int -> Float -> Float -> Float
repeatDuration speed duration startPosition time =
  speed * (time - toFloat duration * toFloat (floor time // duration)) + startPosition

-- repeat an animation for a given distance
repeatDistance : Float -> Float -> Float -> Float -> Float
repeatDistance speed distance startPosition time =
  repeatDuration speed (round <| distance / speed) startPosition time
  
-- sequence a series of animation pieces together into one
animationPieces : List (Float, Float -> anytype) -> (Float -> anytype) -> Float -> anytype
animationPieces intervals finalAnimation time =
  case intervals of
    (duration, animation) :: rest ->
        if time <= duration then
          animation time
        else
          animationPieces rest finalAnimation (time - duration)
    [] ->
        finalAnimation time
        
        

 
 
