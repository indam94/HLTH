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
let USER_PERSONAL_PROFILE_DATA_ADDRESS1 = "user_personal_profile_data_blood_address1"
let USER_PERSONAL_PROFILE_DATA_STEPS = "user_personal_profile_data_blood_steps"
let USER_PERSONAL_PROFILE_DATA_ADDRESS2 = "user_personal_profile_data_blood_address2"

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
    
    //MARK: - Address1
    class func getUserAddress1() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_ADDRESS1)
    }
    
    class func setUserAddress1(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_ADDRESS1)
    }
    
    //MARK: - Address2
    class func getUserAddress2() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_ADDRESS2)
    }
    
    class func setUserAddress2(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_ADDRESS2)
    }
    
    //MARK: - Steps
    class func getUserSteps() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_STEPS)
    }
    
    class func setUserSteps(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_STEPS)
    }
}
