//
//  PostLastOne.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/27/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

class PostLastOne{
    
    class func postLastOne(){
        let headers = [
          "Content-Type": "application/json",
          "cache-control": "no-cache",
          "Postman-Token": "fc87ef64-6a13-4b8e-b062-1fc6283dd6ff"
        ]
    
        let request = NSMutableURLRequest(url: NSURL(string: "https://e635d0f1.ngrok.io/getrisk")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
    
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error)
          } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            
            if let responsedata = responseString!.data(using: String.Encoding.utf8){
                do{
                    let jsonResult:NSDictionary = try JSONSerialization.jsonObject(with: responsedata, options: []) as! NSDictionary
                    
                    print(jsonResult)
                    
                    let cancer = jsonResult["cancer"] as! Int
                    let diabetes = jsonResult["diabetes"] as! Int
                    let heart = jsonResult["heart"] as! Int
                    let stress = jsonResult["stress"] as! Int
                    
                    let dic = ["cancer":cancer, "diabetes": diabetes, "heart":heart, "stress":stress]
                    
                    UserPersonalProfile.setUserLast(name: dic)
                    
                }//End - do
                catch let error as NSError{
                    print(error.localizedDescription)

                }//End - catch
            }
            
          }
        })
        
        dataTask.resume()
    }
}
