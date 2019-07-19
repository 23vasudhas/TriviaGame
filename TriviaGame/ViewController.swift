//
//  ViewController.swift
//  TriviaGame
//
//  Created by 23VasudhaSubramanian on 7/18/19.
//  Copyright © 2019 Vasudha Subramanian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//variables questions, answers, score, currentQ
    var questions = ["The more you take away, the more I become. What am I?", "I get wet while drying. What am I?", "The more you take the more you leave behind.  What am I?", "I am tall when young and short when I am old. What am I?", "I go up and never come down.  What am I?", "I disappear every time you say my name. What am I?", "I fly without wings.  What am I?", "If you have me, you want to share me. Once you share me, you won’t have me. What am I?", "I start with an E, end with an E, and have a letter in me. What am I?", "I sit in a corner while traveling around the world. What am I?", "I can fall off a building and live, but put me in water I will die. What am I?", "I have a face but no eyes, hands but no arms. What am I?", "I am full of holes but still hold water. What am I?", "The faster you run, the harder it is to catch me. What am I?"]
    var currentQ = 0
    var answers = ["hole", "towel", "footsteps", "candle", "age", "silence", "time", "secret", "envelope", "stamp", "paper", "clock", "sponge", "your breath"]
    var score = 0
    
//IBOutlet for labels and buttons
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var endOfGameMessage: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQ]
        menuButton.isHidden = true
    }
    
    func processAnswer() {
        if(userAnswerTextField.text == ""){
            validationLabel.text = "Please enter an answer."
            return
        }
        let userAnswer = userAnswerTextField.text
        let correctAnswer = answers[currentQ]
        
        if(userAnswer!.caseInsensitiveCompare(correctAnswer) == .orderedSame) {
            validationLabel.text = "That is correct!"
            score += 1
        } else {
            validationLabel.text = "Incorrect. The correct answer is \(correctAnswer)."
        }
        
        //end of game messages
        currentQ += 1
        if (currentQ >= questions.count){
            if(score > questions.count / 2 ) {
                endOfGameMessage.text = "Well Done. That was a great game! \nClick MENU to play again!"
                menuButton.isHidden = false
            } else {
                endOfGameMessage.text = "Better luck next time! \nClick MENU to play again!"
                menuButton.isHidden = false
            }
        } else {
            questionLabel.text = questions[currentQ]
        }
        userAnswerTextField.text = ""
        scoreLabel.text = "Score: \(String(score))"
    }




    @IBAction func textFieldEnterPress(_ sender: Any) {
        processAnswer()
    }
    //responses for when user answers the question
    @IBAction func checkButtonClick(_ sender: Any) {
        processAnswer()
    }
        

}
