//
//	Weather.swift
//
//	Create by 韶泓 沈 on 25/11/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Weather{

	var result : [Result]!
	var success : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		result = [Result]()
		if let resultArray = dictionary["result"] as? [NSDictionary]{
			for dic in resultArray{
				let value = Result(fromDictionary: dic)
				result.append(value)
			}
		}
		success = dictionary["success"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if result != nil{
			var dictionaryElements = [NSDictionary]()
			for resultElement in result {
				dictionaryElements.append(resultElement.toDictionary())
			}
			dictionary["result"] = dictionaryElements
		}
		if success != nil{
			dictionary["success"] = success
		}
		return dictionary
	}

}