//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = true
    var index : Int = 0
    var score: Int=0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestion.list[0]
        questionLabel.text = firstQuestion.questionText
        progressLabel.text = "\(index+1)/13"
        scoreLabel.text=String(score)
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if index < allQuestion.list.count{
        if sender.tag == 1
        {
            pickedAnswer = true
        }
        else{
            pickedAnswer = false
        }
        
        checkAnswer()
        }
        
    }
    
    
    func updateUI(result:Bool) {
        index += 1
        progressLabel.text = "\(index)/13"
        if result{
            print("correct ans")
            score+=1
            scoreLabel.text=String(score)
        }
        else{
            print("wrong ans")
        }
        
        progressBar.frame.size.width=((view.frame.size.width)/13)*CGFloat(index)
        //print("increase size of progess bar")
        
        if index < allQuestion.list.count{
        nextQuestion()
        }
        else{
            let alert=UIAlertController(title: "Awesome", message: "Quiz over", preferredStyle: UIAlertControllerStyle.alert)
            let restartAction=UIAlertAction(title: "Restart", style: UIAlertActionStyle.default) { (UIAlertAction) in
                self.startOver()
                
            }
            let cancel=UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(restartAction)
            alert.addAction(cancel)
            
            present(alert, animated: true, completion: nil)
        
            }
        
        
      
    }
    

    func nextQuestion() {
        questionLabel.text=allQuestion.list[index].questionText
    }
    
    
    func checkAnswer() {
        if pickedAnswer == allQuestion.list[index].answer
        {
            updateUI(result: true)
            ProgressHUD.showSuccess("Correct")
        }
        
        else{
            updateUI(result: false)
            ProgressHUD.showError("Wrong")
        }
        
    }
    
    
    func startOver() {
        index=0
        score=0
        scoreLabel.text=String(score)
        progressLabel.text = "\(index)/13"
        progressBar.frame.size.width=((view.frame.size.width)/13)*CGFloat(index)
       nextQuestion()
    }
    

    
}
