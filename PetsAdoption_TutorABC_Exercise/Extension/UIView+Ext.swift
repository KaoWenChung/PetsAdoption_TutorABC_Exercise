//
//  UIView+Ext.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/12/1.
//

import UIKit

extension UIView {
    func setOrigin(x: CGFloat? = nil, midX: CGFloat? = nil, y: CGFloat? = nil, midY: CGFloat? = nil) {
        var newX = x
        var newY = y
        if let midX = midX {
            newX = midX - frame.width / 2
        }
        if let midY = midY {
            newY = midY - frame.height / 2
        }
        if let newX = newX {
            frame.origin.x = round(newX)
        }
        if let newY = newY {
            frame.origin.y = round(newY)
        }
    }

//    var maxSubViewsMaxY: CGFloat {
//        return subviews.map { $0.frame.maxY }.max() ?? 0
//    }
}
