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
    private let spinner = UIActivityIndicatorView()

    private var collectionView: UICollectionView!
    private var pets = [Pet]()
    private var displayPets = [Pet]()
    private let dogToggleButton = PetToggleButton(title: .dog, font: PetsAdoption.Font.h2.regular)
    private let catToggleButton = PetToggleButton(title: .cat, font: PetsAdoption.Font.h2.regular)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

        let pad = PetsAdoption.x(20)
        let insets = UIEdgeInsets(top: pad * 1.5, left: pad, bottom: pad, right: pad)
        let layout = PetsCollectionViewLayout(lineSpacing: PetsAdoption.x(8), columnSpacing: PetsAdoption.x(4), sectionInsets: insets)

        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout: layout)
        layout.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PetsCollectionViewCell.self, forCellWithReuseIdentifier: PetsCollectionViewCell.reuseId)
        collectionView.backgroundColor = .lightGray
        view.backgroundColor = .lightGray
        view.addSubview(collectionView)

        createSpinner(view)
        getJSON()
        setUpToggleButton()
    }

    private func setUpToggleButton() {
        dogToggleButton.addTarget(self, action: #selector(tapDogButton), for: .touchUpInside)
        catToggleButton.addTarget(self, action: #selector(tapCatButton), for: .touchUpInside)

        //Stack View
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 40.0

        stackView.addArrangedSubview(dogToggleButton)
        stackView.addArrangedSubview(catToggleButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)

        stackView.mas_makeConstraints { (make) in
            /*
            if #available(iOS 11.0, *) {
                make?.top.equalTo()(view.mas_safeAreaLayoutGuideTop)?.with()?.offset()(PetsAdoption.x(10))
            } else {
                make?.top.equalTo()(PetsAdoption.x(10))
            }
            */

            make?.top.equalTo()(PetsAdoption.x(50))
            make?.centerX.equalTo()
        }
    }
    // 與tapCatButton待整合
    @objc func tapDogButton() {
        guard catToggleButton.getDisplayStatus() else { return }
        dogToggleButton.toggle()
        guard dogToggleButton.getDisplayStatus() else {
            displayPets = pets.filter{ ($0.animal_kind?.contains("貓"))! }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            return
        }
        displayPets = pets
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    @objc func tapCatButton() {
        guard dogToggleButton.getDisplayStatus() else { return }
        catToggleButton.toggle()
        guard catToggleButton.getDisplayStatus() else {
            displayPets = pets.filter{ ($0.animal_kind?.contains("狗"))! }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            return
        }
        displayPets = pets
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    private func getJSON() {
        spinner.startAnimating()
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
                self.displayPets = self.pets

                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.spinner.stopAnimating()
                }
            },
            failure: { (_, error) in
                self.spinner.stopAnimating()
                let alert = PetsAdoption.creatAlert(title: .noData, message: .noData, okBtn: .ok, action: {
                    self.getJSON()
                })
                self.present(alert, animated: true, completion: nil)
            })
    }

    private func createSpinner(_ view: UIView) {
        spinner.style = .whiteLarge
        spinner.hidesWhenStopped = true
        view.addSubview(spinner)

        spinner.mas_makeConstraints { (make) in
            make?.centerX.equalTo()
            make?.centerY.equalTo()
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetsCollectionViewCell.reuseId, for: indexPath) as! PetsCollectionViewCell
        cell.initCell(by: displayPets[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayPets.count
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
        let viewcontroller = PetsDetailViewController()
        viewcontroller.initView(by: displayPets[indexPath.row])
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
