//
//  PetsDetailViewController.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/12/7.
//

import UIKit
import Masonry

class PetsDetailViewController: UIViewController {
    private var detailView = PetsDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pet Detail"
        view.backgroundColor = .lightGray

        view.addSubview(detailView)
        detailView.mas_makeConstraints { (make) in
            make?.top.equalTo()(0)
            make?.bottom.equalTo()(0)
            make?.right.equalTo()(0)
            make?.left.equalTo()(0)
        }
    }

    func initView(by petData: Pet) {
        detailView.initView(by: petData)
    }

    deinit {
        print("PetsDetailViewController has been deinit")
    }
}
