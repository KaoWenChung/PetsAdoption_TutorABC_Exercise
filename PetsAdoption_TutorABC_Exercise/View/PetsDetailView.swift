//
//  PetsDetailView.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/12/7.
//
/*
 A.      album_file：底圖

 B.      animal_sex：性別，F/M

 C.      animal_ag：年齡，成年/幼年/未填

 D.     animal_bodytype：體型，大/中/小/未填

 E.      animal_sterilization：是否絕育，F:末 T：已

 F.       animal_bacterin：狂犬疫苗，F:末 T：已

 G.     shelter_name：收容所

 H.     animal_place：所在地

  
 */
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

        petAge = UILabel(text: String(format: "年齡: %@", petData.animal_age ?? "未知"), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petAge)

        petBody = UILabel(text: String(format: "體型: %@", petData.animal_bodytype ?? "未知"), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petBody)

        petSterialization = UILabel(text: String(format: "絕育: %@", petData.animal_sterilization ?? "未知"), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petSterialization)

        petBacterin = UILabel(text: String(format: "狂犬疫苗: %@", petData.animal_bacterin ?? "未知"), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petBacterin)

        petShelterName = UILabel(text: String(format: "收容所: %@", petData.animal_place ?? "未知"), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        addSubview(petShelterName)

        petAddress = UILabel(text: String(format: "所在地: %@", petData.shelter_address ?? "未知"), color: PetsAdoption.Color.mainDark, font: PetsAdoption.Font.h2.regular, align: .left)
        petAddress.numberOfLines = 2
        addSubview(petAddress)
        setupUI()
    }

    private func setupUI() {
        petImage.mas_makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make?.top.equalTo()(mas_safeAreaLayoutGuideTop)?.with()?.offset()(PetsAdoption.x(0))
            } else {
                make?.top.equalTo()(0)
            }

            make?.left.equalTo()(0)
            make?.right.equalTo()(0)
            make?.height.equalTo()(mas_width)
        }

        //Stack View
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing = 2.0

        stackView.addArrangedSubview(petSex)
        stackView.addArrangedSubview(petAge)
        stackView.addArrangedSubview(petBody)
        stackView.addArrangedSubview(petSterialization)
        stackView.addArrangedSubview(petShelterName)
        stackView.addArrangedSubview(petBacterin)
        stackView.addArrangedSubview(petAddress)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        stackView.mas_makeConstraints { (make) in
            make?.top.equalTo()(petImage.mas_bottom)?.with()?.offset()(PetsAdoption.x(0))
            make?.centerX.equalTo()
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
