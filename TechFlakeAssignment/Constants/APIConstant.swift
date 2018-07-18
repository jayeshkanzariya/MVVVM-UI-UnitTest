//
//  APIConstant.swift
//  TechFlakeAssignment
//
//  Created by Jayesh on 18/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

struct RequestParamter {
    static let sources = "sources"
    static let apiKey = "apiKey"
}

struct APIEndPoint {
    private static let serverUrl = "https://newsapi.org/v2/"
    static let GetNews = serverUrl + "top-headlines"
    
}
