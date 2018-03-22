//
//  PlaceModel.swift
//  SwiftyJSONModel
//
//  Created by Appinventiv-Mac on 20/03/18.
//  Copyright © 2018 Appinventiv-Mac. All rights reserved.
//

import Foundation

struct PlaceModel:Codable {
    var results:[Results]
    var status:String

//NO need of init here. Handled by Codable
//APIController- no need of init(data: (with JSON))
//Thus one layer (APIController) work to get data from NC and pass model to VC is no more required.
    
//    init(data:[String:Any]) {
//        let resultsArray = data["results"] as! [[String:Any]]
//        results = resultsArray.map({ Results.init($0)})
//        status = data["status"] as! String
//    }
}

struct Results:Codable {
    var name:String
    var rating:Float            //rating to be NSNumber
    var formatted_address:String
    var icon:String
    
//    init(_ json:[String:Any]) {
//        name = json["name"] as! String
//        rating = json["rating"] as! Int
//        formatted_address = json["formatted_address"] as! String
//        icon = json["icon"] as! String
//    }
}
