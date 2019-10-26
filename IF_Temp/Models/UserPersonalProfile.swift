//
//  UserPersonalProfile.swift
//  IF_Temp
//
//  Created by DONGGUN LEE on 10/26/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

//UserName
let USER_PERSONAL_PROFILE_DATA_NAME = "user_personal_profile_data_name"
let USER_PERSONAL_PROFILE_DATA_HEIGHT = "user_personal_profile_data_height"
let USER_PERSONAL_PROFILE_DATA_WEIGHT = "user_personal_profile_data_weight"
let USER_PERSONAL_PROFILE_DATA_AGE = "user_personal_profile_data_age"
let USER_PERSONAL_PROFILE_DATA_SEX = "user_personal_profile_data_sex"
let USER_PERSONAL_PROFILE_DATA_BLOOD_TYPE = "user_personal_profile_data_blood_type"

class UserPersonalProfile{
    
    //MARK: - Name
    class func getUserName() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_NAME)
    }
    
    class func setUserName(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_NAME)
    }
    
    //MARK: - Age
    class func getUserAge() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_AGE)
    }
    
    class func setUserAge(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_AGE)
    }
    
    //MARK: - Sex
    class func getUserSex() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_SEX)
    }
    
    class func setUserSex(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_SEX)
    }
    
    //MARK: - Blood Type
    class func getUserBloodType() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_BLOOD_TYPE)
    }
    
    class func setUserBloodType(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_BLOOD_TYPE)
    }
    
    //MARK: - Height
    class func getUserHeight() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_HEIGHT)
    }
    
    class func setUserHeight(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_HEIGHT)
    }
    
    //MARK: - Weight
    class func getUserWeight() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_WEIGHT)
    }
    
    class func setUserWeight(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_WEIGHT)
    }
    
    //MARK: - Blood Pressure
    
    //MARK: - Heart Rate
}
