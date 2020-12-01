//
//  MainViewController.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/27.
//

import UIKit
import AFNetworking

class MainViewController: UIViewController {

    private var collectionView: UICollectionView!
    private(set) var petsData = [Pet]()

    override func viewDidLoad() {
        super.viewDidLoad()

        getJSON()
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

    func getJSON() {
        let url = "https://quality.data.gov.tw/dq_download_json.php?nid=85903&md5_url=c37f10282e2229a6459d7d85e601c38e"
        let manager = AFHTTPSessionManager()
        manager.get(
            url,
            parameters: nil,
            headers: nil,
            progress: nil,
            success: { (_, jsonData) in
                let petArray = NSArray.yy_modelArray(with: Pet.self, json: jsonData) as! [Pet]
//                print("jsonData", jsonData)
                print("petArray", petArray)
                Pet.saveCityModel(petArray: petArray)
                sleep(2)
                print("wowowow", Pet.getCityModelFromDie())
//                print("wow2", jsonData)

                 if let dic = jsonData as? [String: Any], let matches = dic["matches"] as? [[String: Any]] {
                      print(matches)
                 }
                 DispatchQueue.main.async {
                    print("Wow")
                 }
            },
            failure: {
                (_, error) in
                 print("Error: " + error.localizedDescription)
            })
//        manager.get(
//            url,
//            parameters: nil,
//            success:
//            {
//                (operation, responseObject) in
//
//                 if let dic = responseObject as? [String: Any], let matches = dic["matches"] as? [[String: Any]] {
//                      print(matches)
//                 }
//                 DispatchQueue.main.async {
//                     self.tollBothPlazaTableView.reloadData()
//                 }
//            },
//            failure:
//            {
//                (operation, error) in
//                 print("Error: " + error.localizedDescription)
//        })
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
