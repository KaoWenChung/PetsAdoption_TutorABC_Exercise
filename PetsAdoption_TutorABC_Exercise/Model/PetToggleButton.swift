//
//  DogCatToggle.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/12/6.
//

import UIKit

class PetToggleButton: UIButton {
    private var isDisplay: Bool = true

    override init(frame: CGRect) {
        super.init(frame: frame)
        isExclusiveTouch = true
        backgroundColor = .brown
        translatesAutoresizingMaskIntoConstraints = false
        mas_makeConstraints { (make) in
            make?.height.equalTo()(PetsAdoption.x(40))
            make?.width.equalTo()(PetsAdoption.x(40))
        }
        layer.cornerRadius = PetsAdoption.x(20)

        layer.borderWidth = PetsAdoption.x(2)
        layer.borderColor = PetsAdoption.Color.mainWhite.cgColor
    }

    func toggle(){
        isDisplay.toggle()
        isDisplay ? (backgroundColor = UIColor.brown) : (backgroundColor = UIColor.darkGray)
    }

    func getDisplayStatus() -> Bool {
        return isDisplay
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(title: PetsAdoption.PetType, color: UIColor, font: UIFont) {
        self.init(frame: .zero)
        setTitle(title.rawValue, for: .normal)
        setTitleColor(color, for: .normal)
        setTitleColor(color.withAlphaComponent(0.5), for: .highlighted)
        titleLabel?.font = font
        sizeToFit()
    }
}
