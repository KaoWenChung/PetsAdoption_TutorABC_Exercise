//
//  SexLabel.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/12/4.
//

import UIKit

class GenderImage: UIImageView {
//    let background = UIView()

    func initLabel(by sex: String) {

        switch sex {
        case "M":
            text = "Boy"
            
//            backgroundColor = .blue
            layer.cornerRadius = 25.0
            layer.backgroundColor = UIColor.blue.cgColor
            
//            background.backgroundColor = .blue
            print()
        case "F":
            text = "Girl"
            backgroundColor = .red
//            background.backgroundColor = .red
            print()
        case "N":
            text = ""
        default:
        break
        }
        textColor = PetsAdoption.Color.mainBlue
        font = PetsAdoption.Font.h2.regular
        textAlignment = .center
//        addSubview(background)
        
    }

//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
}
