//
//	Result.swift
//
//	Create by 韶泓 沈 on 25/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Result{

	var cityid : String!
	var citynm : String!
	var cityno : String!
	var days : String!
	var humiHigh : String!
	var humiLow : String!
	var humidity : String!
	var tempHigh : String!
	var tempLow : String!
	var temperature : String!
	var weaid : String!
	var weather : String!
	var weatherIcon : String!
	var weatherIcon1 : String!
	var weatid : String!
	var weatid1 : String!
	var week : String!
	var wind : String!
	var windid : String!
	var winp : String!
	var winpid : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		cityid = dictionary["cityid"] as? String
		citynm = dictionary["citynm"] as? String
		cityno = dictionary["cityno"] as? String
		days = dictionary["days"] as? String
		humiHigh = dictionary["humi_high"] as? String
		humiLow = dictionary["humi_low"] as? String
		humidity = dictionary["humidity"] as? String
		tempHigh = dictionary["temp_high"] as? String
		tempLow = dictionary["temp_low"] as? String
		temperature = dictionary["temperature"] as? String
		weaid = dictionary["weaid"] as? String
		weather = dictionary["weather"] as? String
		weatherIcon = dictionary["weather_icon"] as? String
		weatherIcon1 = dictionary["weather_icon1"] as? String
		weatid = dictionary["weatid"] as? String
		weatid1 = dictionary["weatid1"] as? String
		week = dictionary["week"] as? String
		wind = dictionary["wind"] as? String
		windid = dictionary["windid"] as? String
		winp = dictionary["winp"] as? String
		winpid = dictionary["winpid"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if cityid != nil{
			dictionary["cityid"] = cityid
		}
		if citynm != nil{
			dictionary["citynm"] = citynm
		}
		if cityno != nil{
			dictionary["cityno"] = cityno
		}
		if days != nil{
			dictionary["days"] = days
		}
		if humiHigh != nil{
			dictionary["humi_high"] = humiHigh
		}
		if humiLow != nil{
			dictionary["humi_low"] = humiLow
		}
		if humidity != nil{
			dictionary["humidity"] = humidity
		}
		if tempHigh != nil{
			dictionary["temp_high"] = tempHigh
		}
		if tempLow != nil{
			dictionary["temp_low"] = tempLow
		}
		if temperature != nil{
			dictionary["temperature"] = temperature
		}
		if weaid != nil{
			dictionary["weaid"] = weaid
		}
		if weather != nil{
			dictionary["weather"] = weather
		}
		if weatherIcon != nil{
			dictionary["weather_icon"] = weatherIcon
		}
		if weatherIcon1 != nil{
			dictionary["weather_icon1"] = weatherIcon1
		}
		if weatid != nil{
			dictionary["weatid"] = weatid
		}
		if weatid1 != nil{
			dictionary["weatid1"] = weatid1
		}
		if week != nil{
			dictionary["week"] = week
		}
		if wind != nil{
			dictionary["wind"] = wind
		}
		if windid != nil{
			dictionary["windid"] = windid
		}
		if winp != nil{
			dictionary["winp"] = winp
		}
		if winpid != nil{
			dictionary["winpid"] = winpid
		}
		return dictionary
	}

}