//
//  PostNetwork.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

class PostNetwork{
    
    class func PostNetWorkTemp(){
        
        print("First Network Point")
        
        //Do not connect server
        
        let session = Foundation.URLSession.shared
        let url = URL(string: URL_POST_TEMP)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let param : [String : Any] = ["" : ""]
        
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
    
    
    //MARK: - Request Log In
    class func PostNetWorkRequestLogin(userName: String, password: String){
        
        print("First Network Point")
        
        //Do not connect server
        
        let session = Foundation.URLSession.shared
        let url = URL(string: URL_REQUEST_LOGIN)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let param : [String : Any] = ["username":userName, "password":password]
        
        print(param)
        
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
                            
                            NotificationCenter.default.post(name: NOTIFICATION_SET_USER_INFO, object: nil, userInfo: ["username":""])

                            
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
    
    //MARK: - Request Sign Up
    class func PostNetWorkRequestSignup(userName: String, password: String){
        
        print("First Network Point")
        
        //Do not connect server
        
        let session = Foundation.URLSession.shared
        let url = URL(string: URL_REQUEST_SIGNUP)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let param : [String : Any] = ["username":userName, "password":password]
        
        print(param)
        
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
                            
                            NotificationCenter.default.post(name: NOTIFICATION_SET_USER_INFO, object: nil, userInfo: ["username":""])

                            
                        }//End - do
                        catch let error as NSError{
                            print(error.localizedDescription)
                            NotificationCenter.default.post(name: NOTIFICATION_SET_USER_INFO_FAIL, object: nil, userInfo: ["username":""])
                        }//End - catch
                    }
                    
                }
                
            }).resume()
        }
        catch{
            //fatalError()
        }
        
    }
    
    //MARK: - Send Input
    class func PostNetWorkSendInput(){
        
        let session = Foundation.URLSession.shared
        let url = URL(string: URL_POST_SEND_INPUT)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        guard let weight = UserPersonalProfile.getUserWeight(),
            let height = UserPersonalProfile.getUserHeight(),
            let steps = UserPersonalProfile.getUserSteps(),
            let address1 = UserPersonalProfile.getUserAddress1(),
            let address2 = UserPersonalProfile.getUserAddress2() else{
            return
        }
        
        let param : [String : Any] = ["weight" : weight, "height" : height, "address1":address1, "address2":address2, "steps":steps]
        
        print(param)
        
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
    
    //MARK: - Request RiskData
}
