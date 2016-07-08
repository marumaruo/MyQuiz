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
        guard let questionViewController = UIStoryboard(name: Main, bundle: nil).instantiateViewControllerWithIdentifier(QuestionViewController.className) as? QuestionViewController else {
            // FIXME:
            print("can not cast QuestionViewController")
            return
        }
        
        // 問題文の取り出し
        if let questionData = QuestionDataManager.sharedInstance.loadQuestion() {
            questionViewController.questionData = questionData
        }
        
        self.navigationController?.pushViewController(questionViewController, animated: true)
    }

    @IBAction func tapSliderButton(sender: AnyObject) {
        let questionViewController = UIStoryboard(name: SliderQuizStoryboard, bundle: nil).instantiateViewControllerWithIdentifier(SliderQuizViewController.className)
        
        self.navigationController?.pushViewController(questionViewController, animated: true)
    }


}
