//
//  QuestionData.swift
//  MyQuiz
//
//  Created by 荒木 敦 on 2016/07/08.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import Foundation

class QuestionData {
    
    //問題文
    var question: String?
    
    //選択肢
    var answer1: String?
    var answer2: String?
    var answer3: String?
    var answer4: String?
    
    //正解番号
    var correctAnswerNumber: Int?
    
    //ユーザの選択
    var userChoiceAnswerNumber: Int
    
    //問題番号
    var questionNo: Int = 0
    
    //クラス生成時の初期化処理
    init(questionSourceDataArray: [String]) {
        if questionSourceDataArray.count >= 5 {
            question = questionSourceDataArray[0]
            answer1 = questionSourceDataArray[1]
            answer2 = questionSourceDataArray[2]
            answer3 = questionSourceDataArray[3]
            answer4 = questionSourceDataArray[4]
            
            if let correctAnswerNumber = Int(questionSourceDataArray[5]) {
                self.correctAnswerNumber = correctAnswerNumber
            } else {
                self.correctAnswerNumber = 0
            }
            
            userChoiceAnswerNumber = 0
        } else {
            question = nil
            answer1 = nil
            answer2 = nil
            answer3 = nil
            answer4 = nil
            correctAnswerNumber = nil
            userChoiceAnswerNumber = 0
        }
    }
    
    func isCorrect() -> Bool{
        //正誤判定
        if let correctAnswerNumber = correctAnswerNumber
            where correctAnswerNumber == userChoiceAnswerNumber {
            
            //正解
            return true
        }
        
        //不正解
        return false
    }
}
