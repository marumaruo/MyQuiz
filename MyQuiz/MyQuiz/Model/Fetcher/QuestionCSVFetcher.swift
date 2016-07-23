//
//  QuestionCSVFetcher.swift
//  MyQuiz
//
//  Created by 荒木 敦 on 2016/07/23.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import UIKit

class QuestionCSVFetcher: NSObject {
    
    //シングルトン宣言
    static let sharedInstance = QuestionCSVFetcher()
    
    //CSV読み込み処理
    func getQuestionEntityArray() -> [QuestionEntity]? {
        
        //CSVファイルのロード
        if let csvFilePath = NSBundle.mainBundle().pathForResource("question", ofType: "csv") {
            
            do {
                var questionEntityArray = [QuestionEntity]()
                
                if let csvString: String = try String(contentsOfFile: csvFilePath, encoding: NSUTF8StringEncoding) {
                    
                    // 一行ずつcsvデータの読み込み
                    csvString.enumerateLines({
                        (line, stop) -> () in
                        // カンマで分割
                        let dataArray = line.componentsSeparatedByString(",")
                        
                        let questionEntity = QuestionEntity()
                        
                        for (index, data) in dataArray.enumerate() {
                            if index == 0 {
                                questionEntity.type = data
                            } else if index == 1 {
                                questionEntity.answer = data
                            } else if index == 2 {
                                questionEntity.question = data
                            } else {
                                questionEntity.choiceArray.append(data)
                            }
                        }
                        
                        questionEntityArray.append(questionEntity)
                    })
                    
                    return questionEntityArray
                } else {
                    // question.csvが読み込めなかった時
                    return nil
                }
            } catch let error {
                print(error)
                return nil
            }
        } else {
            // question.csvが読み込めなかった時
            return nil
        }
    }
}
