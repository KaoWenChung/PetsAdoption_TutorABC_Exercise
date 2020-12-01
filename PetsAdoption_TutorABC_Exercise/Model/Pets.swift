//
//  Pets.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/30.
//

import UIKit
import YYModel

class Pet: NSObject, NSCoding, YYModel {
    @objc var animal_sex: String?
    @objc var animal_age: String?
    @objc var album_file: String?
    @objc var shelter_address: String?
    @objc var animal_bodytype: String?
    @objc var animal_sterilization: String?
    @objc var animal_bacterin: String?
    @objc var shelter_name: String?
    @objc var animal_place: String?

    override init() {
        super.init()
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.yy_modelInit(with: aDecoder)
    }

    func encode(with aCoder: NSCoder) {
        self.yy_modelEncode(with: aCoder)
    }

    static func modelCustomPropertyMapper() -> [String: Any]? {
        return ["ids": "id"]
    }

    override var description: String {
            return yy_modelDescription()
        }
        
        class func getSavePath() -> String{
            let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
            let path = (docPath as String) + "/cityList.plist"
            print(path)
            return path
        }
        
        class func saveCityModel(petArray:[Pet]) {
            let path = getSavePath()
            NSKeyedArchiver.archiveRootObject(petArray, toFile: path)
        }
        
        class func getCityModelFromDie() -> [Pet] {
            let cityModel = NSKeyedUnarchiver.unarchiveObject(withFile: getSavePath()) as! [Pet]
            return cityModel
        }

}
