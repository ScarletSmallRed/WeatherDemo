//
//  NetworkHelper.swift
//  WeatherDemo
//
//  Created by 沈韶泓 on 2016/11/25.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import Foundation
import Just

enum NetworkHelper {
    case weeklyWeather(weaid: String)
    
    static var parms = [
        "app":"weather.future",
        "appkey":"10003",
        "sign":"b59bc3ef6191eb9f747dd4e83c99f2a4",
        "format":"json"
    ]
    
    static let baseURL = "http://api.k780.com:88"
    
    func getWeather(completion:  @escaping ([Result]?, String?) -> Void) {
        var results: [Result]?
        var error: String?
        
        switch self {
        case .weeklyWeather(weaid: let weaid):
            NetworkHelper.parms["weaid"] = weaid
            
            print(NetworkHelper.parms)
            
            
            Just.get(NetworkHelper.baseURL, params: NetworkHelper.parms, asyncCompletionHandler: { (HTTPResult) in
                if HTTPResult.ok {
                    guard let jsonDictionary = HTTPResult.json as? NSDictionary else {
                        error = NSLocalizedString("It is not a JSON string", comment: "HTTP result error information")
                        return
                    }
                    print(jsonDictionary)
                    
                    guard let success = jsonDictionary["success"], success as? String == "1" else {
                        error = NSLocalizedString("Returning data format is incoreect", comment: "HTTP result error information")
                        return
                    }
                    
                    results = Weather(fromDictionary: jsonDictionary).result
                    print(results)
                } else {
                    error = NSLocalizedString("Server error", comment: "Server error information")
                }
                
                completion(results, error)
            })
 
            
            /*
            Just.post(
                "http://api.k780.com:88"
            ) { HTTPResult in
                if HTTPResult.ok {
                    guard let jsonDictionary = HTTPResult.json as? NSDictionary else {
                        error = NSLocalizedString("It is not a JSON string", comment: "HTTP result error information")
                        return
                    }
                    print(jsonDictionary)
                    
                    guard let success = jsonDictionary["success"], success as? String == "1" else {
                        error = NSLocalizedString("Returning data format is incoreect", comment: "HTTP result error information")
                        return
                    }
                    
                    results = Weather(fromDictionary: jsonDictionary).result
                    print(results)
                } else {
                    error = NSLocalizedString("Server error", comment: "Server error information")
                }
                
                completion(results, error)
            }
            */
            
        }
    }
}
