//
//  AgeLabel.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/12/5.
//

import UIKit

class AgeLabel: UILabel {
    func initLabel(by age: String) {
        font = PetsAdoption.Font.h2.regular
        switch age {
        case "CHILD":
            text = "CHILD"

        case "ADULT":
            text = "ADULT"

        default:
            text = "VAGUE"
        }
    }
}
