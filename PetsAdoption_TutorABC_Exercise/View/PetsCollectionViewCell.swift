//
//  PetsCollectionViewCell.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/29.
//

import UIKit
import SDWebImage

class PetsCollectionViewCell: UICollectionViewCell {
    private var petSex = GenderImage()
    private var petAge = AgeLabel()
    private var petImage = UIImageView()
    private var petAddress = UILabel()
    private var underLine = UIView()

    func initCell(by petData: Pet?) {
        guard let petData = petData else { return }
        let picPath = petData.album_file!
        let picURL = URL(string: picPath)

        let transformer = SDImageResizingTransformer(size: CGSize(width: 300, height: 300), scaleMode: .aspectFill)
        
        petImage.sd_setImage(with: picURL, placeholderImage: UIImage(named: "LoadingImage"), options: [], context: [.imageTransformer: transformer])
        contentView.addSubview(petImage)
        
        petSex.initLabel(by: petData.animal_sex ?? "")
        contentView.addSubview(petSex)

        petAge.initLabel(by: petData.animal_age ?? "")
        contentView.addSubview(petAge)
        contentView.addSubview(underLine)

        petAddress.text = petData.shelter_address
        petAddress.font = PetsAdoption.Font.h3.regular
        petAddress.numberOfLines = 2
        contentView.addSubview(petAddress)

        setupUI()
    }

    override func prepareForReuse() {
        petImage.sd_cancelCurrentImageLoad()
        petImage.image = nil
    }

    private func setupUI() {
        underLine.backgroundColor = PetsAdoption.Color.mainDark
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 25.0
        contentView.layer.backgroundColor = PetsAdoption.Color.mainWhite.cgColor
        
        layer.shadowRadius = PetsAdoption.x(10)
        layer.shadowColor = PetsAdoption.Color.mainDark.cgColor
        layer.shadowOpacity = 0.5
        
        contentView.layer.borderWidth = PetsAdoption.x(2)
        contentView.layer.borderColor = PetsAdoption.Color.mainWhite.cgColor

        petSex.mas_makeConstraints { (make) in
            make?.left.equalTo()(PetsAdoption.x(15))
            make?.bottom.equalTo()(PetsAdoption.x(-45))
        }

        petImage.mas_makeConstraints { (make) in
            make?.top.equalTo()(0)
            make?.left.equalTo()(0)
            make?.right.equalTo()(0)
            make?.bottom.equalTo()(PetsAdoption.x(-65))
        }

        petAge.mas_makeConstraints { (make) in
            make?.left.equalTo()(PetsAdoption.x(75))
            make?.bottom.equalTo()(PetsAdoption.x(-45))
        }

        underLine.mas_makeConstraints { (make) in
            make?.left.equalTo()(PetsAdoption.x(75))
            make?.height.equalTo()(1)
            make?.width.equalTo()(PetsAdoption.x(100))
            make?.bottom.equalTo()(PetsAdoption.x(-48))
        }

        petAddress.mas_makeConstraints { (make) in
            make?.left.equalTo()(PetsAdoption.x(15))
            make?.right.equalTo()(PetsAdoption.x(-15))
            make?.top.equalTo()(PetsAdoption.x(185))
        }
    }

    private static func handleImage(_ url: String?) -> UILabel {
        return UILabel(text: url, color: PetsAdoption.Color.mainBlue, font: PetsAdoption.Font.h1.regular)
    }

    static func getWidth() -> CGFloat {
        return PetsAdoption.x(165)
    }

    static func getHeight() -> CGFloat {
        return PetsAdoption.x(230)
    }
}
