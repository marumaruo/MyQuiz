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
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //問題文の読み込み
        QuestionDataManager.sharedInstance.loadQuestion()
        
        //遷移先画面の取り出し
        if let nextViewController = segue.destinationViewController as? QuestionViewController {
            //問題文の取り出し
            if let questionData = QuestionDataManager.sharedInstance.nextQuestion() {
                //問題文のセット
                nextViewController.questionData = questionData
            }
        }
    }
    
    //タイトルに戻ってきた時の処理
    @IBAction func goToTitle(segue :UIStoryboardSegue){
        
    }

}
