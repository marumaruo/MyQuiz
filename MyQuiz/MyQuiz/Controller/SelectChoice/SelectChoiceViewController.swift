//
//  SelectChoiceViewController.swift
//  MyQuiz
//
//  Created by 荒木 敦 on 2016/07/23.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import UIKit

class SelectChoiceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // 問題の配列
    var questionEntityArray = [QuestionEntity]()
    // 現在の配列の要素
    var currentQuestionIndex: Int = 0
    
    // 選択肢が有限の場合
    var tableViewCellArray = [UITableViewCell]()
    
    // 選択肢が無限の場合
    //    var reuseIdentifierArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The object that acts as the delegate of the table view.
        // The delegate must adopt the UITableViewDelegate protocol. The delegate is not retained.
        tableView.delegate = self
        
        // The object that acts as the data source of the table view.
        // The data source must adopt the UITableViewDataSource protocol. The data source is not retained.
        tableView.dataSource = self
        
        // QuestionTableViewCell.xibを登録
        tableView.registerNib(
            UINib(nibName: QuestionTableViewCell.className, bundle : nil),
            forCellReuseIdentifier: QuestionTableViewCell.className)
        
        // ChoiceTableViewCell.xibを登録
        tableView.registerNib(
            UINib(nibName: ChoiceTableViewCell.className, bundle : nil),
            forCellReuseIdentifier: ChoiceTableViewCell.className)
    
        // 推定された行の高さ
        tableView.estimatedRowHeight = CGFloat(80)
        // talbeView自動寸法
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.loadQuestion()
    }
    
    func loadQuestion() {
        if questionEntityArray.count > currentQuestionIndex  {
            let questionEntity = questionEntityArray[currentQuestionIndex]
            
            if let question = questionEntity.question,
                questionTableViewCell = tableView.dequeueReusableCellWithIdentifier(QuestionTableViewCell.className) as? QuestionTableViewCell {
                
                questionTableViewCell.questionLabel.text = question
                
                tableViewCellArray.append(questionTableViewCell)
            }
            
            if questionEntity.choiceArray.count > 0 {
                questionEntity.choiceArray.forEach({ (choiceString:String) in
                    if let choiceTableViewCell = tableView.dequeueReusableCellWithIdentifier(ChoiceTableViewCell.className) as? ChoiceTableViewCell {
                        choiceTableViewCell.choiceLabel.text = choiceString
                        choiceTableViewCell.answer = questionEntity.answer
                        tableViewCellArray.append(choiceTableViewCell)
                    }
                })
                
                tableView.reloadData()
            } else {
                // 選択肢がありません
                let alertController = UIAlertController(title: "エラー", message: "選択肢がありません", preferredStyle: UIAlertControllerStyle.Alert)
                
                let alertAction = UIAlertAction(title: "了解", style: UIAlertActionStyle.Default, handler: { (alertAction:UIAlertAction) in
                    self.currentQuestionIndex = 0
                    
                    self.dismissViewControllerAnimated(true, completion: {
                        
                    })
                })
                
                alertController.addAction(alertAction)
                
                self.presentViewController(alertController, animated: true, completion: {
                    
                })
            }
        } else {
            let alertController = UIAlertController(
                title: "終了",
                message: "すべての問題を解きました",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            let alertAction = UIAlertAction(title: "了解", style: UIAlertActionStyle.Default, handler: { (alertAction:UIAlertAction) in
                
                self.currentQuestionIndex = 0
                
                self.navigationController?.popToRootViewControllerAnimated(true)
            })
            
            alertController.addAction(alertAction)
            
            self.presentViewController(
                alertController,
                animated: true,
                completion: {
                    
            })
        }
    }

}

extension SelectChoiceViewController: UITableViewDataSource {
    // tableViewで表示する行の数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCellArray.count
    }
    
    // tableViewの各行のセルの表示
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tableViewCell = tableViewCellArray[indexPath.row]
        
        if let questionTableViewCell = tableViewCell as? QuestionTableViewCell {
            return questionTableViewCell
        } else if let choiceTableViewCell = tableViewCell as? ChoiceTableViewCell {
            return choiceTableViewCell
        } else {
            let tableViewCell = UITableViewCell()
            tableViewCell.backgroundColor = UIColor.clearColor()
            return tableViewCell
        }
    }
}

extension SelectChoiceViewController: UITableViewDelegate {
    // tableViewで選択したセル
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row >= 1 {
            if let choiceTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as? ChoiceTableViewCell,
                answer = choiceTableViewCell.answer
                where choiceTableViewCell.choiceLabel.text == choiceTableViewCell.answer {
                
                let alertController = UIAlertController(title: "正解", message: "正解 = \(answer)", preferredStyle: UIAlertControllerStyle.Alert)
                
                let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (alertAction:UIAlertAction) in
                    
                    self.tableViewCellArray = [UITableViewCell]()
                    
                    self.currentQuestionIndex = self.currentQuestionIndex + 1
                    self.loadQuestion()
                })
                
                alertController.addAction(alertAction)
                presentViewController(alertController, animated: true, completion: {
                    
                })
            } else if let choiceTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as? ChoiceTableViewCell,
                answer = choiceTableViewCell.answer {
                let alertController = UIAlertController(title: "不正解", message: "不正解は \(answer)", preferredStyle: UIAlertControllerStyle.Alert)
                
                let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (alertAction:UIAlertAction) in
                    
                    self.tableViewCellArray = [UITableViewCell]()
                    
                    self.currentQuestionIndex = self.currentQuestionIndex + 1
                    self.loadQuestion()
                })
                
                alertController.addAction(alertAction)
                presentViewController(alertController, animated: true, completion: {
                    
                })
            }
        }
    }
}