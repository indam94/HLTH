//
//  PostToken.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/27/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

class PostToken{
    class func postToken(){
        
        let headers = [
          "cache-control": "no-cache",
          "Postman-Token": "c663d2b4-8ef0-4540-ad69-83551f45df24"
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://e635d0f1.ngrok.io/gimmeToken")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error)
          } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
            print(data)
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            
            if let responsedata = responseString!.data(using: String.Encoding.utf8){
                do{
                    let jsonResult:NSDictionary = try JSONSerialization.jsonObject(with: responsedata, options: []) as! NSDictionary
                    
                    print(jsonResult)
                    
                    let newToken = jsonResult["access_token"] as! String
                    let syncTime = jsonResult["expires_on"] as! String
                    
                    print(newToken)
                    print(syncTime)
                    
                    UserPersonalProfile.setUserToken(name: newToken)
                    UserPersonalProfile.setUserSyncTimeToken(name: syncTime)
                    
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

