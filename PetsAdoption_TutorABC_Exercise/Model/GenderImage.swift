//
//  SexLabel.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/12/4.
//

import UIKit

class GenderImage: UIImageView {
    func initLabel(by sex: String) {
        let size = CGSize(width: PetsAdoption.x(36), height: PetsAdoption.x(36))

        switch sex {
        case "M":
            guard let genderImage = UIImage(named: "Boy") else { return }
            image = genderImage.resizeImage(targetSize: size)
            layer.backgroundColor = PetsAdoption.Color.mainBlue.cgColor

        case "F":
            guard let genderImage = UIImage(named: "Girl") else { return }
            image = genderImage.resizeImage(targetSize: size)
            layer.backgroundColor = PetsAdoption.Color.red.cgColor

        case "N":
            guard let genderImage = UIImage(named: "Transgender") else { return }
            image = genderImage.resizeImage(targetSize: size)
            layer.backgroundColor = PetsAdoption.Color.mainYellow.cgColor

        default:
        break
        }
        layer.cornerRadius = PetsAdoption.x(18)

        layer.borderWidth = PetsAdoption.x(2)
        layer.borderColor = PetsAdoption.Color.mainWhite.cgColor
    }
}
