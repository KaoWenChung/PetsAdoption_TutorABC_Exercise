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
        bright()
        translatesAutoresizingMaskIntoConstraints = false
        mas_makeConstraints { (make) in
            make?.height.equalTo()(PetsAdoption.x(40))
            make?.width.equalTo()(PetsAdoption.x(40))
        }
        layer.cornerRadius = PetsAdoption.x(20)
        layer.borderWidth = PetsAdoption.x(2)
    }

    func toggle(){
        isDisplay.toggle()
        isDisplay ? bright() : dark()
    }

    private func bright() {
        backgroundColor = PetsAdoption.Color.brown
        setTitleColor(PetsAdoption.Color.mainWhite, for: .normal)
        setTitleColor(PetsAdoption.Color.mainWhite.withAlphaComponent(0.5), for: .highlighted)
        layer.borderColor = PetsAdoption.Color.mainWhite.cgColor
    }

    private func dark() {
        backgroundColor = PetsAdoption.Color.darkGray
        setTitleColor(PetsAdoption.Color.lightGray, for: .normal)
        layer.borderColor = PetsAdoption.Color.lightGray.cgColor
    }

    func getDisplayStatus() -> Bool {
        return isDisplay
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(title: PetsAdoption.PetType, font: UIFont) {
        self.init(frame: .zero)
        setTitle(title.rawValue, for: .normal)
        titleLabel?.font = font
        sizeToFit()
    }
}
