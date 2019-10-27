//
//  PostAddress1.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/27/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

class PostAddress1{
    class func postAddress1(){
        let headers = [
          "Content-Type": "application/json",
          "cache-control": "no-cache",
          "Postman-Token": "fd5d1339-8f16-40d8-95ee-0a8aa22adac0"
        ]
        let parameters = ["address1": "1101 Madruga Ave Coral Gables FL"] as [String : Any]
        
        do{
            let postData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            
            let request = NSMutableURLRequest(url: NSURL(string: "https://e635d0f1.ngrok.io/homelocation")! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData as Data
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
              if (error != nil) {
                print(error)
              } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
              }
            })
            
            dataTask.resume()
        }catch{
            
        }
        
        
    }
}
