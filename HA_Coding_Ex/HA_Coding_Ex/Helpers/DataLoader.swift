//
//  DataLoader.swift
//  HA_Coding_Ex
//
//  Created by Logan Klein on 11/7/20.
//

import UIKit
import ObjectMapper

class DataLoader: NSObject {
    
    var pros: [Pro] = []
    static var instance: DataLoader!
    
    // MARK: - Shared instance
    
    class func shared() -> DataLoader {
        self.instance = (self.instance ?? DataLoader())
        return self.instance
    }
    
    // MARK: - Data Loading
    
    func loadPros() {
        guard let proDataUrl = Bundle.main.url(forResource: "pro_data", withExtension: "json") else {
            print("Unable to determine URL for pro data path")
            return
        }
        
        do {
            let localData = try Data(contentsOf: proDataUrl)
            let JSON = DataLoader.dataToJSON(data: localData)
            self.pros = Mapper<Pro>().mapArray(JSONArray: JSON as! [[String : Any]])
            self.pros.sort { $0.companyName < $1.companyName }
        } catch {
            print ("error collecting pro information locally")
        }
    }
    
    // MARK: - JSON Extraction
    
    public class func dataToJSON(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        
        return nil
    }
}
