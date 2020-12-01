//
//  PetsCollectionViewCell.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/29.
//

import UIKit

class PetsCollectionViewCell: UICollectionViewCell {
    private static let pad = PetsAdoption.x(20)

    private var petSex: UILabel!
    private var petAge: UILabel!
    private var petImage: UIImageView!
    private var petAddress: UILabel!

    func initCell(by petData: Pet?) {
        // petSex???
        if petSex == nil {
            backgroundColor = .clear
            layer.cornerRadius = bounds.height / 2
            layer.borderColor = PetsAdoption.Color.mainBlue.cgColor
            layer.borderWidth = 1
        }
        petSex.text = petData?.sex
        petAge.text = petData?.age
        petImage = UIImageView()
        petAddress.text = petData?.address
    }

    private static func getLabel(_ text: String?) -> UILabel {
        return UILabel(text: text, color: PetsAdoption.Color.mainBlue, font: PetsAdoption.Font.h1.regular)
    }

    static func getWidth() -> CGFloat {
        return PetsAdoption.x(107)
    }

    static func getHeight(_ text: String?) -> CGFloat {
        return min(max(pad + getLabel(text).bounds.width, getWidth()), PetsAdoption.w - PetsAdoption.x(40))
    }
}
