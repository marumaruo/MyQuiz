//
//  QuestionViewController.swift
//  MyQuiz
//
//  Created by bc0067042 on 2016/07/07.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import UIKit
import AudioToolbox

class QuestionViewController: UIViewController {
    
    var questionData :QuestionData!
    
    @IBOutlet weak var questionNoLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBOutlet weak var correctImageView: UIImageView!
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //初期データ設定
        questionNoLabel.text = "Q.\(questionData.questionNo)"
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1, forState: UIControlState.Normal)
        answer2Button.setTitle(questionData.answer2, forState: UIControlState.Normal)
        answer3Button.setTitle(questionData.answer3, forState: UIControlState.Normal)
        answer4Button.setTitle(questionData.answer4, forState: UIControlState.Normal)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAnswer1Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 1
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer2Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 2
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer3Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 3
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer4Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 4
        goNextQuestionWithAnimation()
    }
    
    
    
    func goNextQuestionWithAnimation() {
        
        //正誤判定
        if questionData.isCorrect() {
            //正解
            goNextQuestionWithCorrectAnimation()
        } else {
            //不正解
            goNextQuestionWithIncorrectAnimation()
        }
    }
    
    
    //正解時の演出
    func goNextQuestionWithCorrectAnimation() {
        
        //正解音
        AudioServicesPlayAlertSoundWithCompletion(1025, nil)
        
        //アニメーション
        UIView.animateWithDuration(1.0, animations: {() -> Void in
            self.correctImageView.alpha = 1.0
        }) {(Bool) -> Void in
            self.goNextQuestion()
        }
    }
    
    
    //不正解時の演出
    func goNextQuestionWithIncorrectAnimation() {
        
        //不正解音
        AudioServicesPlayAlertSoundWithCompletion(1006, nil)
        
        //アニメーション
        UIView.animateWithDuration(1.0, animations: {() -> Void in
            self.incorrectImageView.alpha = 1.0
        }) {(Bool) -> Void in
            self.goNextQuestion()
        }
    }
    
    
    //次の問題への遷移
    func goNextQuestion() {
        
        //まだ残り問題があれば次の問題へ
        if let nextQuestion = QuestionDataManager.sharedInstance.nextQuestion() {
            
            //次の画面の設定
            if let nextQuestionViewController = storyboard?.instantiateViewControllerWithIdentifier("question") as? QuestionViewController { nextQuestionViewController.questionData = nextQuestion
                
                //画面遷移
                self.presentViewController(nextQuestionViewController, animated: true, completion: nil)
            }
        } else {
            //問題文がなければ結果画面へ
            if let resultViewController = storyboard?.instantiateViewControllerWithIdentifier("result") as? ResultViewController {
                
                //画面遷移
                self.presentViewController(resultViewController, animated: true, completion: nil)
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
