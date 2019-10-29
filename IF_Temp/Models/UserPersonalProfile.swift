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
let USER_PERSONAL_PROFILE_DATA_BMI = "user_personal_profile_data_bmi"
let USER_PERSONAL_PROFILE_DATA_AGE = "user_personal_profile_data_age"
let USER_PERSONAL_PROFILE_DATA_SEX = "user_personal_profile_data_sex"
let USER_PERSONAL_PROFILE_DATA_BLOOD_TYPE = "user_personal_profile_data_blood_type"
let USER_PERSONAL_PROFILE_DATA_ADDRESS1 = "user_personal_profile_data_blood_address1"
let USER_PERSONAL_PROFILE_DATA_STEPS = "user_personal_profile_data_blood_steps"
let USER_PERSONAL_PROFILE_DATA_ADDRESS2 = "user_personal_profile_data_blood_address2"

let USER_PERSONAL_PROFILE_DATA_SYNC_TIME = "user_personal_profile_data_sync_time"

let USER_PERSONAL_PROFILE_DATA_SYNC_TIME_TOKEN = "user_personal_profile_data_sync_time_token"

let USER_PERSONAL_PROFILE_DATA_TOKEN = "user_personal_profile_data_token"

let USER_PERSONAL_PROFILE_DATA_DISTANCE = "user_personal_profile_data_distance"

let USER_PERSONAL_PROFILE_DATA_TRAVEL = "user_personal_profile_data_travel"

let USER_PERSONAL_PROFILE_DATA_LAST = "user_personal_profile_data_last"

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
    class func getUserHeight() -> Double? {
        return UserDefaults.standard.double(forKey: USER_PERSONAL_PROFILE_DATA_HEIGHT)
    }
    
    class func setUserHeight(name: Double){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_HEIGHT)
    }
    
    //MARK: - Weight
    class func getUserWeight() -> Double? {
        return UserDefaults.standard.double(forKey: USER_PERSONAL_PROFILE_DATA_WEIGHT)
    }
    
    class func setUserWeight(name: Double?){
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
    
    //MARK: - Sync Time
    class func getUserSyncTime() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_SYNC_TIME)
    }
    
    class func setUserSyncTime(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_SYNC_TIME)
    }
    
    //MARK: - Sync Time Token
    class func getUserSyncTimeToken() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_SYNC_TIME_TOKEN)
    }
    
    class func setUserSyncTimeToken(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_SYNC_TIME_TOKEN)
        
    }
    
    //MARK: - Token
    class func getUserToken() -> String? {
        return UserDefaults.standard.string(forKey: USER_PERSONAL_PROFILE_DATA_TOKEN)
    }
    
    class func setUserToken(name: String){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_TOKEN)
    }
    
    //MARK: - BMI
    class func getUserBMI() -> Double? {
        return UserDefaults.standard.double(forKey: USER_PERSONAL_PROFILE_DATA_BMI)
    }
    
    class func setUserBMI(name: Double){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_BMI)
    }
    
    //MARK: - Distance
    class func getUserDistance() -> Double? {
        return UserDefaults.standard.double(forKey: USER_PERSONAL_PROFILE_DATA_DISTANCE)
    }
    
    class func setUserDistance(name: Double){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_DISTANCE)
    }
    
    //MARK: - Travel Time
    class func getUserTravelTime() -> Double? {
        return UserDefaults.standard.double(forKey: USER_PERSONAL_PROFILE_DATA_TRAVEL)
    }
    
    class func setUserTravelTime(name: Double){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_TRAVEL)
    }
    
    //MARK: - Last
    class func getUserLast() -> [String:Any]? {
        return UserDefaults.standard.dictionary(forKey: USER_PERSONAL_PROFILE_DATA_LAST)
    }
    
    class func setUserLast(name: [String:Any]){
        UserDefaults.standard.set(name, forKey: USER_PERSONAL_PROFILE_DATA_LAST)
    }
}
