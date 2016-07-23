//
//  StartViewController.swift
//  MyQuiz
//
//  Created by bc0067042 on 2016/07/07.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapStartButton(sender: AnyObject) {
        guard let selectChoiceViewController = UIStoryboard(name: SelectChoiceStoryboard, bundle: nil).instantiateInitialViewController() as? SelectChoiceViewController else {
            // FIXME:
            print("can not cast QuestionViewController")
            return
        }
        
        guard var questionEntityArray = QuestionCSVFetcher.sharedInstance.getQuestionEntityArray() else {
            // 問題を
            return
        }
        
        questionEntityArray = questionEntityArray.filter { (questionEntity: QuestionEntity) -> Bool in
            if let type = questionEntity.type where type == "0" {
                // 四択のものだけに絞る
                return true
            } else {
                // それ以外は捨てる
                return false
            }
        }
        
        if questionEntityArray.count > 0 {
            selectChoiceViewController.questionEntityArray = questionEntityArray
            
            selectChoiceViewController.currentQuestionIndex = 0
            
            self.navigationController?.pushViewController(selectChoiceViewController, animated: true)
//            UIApplication.sharedApplication().keyWindow?.rootViewController = selectChoiceViewController
        } else {
            let alertController = UIAlertController(
                title: "エラー",
                message: "問題を取得できませんでした。",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            let alertAction = UIAlertAction(title: "了解", style: UIAlertActionStyle.Default, handler: { (alertAction:UIAlertAction) in
                
            })
            
            alertController.addAction(alertAction)
            
            self.presentViewController(
                alertController,
                animated: true,
                completion: {
                
            })
        }
    }

    @IBAction func tapSliderButton(sender: AnyObject) {
        let questionViewController = UIStoryboard(name: SliderQuizStoryboard, bundle: nil).instantiateViewControllerWithIdentifier(SliderQuizViewController.className)
        
        self.navigationController?.pushViewController(questionViewController, animated: true)
    }


}
