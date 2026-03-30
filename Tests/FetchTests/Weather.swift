//
//  User.swift
//  Fetch
//
//  Created by Austin Vesich on 3/28/26.
//

import Foundation
import Fetch

enum BaseRoutes {
    static let weather = "https://goweather.xyz/weather"
}

struct Weather: Fetchable {
    public enum Routes: FetchableRoute {
        case get(city: String)
        
        public var baseRoute: String {
            return BaseRoutes.weather
        }
        
        public var rawValue: RawValue {
            switch self {
            case .get(let city):
                return URL(string: baseRoute + "/\(city)")!
            }
        }
        
        public init?(rawValue: URL) {
            return nil
        }
    }

    public var temperature: String
    public var wind: String
    public var description: String
}
