//
//  NSObjectExtension.swift
//  MyQuiz
//
//  Created by 荒木 敦 on 2016/07/08.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(self)
    }
    
    var className: String {
        return self.dynamicType.className
    }
}
