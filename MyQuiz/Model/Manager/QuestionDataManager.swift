//
//  QuestionDataManager.swift
//  MyQuiz
//
//  Created by bc0067042 on 2016/07/06.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import Foundation

class QuestionDataManager {
    
    //シングルトン宣言
    static let sharedInstance = QuestionDataManager()
    
    //複数問題文を格納する配列の宣言
    var questionDataArray = [QuestionData]()
    
    var questionData: QuestionData?
    
    //現在の問題番号
    var nowQuestionIndex: Int = 0
    
    //外部クラスからインスタンス化されないためのprivate宣言
    private init(){
    }
    
    //CSV読み込み処理
    func loadQuestion() -> QuestionData? {
        
        //格納済問題データの削除
        questionDataArray.removeAll()
        
        //問題番号の初期化
        nowQuestionIndex = 0
        
        //CSVファイルのロード
        if let csvFilePath = NSBundle.mainBundle().pathForResource("question", ofType: "csv") {
            
            do {
                if let csvStringData: String = try String(contentsOfFile: csvFilePath, encoding: NSUTF8StringEncoding) {
                    
                    //csvデータの読み込み
                    csvStringData.enumerateLines({(line, stop) -> () in
                        
                        //カンマで分割
                        let questionSourceDataArray = line.componentsSeparatedByString(",")
                        
                        //問題データを格納するオブジェクトの定義
                        let questionData = QuestionData(questionSourceDataArray: questionSourceDataArray)
                        
                        //問題文を追加
                        self.questionDataArray.append(questionData)
                        
                        //問題番号を設定
                        questionData.questionNo = self.questionDataArray.count
                        
                        self.questionData = questionData
                    })
                    
                    return self.questionData
                    
                } else {
                    return nil
                }
            } catch let error {
                print(error)
                return nil
            }
        } else {
            return nil
        }
    }
    
    //次の問題の取り出し
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex = nowQuestionIndex + 1
            return nextQuestion
        }
        return nil
    }
        
        
}

