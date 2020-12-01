//
//  MainViewController.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/27.
//

import UIKit

class MainViewController: UIViewController {

    private var collectionView: UICollectionView!
    private(set) var petsData = [Pet]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let pad = PetsAdoption.x(20)
        let insets = UIEdgeInsets(top: pad * 1.5, left: pad, bottom: pad, right: pad)
        let layout = PetsCollectionViewLayout(lineSpacing: PetsAdoption.x(8), columnSpacing: PetsAdoption.x(4), sectionInsets: insets)

        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout: layout)
        layout.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PetsCollectionViewCell.self, forCellWithReuseIdentifier: PetsCollectionViewCell.reuseId)
        collectionView.backgroundColor = .white

        
        view.addSubview(collectionView)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetsCollectionViewCell.reuseId, for: indexPath)
                cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.orange : UIColor.brown
                return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
}

extension MainViewController: PetsCollectionViewDelegate {
    func heightForRows(_ layout: PetsCollectionViewLayout) -> CGFloat {
        return 100
    }
    
    func widthForItems(_ layout: PetsCollectionViewLayout, at indexPath: IndexPath) -> CGFloat {
        return PetsCollectionViewCell.getWidth()
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
//        let text =
        print("Tap :", indexPath.row)
    }
}
