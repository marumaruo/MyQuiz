//
//  QuestionEntity.swift
//  MyQuiz
//
//  Created by 荒木 敦 on 2016/07/23.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import Foundation

class QuestionEntity {
    // 問題タイプ
    var type: String?
    
    // 正解
    var answer: String?
    
    //問題文
    var question: String?
    
    //選択肢
    var choiceArray = [String]()
}