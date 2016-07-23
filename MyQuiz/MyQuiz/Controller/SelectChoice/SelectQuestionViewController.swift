//
//  SelectQuestionViewController.swift
//  MyQuiz
//
//  Created by 荒木 敦 on 2016/07/23.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import UIKit

class SelectQuestionViewController: UIViewController {

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

        // Do any additional setup after loading the view.

        // QuestionTableViewCell.xibを登録
        self.tableView.registerNib(
            UINib(nibName: QuestionTableViewCell.className, bundle : nil),
            forCellReuseIdentifier: QuestionTableViewCell.className)
        
        // ChoiceTableViewCell.xibを登録
        self.tableView.registerNib(
            UINib(nibName: ChoiceTableViewCell.className, bundle : nil),
            forCellReuseIdentifier: ChoiceTableViewCell.className)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.viewWillAppear(animated)

        if questionEntityArray.count > currentQuestionIndex  {
            
        } else {
            let alertController = UIAlertController(
                title: "終了",
                message: "すべての問題を解きました",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            let alertAction = UIAlertAction(title: "了解", style: UIAlertActionStyle.Default, handler: { (alertAction:UIAlertAction) in
                
            })
            
            alertController.addAction(alertAction)
            
            self.presentViewController(
                alertController,
                animated: true,
                completion: {
                
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SelectQuestionViewController: UITableViewDataSource {
    // tableViewで表示する行の数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCellArray.count
    }
    
    // tableViewの各行のセルの表示
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier(QuestionTableViewCell.className)
        
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

extension SelectQuestionViewController: UITableViewDelegate {
    // tableViewで選択したセル
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}