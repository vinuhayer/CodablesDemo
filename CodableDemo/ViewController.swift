//
//  ViewController.swift
//  CodableDemo
//
//  Created by Appinventiv-Mac on 21/03/18.
//  Copyright © 2018 Appinventiv-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headers = [
            "Cache-Control": "no-cache",
            "Postman-Token": "3f2edbf6-5894-43be-b9bd-9546879881f6"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Sydney&key=AIzaSyC4naPrk2bYKgcGlXAthRq4Y2FS7jlLPRc")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
           
            if let e=error {
                print(e)
            } else {
                let httpResponse = response as! HTTPURLResponse
                print(httpResponse)
            }
            
            //Parsing Data
            guard let d = data else {return}
            do {
                //MARK: DECODING
                
                let jsonData = try JSONDecoder().decode(PlaceModel.self, from: d)
                //here we are decoding data to model.
                print(jsonData)
            }
            catch let error as NSError{
            print("Could not fetch data. \(error), \(error.userInfo)")
            }
        })
        dataTask.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let result = Results(name: "sunshine", rating: 4, formatted_address: "noida", icon: "no")
        let place = PlaceModel(results: [result], status: "OK")
        
        //MARK: ENCODING
        
        let jsonData = try! JSONEncoder().encode(place)
        //here we are encoding model to data(JSON)
        
        print("\n\(jsonData)") //xcode omits data and print bytes
        
        let jsonString = String(data: jsonData, encoding: .utf8)
        print("\n\(jsonString!)")        //String Init
        
        //decoding the JSON data back into model instance
        let place2 = try! JSONDecoder().decode(PlaceModel.self, from: jsonData)
        print("\n\(place2)")
    }

}

