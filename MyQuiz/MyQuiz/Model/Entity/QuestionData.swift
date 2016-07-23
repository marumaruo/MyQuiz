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
    var question: String? = nil

    // 問題タイプ
    var typeNumber: String? = nil
    
    //正解番号
    var correctAnswerNumber: Int? = nil

    //ユーザの選択
    var userChoiceAnswerNumber: Int = 0
    
    //選択肢
    var answer1: String? = nil
    var answer2: String? = nil
    var answer3: String? = nil
    var answer4: String? = nil
    
    //問題数
    var questionNo: Int = 0
    
    //クラス生成時の初期化処理
    init(questionSourceDataArray: [String]) {
        typeNumber = questionSourceDataArray[0]
        
        if let typeNumber = typeNumber
            where typeNumber == "0"
                && questionSourceDataArray.count == 7 {
            if let correctAnswerNumber = Int(questionSourceDataArray[1]) {
                self.correctAnswerNumber = correctAnswerNumber
            } else {
                self.correctAnswerNumber = 0
            }
            question = questionSourceDataArray[2]
            answer1 = questionSourceDataArray[3]
            answer2 = questionSourceDataArray[4]
            answer3 = questionSourceDataArray[5]
            answer4 = questionSourceDataArray[6]
        } else if let typeNumber = typeNumber
            where typeNumber == "1"
                && questionSourceDataArray.count == 3 {
            if let correctAnswerNumber = Int(questionSourceDataArray[1]) {
                self.correctAnswerNumber = correctAnswerNumber
            } else {
                self.correctAnswerNumber = 0
            }
            question = questionSourceDataArray[2]
        } else {
            
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
