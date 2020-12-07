//
//  PetsDetailView.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/12/7.
//

import UIKit
import SDWebImage

class PetsDetailView: UIView {
    private var petSex = UILabel()
    private var petAge = UILabel()
    private var petImage = UIImageView()
    private var petAddress = UILabel()
    private var petBody = UILabel()
    private var petSterialization = UILabel()
    private var petBacterin = UILabel()
    private var petShelterName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    func initView(by petData: Pet) {
        let picPath = petData.album_file!
        let picURL = URL(string: picPath)

        let transformer = SDImageResizingTransformer(size: CGSize(width: 300, height: 300), scaleMode: .aspectFill)
        
        petImage.sd_setImage(with: picURL, placeholderImage: UIImage(named: "LoadingImage"), options: [], context: [.imageTransformer: transformer])
        addSubview(petImage)

        petSex = UILabel(text: String(format: "性別: %@", petData.animal_sex ?? "未知") , color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petSex)

        let ageText:String = {
            switch petData.animal_age {
            case "ADULT":
                return "成年"
            case "CHILD":
                return "幼年"
            default:
                return "未填"
            }
        }()
        petAge = UILabel(text: String(format: "年齡: %@", ageText), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petAge)

        let bodyText:String = {
            switch petData.animal_bodytype {
            case "BIG":
                return "大"
            case "MEDIUM":
                return "中"
            case "SMALL":
                return "小"
            default:
                return "未填"
            }
        }()
        petBody = UILabel(text: String(format: "體型: %@", bodyText), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petBody)

        let sterializationText:String = {
            switch petData.animal_sterilization {
            case "F":
                return "末"
            case "T":
                return "已"
            default:
                return "未填"
            }
        }()
        petSterialization = UILabel(text: String(format: "絕育: %@", sterializationText), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petSterialization)

        let bacterinText:String = {
            switch petData.animal_bacterin {
            case "F":
                return "末"
            case "T":
                return "已"
            default:
                return "未填"
            }
        }()
        petBacterin = UILabel(text: String(format: "狂犬疫苗: %@", bacterinText), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petBacterin)

        petShelterName = UILabel(text: String(format: "收容所: %@", petData.animal_place ?? "未知"), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petShelterName)

        petAddress = UILabel(text: String(format: "所在地: %@", petData.shelter_address ?? "未知"), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        petAddress.numberOfLines = 0
        addSubview(petAddress)
        setupUI()
    }

    private func setupUI() {
        petImage.mas_makeConstraints { (make) in
            /*
            if #available(iOS 11.0, *) {
                make?.top.equalTo()(mas_safeAreaLayoutGuideTop)?.with()?.offset()(PetsAdoption.x(0))
            } else {
                make?.top.equalTo()(0)
            }
             */

            make?.top.equalTo()(0)
            make?.left.equalTo()(0)
            make?.right.equalTo()(0)
            make?.height.equalTo()(mas_width)
        }

        //Stack View
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing = 0.0
//        stackView.sizeToFit()

        stackView.addArrangedSubview(petSex)
        stackView.addArrangedSubview(petAge)
        stackView.addArrangedSubview(petBody)
        stackView.addArrangedSubview(petSterialization)
        stackView.addArrangedSubview(petBacterin)
        stackView.addArrangedSubview(petShelterName)
        stackView.addArrangedSubview(petAddress)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        stackView.mas_makeConstraints { (make) in
            make?.top.equalTo()(petImage.mas_bottom)?.with()?.offset()(PetsAdoption.x(0))
            make?.left.equalTo()(PetsAdoption.x(5))
            make?.right.equalTo()(PetsAdoption.x(5))
            make?.bottom.equalTo()(PetsAdoption.x(0))
        }
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("PetsDetailView has been deinit")
    }
}
