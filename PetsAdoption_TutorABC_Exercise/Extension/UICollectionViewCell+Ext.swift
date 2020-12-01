//
//  UICollectionView+Ext.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/29.
//

import UIKit

extension UICollectionViewCell {
    static var reuseId: String {
        return String(describing: self)
    }
}
