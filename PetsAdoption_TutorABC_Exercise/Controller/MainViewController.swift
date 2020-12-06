//
//  MainViewController.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/27.
//

import UIKit
import SDWebImage
import AFNetworking

class MainViewController: UIViewController {

    private var collectionView: UICollectionView!
    private var pets = [Pet]()
    private let dogToggleButton = PetToggleButton()
    private let catToggleButton = PetToggleButton(title: "CAT", color: .yellow, font: PetsAdoption.Font.h3.regular)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pets Adoption"

        getJSON()
        let pad = PetsAdoption.x(20)
        let insets = UIEdgeInsets(top: pad * 1.5, left: pad, bottom: pad, right: pad)
        let layout = PetsCollectionViewLayout(lineSpacing: PetsAdoption.x(8), columnSpacing: PetsAdoption.x(4), sectionInsets: insets)

        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout: layout)
        layout.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PetsCollectionViewCell.self, forCellWithReuseIdentifier: PetsCollectionViewCell.reuseId)
        collectionView.backgroundColor = .lightGray

        
//        view.addSubview(collectionView)
        setUpToggleButton()
    }

    private func setUpToggleButton() {
        dogToggleButton.titleLabel?.text = "Dog"
        catToggleButton.titleLabel?.text = "Cat"
        
        let petToggleButtons = UIStackView(arrangedSubviews: [dogToggleButton, catToggleButton])
        let petToggleButtonsWidth = dogToggleButton.bounds.width + catToggleButton.bounds.width
        petToggleButtons.frame.size = CGSize(width: petToggleButtonsWidth, height: dogToggleButton.bounds.height)
        petToggleButtons.setOrigin(x: 0, midX: 0, y: 0, midY: 0)
        petToggleButtons.axis = .horizontal
        petToggleButtons.distribution = .fillEqually
        petToggleButtons.alignment = .fill
        petToggleButtons.spacing = 0

        dogToggleButton.mas_makeConstraints { (make) in
            make?.height.equalTo()(20)
            make?.width.equalTo()(PetsAdoption.x(100))
        }

        catToggleButton.mas_makeConstraints { (make) in
            make?.top.equalTo()(0)
            make?.left.equalTo()(0)
            make?.height.equalTo()(20)
            make?.width.equalTo()(PetsAdoption.x(100))
        }

//        petToggleButtons.mas_makeConstraints { (make) in
//            make?.top.equalTo()(0)
//            make?.left.equalTo()(0)
//            make?.right.equalTo()(0)
//            make?.bottom.equalTo()(PetsAdoption.x(-65))
//        }


        view.addSubview(catToggleButton)
    }

    func getJSON() {
        let url = "https://quality.data.gov.tw/dq_download_json.php?nid=85903&md5_url=c37f10282e2229a6459d7d85e601c38e"
        let manager = AFHTTPSessionManager()
        manager.get(
            url,
            parameters: nil,
            headers: nil,
            progress: nil,
            success: { (_, jsonData) in
                let petArray = NSArray.yy_modelArray(with: Pet.self, json: jsonData ?? []) as! [Pet]
                Pet.savePetsModel(petArray: petArray)
                self.pets = Pet.getPetsModelFromDie()
//                print("🐶🐱", self.pets)

                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            },
            failure: { (_, error) in
                 print("Error: " + error.localizedDescription)
            })
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetsCollectionViewCell.reuseId, for: indexPath) as! PetsCollectionViewCell
//        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.orange : UIColor.brown
        cell.initCell(by: pets[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
}

extension MainViewController: PetsCollectionViewDelegate {
    func heightForRows(_ layout: PetsCollectionViewLayout) -> CGFloat {
        return PetsCollectionViewCell.getHeight()
    }
    
    func widthForItems(_ layout: PetsCollectionViewLayout) -> CGFloat {
        return PetsCollectionViewCell.getWidth()
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Tap :", indexPath.row, pets[indexPath.row])
    }
}
