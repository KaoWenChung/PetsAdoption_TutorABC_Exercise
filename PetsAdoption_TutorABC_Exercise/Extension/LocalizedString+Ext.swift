//
//  LocalizedString+Ext.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/12/8.
//

import UIKit

protocol LocalText { // 多國語系文字取得協議
    var prefix: String { get }
    var text: String { get }
}

extension LocalText {
    var text: String {
        return NSLocalizedString(prefix + "." + String(describing: self), comment: "")
    }
}

