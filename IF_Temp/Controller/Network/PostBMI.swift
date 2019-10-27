//
//  PostBMI.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/27/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

class PostBMI{
    class func postBMI(){
        
        let weight = UserPersonalProfile.getUserWeight()!
        let height = UserPersonalProfile.getUserHeight()!
        
        let headers = [
          "Content-Type": "application/json",
          "Authorization": "Bearer \(UserPersonalProfile.getUserToken()!)",
          "cache-control": "no-cache",
          "Postman-Token": "8246d56f-31fa-4a84-8164-ab8c59e32305"
        ]
        
        let parameters = [
          "resourceType": "Observation",
          "id": "bmi",
          "meta": ["profile": ["http://hl7.org/fhir/StructureDefinition/vitalsigns"]],
          "status": "final",
          "category": [
            [
              "coding": [
                [
                  "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                  "code": "vital-signs",
                  "display": "Vital Signs"
                ]
              ],
              "text": "Vital Signs"
            ]
          ],
          "code": [
            "coding": [
              [
                "system": "http://loinc.org",
                "code": "39156-5",
                "display": "Body mass index (BMI) [Ratio]"
              ]
            ],
            "text": "BMI"
          ],
          "subject": ["reference": "Patient/6c440fbd-a186-4acf-b3a3-679d38dfa432"],
          "effectiveDateTime": "2019-10-27",
          "valueQuantity": [
            "value": (weight*0.45)/(height*height),
            "unit": "kg/m2",
            "system": "http://unitsofmeasure.org",
            "code": "kg/m2"
          ]
        ] as [String : Any]
        
        print((weight*0.45)/(height*height))
        
        do{
            let postData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            
            let request = NSMutableURLRequest(url: NSURL(string: "https://teamzero.azurehealthcareapis.com/Observation")! as URL,
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
                
                if httpResponse!.statusCode < 202{
                    UserPersonalProfile.setUserBMI(name: (weight*0.45)/(height*height))
                }
              }
            })
            
            dataTask.resume()
        }catch{
            
        }
        
        
    }
}
