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
    
//    var questionData :QuestionData?
    
    var questionEntityArray = [QuestionEntity]()
    var currentQuestionIndex: Int = 0
    
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
        

        
//        if let questionData = questionData {
//            //初期データ設定
//            questionNoLabel.text = "Q.\(questionData.questionNo)"
//            if let question = questionData.question {
//                questionTextView.text = question
//            }
//            
//            if let answer1 = questionData.answer1 {
//                answer1Button.setTitle(answer1, forState: UIControlState.Normal)
//            }
//            
//            if let answer2 = questionData.answer2 {
//            answer2Button.setTitle(answer2, forState: UIControlState.Normal)
//            }
//            
//            if let answer3 = questionData.answer3 {
//            answer3Button.setTitle(answer3, forState: UIControlState.Normal)
//            }
//            
//            if let answer4 = questionData.answer4 {
//            answer4Button.setTitle(answer4, forState: UIControlState.Normal)
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAnswer1Button(sender: AnyObject) {
//        if let questionData = questionData {
//            questionData.userChoiceAnswerNumber = 1
//        }
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer2Button(sender: AnyObject) {
//        if let questionData = questionData {
//            questionData.userChoiceAnswerNumber = 2
//        }
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer3Button(sender: AnyObject) {
//        if let questionData = questionData {
//            questionData.userChoiceAnswerNumber = 3
//        }
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer4Button(sender: AnyObject) {
//        if let questionData = questionData {
//            questionData.userChoiceAnswerNumber = 4
//        }
        goNextQuestionWithAnimation()
    }
    
    
    
    func goNextQuestionWithAnimation() {
        
//        //正誤判定
//        if let questionData = questionData where questionData.isCorrect() {
//            //正解
//            goNextQuestionWithCorrectAnimation()
//        } else {
//            //不正解
//            goNextQuestionWithIncorrectAnimation()
//        }
    }
    
//    
//    //正解時の演出
//    func goNextQuestionWithCorrectAnimation() {
//        
//        //正解音
//        AudioServicesPlayAlertSoundWithCompletion(1025, nil)
//        
//        //アニメーション
//        UIView.animateWithDuration(1.0, animations: {() -> Void in
//            self.correctImageView.alpha = 1.0
//        }) {(Bool) -> Void in
//            self.goNextQuestion()
//        }
//    }
//    
//    
//    //不正解時の演出
//    func goNextQuestionWithIncorrectAnimation() {
//        
//        //不正解音
//        AudioServicesPlayAlertSoundWithCompletion(1006, nil)
//        
//        //アニメーション
//        UIView.animateWithDuration(1.0, animations: {() -> Void in
//            self.incorrectImageView.alpha = 1.0
//        }) {(Bool) -> Void in
//            self.goNextQuestion()
//        }
//    }
//    
//    
//    //次の問題への遷移
//    func goNextQuestion() {
//        
//        //まだ残り問題があれば次の問題へ
//        if let nextQuestion = QuestionDataManager.sharedInstance.nextQuestion("0"),
//            nextQuestionViewController = storyboard?.instantiateViewControllerWithIdentifier(QuestionViewController.className) as? QuestionViewController {
//            
//            nextQuestionViewController.questionData = nextQuestion
//            //次の画面の設定
//            //画面遷移
//            self.navigationController?.pushViewController(nextQuestionViewController, animated: true)
//
//        } else {
//            //問題文がなければ結果画面へ
//            if let resultViewController = storyboard?.instantiateViewControllerWithIdentifier(ResultViewController.className) as? ResultViewController {
//                
//                //画面遷移
////                self.presentViewController(resultViewController, animated: true, completion: nil)
//                self.navigationController?.pushViewController(resultViewController, animated: true)
//            }
//        }
//    }

    
}
