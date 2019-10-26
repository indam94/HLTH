//
//  PostNetwork.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

class PostNetwork{
    
    func PostNetWorkTemp(){
        
        print("First Network Point")
        
        //Do not connect server
        
        let session = Foundation.URLSession.shared
        let url = URL(string: URL_POST_TEMP)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let param : [String : Any] = ["geohash" : ""]
        
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
            
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-type")
        
            request.setValue("", forHTTPHeaderField: "Authorization")
            
            session.dataTask(with: request, completionHandler: { data, response, error in
                OperationQueue.main.addOperation{
                    //Resopse 받은 데이터
                    
                    guard error == nil && data != nil else {                                                          // check for fundamental networking error
                        return
                    }
                    
                    if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                        print("statusCode should be 200, but is \(httpStatus.statusCode)")
                        //print("response = \(response)")
                        
                    }
                    
                    let responseString = String(data: data!, encoding: String.Encoding.utf8)
                    
                    if let responsedata = responseString!.data(using: String.Encoding.utf8){
                        do{
                            let jsonResult:NSDictionary = try JSONSerialization.jsonObject(with: responsedata, options: []) as! NSDictionary
                            
                            print(jsonResult)
                            

                            //data
                            let resData = jsonResult["data"] as! [String:Any]
                                //geoData[]
                            let resGeoData = resData["geoData"] as! [[String:Any]]
                            
                            if resGeoData.count == 0 {
                                //받아올 공간 데이터가 없다
                                print("No Data!")
                             
                            }
                            
                        }//End - do
                        catch let error as NSError{
                            print(error.localizedDescription)
                        }//End - catch
                    }
                    
                }
                
            }).resume()
        }
        catch{
            //fatalError()
        }
        
    }
}


