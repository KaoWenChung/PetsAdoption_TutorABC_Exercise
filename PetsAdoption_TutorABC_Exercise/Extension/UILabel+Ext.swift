//
//  UILabel+Ext.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/30.
//

import UIKit

extension UILabel {
    convenience init(text: String?, color: UIColor = PetsAdoption.Color.mainDark, font: UIFont = PetsAdoption.Font.h2.regular, align: NSTextAlignment = .center) {
        self.init()
        self.text = text
        self.font = font
        textColor = color
        textAlignment = align
        numberOfLines = 0
        sizeToFit()
    }
}
