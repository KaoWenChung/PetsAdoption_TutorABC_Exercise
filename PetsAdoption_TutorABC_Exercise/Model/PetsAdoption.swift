//
//  PetsAdoption.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/29.
//

import UIKit

class PetsAdoption {
    private init() {}

    static let main = PetsAdoption()

    // UI
    private static let baseW: CGFloat = 375
    private static let baseH: CGFloat = 667
    private static let iPhoneX: Bool = {
        if #available(iOS 11.0, *) {
            // For iPhone X series
            return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0 > 0
        }
        return false
    }()

    private static let iPhoneSE: Bool = {
        w == 320
    }()

    static let w = UIScreen.main.bounds.width
    static let h = UIScreen.main.bounds.height

    static func x(_ len: CGFloat, x: CGFloat? = nil, s: CGFloat? = nil) -> CGFloat {
        if let lx = x, iPhoneX {
            return w * lx / baseW
        }
        if let ls = s, iPhoneSE {
            return ls
        }
        return w * len / baseW
    }

    // UIColor
    enum Color {
        static let mainBlue = UIColor(rgb: 0x12b3d9)
        static let mainDark = UIColor(rgb: 0x373E52)
    }

    // UIFont
    enum Font: CGFloat {
        case h1 = 28
        case h2 = 16

        var regular: UIFont {
            return UIFont(name: "PingFangTC-Regular", size: rawValue)!
        }
    }
}
