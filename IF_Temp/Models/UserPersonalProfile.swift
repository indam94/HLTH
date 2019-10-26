//
//  UserPersonalProfile.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

let USER_PERSONAL_PROFILE_DATA_NAME = "user_personal_profile_data_name"

class UserPersonalProfile{
    
    //getter
    class func getUserName() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_NAME)
    }
    
    //setter
    class func setUserName(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_NAME)
    }
    
}
