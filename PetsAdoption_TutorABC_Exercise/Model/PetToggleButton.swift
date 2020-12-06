//
//  DogCatToggle.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/12/6.
//

import UIKit

class PetToggleButton: UIButton {
    private var isDisplay: Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        isExclusiveTouch = true
    }

    func toggle(){
        isDisplay.toggle()
        isDisplay ? (backgroundColor = UIColor.yellow) : (backgroundColor = UIColor.blue)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(title: String, color: UIColor, font: UIFont) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        setTitleColor(color.withAlphaComponent(0.5), for: .highlighted)
        titleLabel?.font = font
        sizeToFit()
    }
}
