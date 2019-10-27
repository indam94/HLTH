//
//  postHeight.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/27/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//


import Foundation

class PostWeight{
    class func postWeight(){
        
        print(UserPersonalProfile.getUserToken()!)
        
        let headers = [
          "Content-Type": "application/json",
          "Authorization": "Bearer \(UserPersonalProfile.getUserToken()!)",
          "cache-control": "no-cache",
          "Postman-Token": "a751d7ef-deb2-4274-9586-108e4225c20b"
        ]
        let parameters = [
          "resourceType": "Observation",
          "status": "final",
          "category": [["coding": [
                [
                  "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                  "code": "vital-signs",
                  "display": "Vital Signs"
                ]
              ]]],
          "code": ["coding": [
              [
                "system": "http://loinc.org",
                "code": "29463-7",
                "display": "Body Weight"
              ],
              [
                "system": "http://loinc.org",
                "code": "3141-9",
                "display": "Body weight Measured"
              ],
              [
                "system": "http://snomed.info/sct",
                "code": "27113001",
                "display": "Body weight"
              ],
              [
                "system": "http://acme.org/devices/clinical-codes",
                "code": "body-weight",
                "display": "Body Weight"
              ]
            ]],
          "subject": ["reference": "Patient/6c440fbd-a186-4acf-b3a3-679d38dfa432"],
          "encounter": ["reference": "Encounter/example"],
          "effectiveDateTime": "2019-10-27",
          "valueQuantity": [
            "value": UserPersonalProfile.getUserWeight()!,
            "unit": "lbs",
            "system": "http://unitsofmeasure.org",
            "code": "[lb_av]"
          ]
        ] as [String : Any]
        
         let session = Foundation.URLSession.shared
        
        let url = URL(string: "https://teamzero.azurehealthcareapis.com/Observation")
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            
            request.httpBody = jsonData
            
            session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
              if (error != nil) {
                print(error)
              } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
              }
                }).resume()
        }
        catch{
            //fatalError()
        }
    }
}
