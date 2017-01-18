//
//  NetworkManager.swift
//  Example
//
//  Created by Ayelen Chavez on 16/01/2017.
//  Copyright © 2017 Ayelen Chavez. All rights reserved.
//

import UIKit
import Foundation

public class App {
    public let appleID : String
    public let bundleID : String
    public let iconURL : String
    public let name : String
    let APPLE_ID_KEY = "AppleID"
    let BUNDLE_ID_KEY = "BundleID"
    let ICON_URL_KEY = "IconURL"
    let NAME_KEY = "Name"
    
    init(dict: Dictionary<String, Any>) {
        appleID = dict[APPLE_ID_KEY] as? String ?? ""
        bundleID = dict[BUNDLE_ID_KEY] as? String ?? ""
        iconURL = dict[ICON_URL_KEY] as? String ?? ""
        name = dict[NAME_KEY] as? String ?? ""
    }
}

public class NetworkManager {
    let url = "https://www.moonlightapps.com/appnetwork/appnetwork.svc/en/data"
    
    public static let instance = NetworkManager()
    
    private init() {
    }

    public func downloadContent(completionHandler:@escaping ([App]?)->()) {
        
        
//        HOW TO POST
//        let request = NSMutableURLRequest(url: URL(string:url)!)
//        request.httpMethod = "POST"
//        URLSession.shared.dataTask(with: request, completionHandler: (Data?, URLResponse?, Error?) -> Void)
        
        let task = URLSession.shared.dataTask(with: URL(string:url)!) { (data, response, error) in
            var apps = [App]()
            
            if (error == nil)  {
                if let myData = data {
                    do {
                        if let appsDefinition = try JSONSerialization.jsonObject(with: myData, options: .allowFragments) as? [Dictionary<String, Any>] {
                            for appDict in appsDefinition {
                                apps.append(App(dict: appDict))
                            }
                        }
                    } catch {
                        print("Error trying to parse data")
                    }
                }
            }
            
            completionHandler(apps)
        }
        
        task.resume()
    }
}
