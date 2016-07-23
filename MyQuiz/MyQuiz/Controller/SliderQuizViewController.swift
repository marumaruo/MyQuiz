//
//  SliderQuizViewController.swift
//  MyQuiz
//
//  Created by 荒木 敦 on 2016/07/08.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import UIKit
import AudioToolbox

class SliderQuizViewController: UIViewController {

    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!

    @IBOutlet weak var correctImageView: UIImageView!
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        minLabel.text = "0.0"
        maxLabel.text = "100.0"
        sliderLabel.text = "50.0"
        
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0

        
        slider.addTarget(self, action: #selector(self.changeSlider), forControlEvents: UIControlEvents.ValueChanged)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeSlider(slider: UISlider) {
        sliderLabel.text = String(Int(slider.value))
        print("slider = \(slider)")
        
    }
    
    @IBAction func tapAnswerButton(sender: AnyObject) {
        if Int(slider.value) == 75 {
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
//            self.goNextQuestion()
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
//            self.goNextQuestion()
        }
    }

}
