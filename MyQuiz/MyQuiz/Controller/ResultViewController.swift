//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by bc0067042 on 2016/07/07.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var correctPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //問題数の取得
        let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
        
        //正解数の取得
        var correctCount :Int = 0
        
        for questionData in QuestionDataManager.sharedInstance.questionDataArray {
            if questionData.isCorrect(){
                correctCount = correctCount + 1
            }
        }
        
        //正解率の計算
        let correctPercent :Float = (Float(correctCount)/Float(questionCount)) * 100
        
        //四捨五入
        correctPercentLabel.text = String(format: "%.1f", correctPercent) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapBackTitileButton(sender: AnyObject) {
        if let navigationController = self.navigationController where navigationController.viewControllers.count >= 2 {
//        self.navigationController?.popToViewController(navigationController.viewControllers[1], animated: true)
            self.navigationController?.popToRootViewControllerAnimated(true)
        } else {
            // FIXME:
            print("戻れませんでした")
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
