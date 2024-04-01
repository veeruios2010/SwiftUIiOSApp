//
//  Constants.swift
//  TestApp
//
//  Created by Apple on 3/25/24.
//

import Foundation

struct Constants {
    
    static let navigationTitle = "users"
    static let frameHeightAndWidth70 = 70.0
    static let spacerHeightorWidth = 32.0
    static let padding20 = 20.0
    static let frameSize200 = 200.0
    
    struct APIEndPoints {
        static let baseUrl = "https://reqres.in/api/"
        static let getUsersList = "users?page=1"
        static let getUser = "users/"
    }
    
    struct ErrorStrings {
        static let InvalidURL = "Invalid URL"
        static let InvalidResponse = "Invalid Response"
        static let InvalidData = "Invalid data"
    }
    
    struct ButtonTitles {
        static let previousBtn = "previous"
        static let nextBtn = "next"
    }
    
    struct AlertTitles {
        static let error = "Error"
    }

    
}
