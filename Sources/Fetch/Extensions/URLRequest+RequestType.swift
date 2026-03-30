//
//  URLRequest+RequestType.swift
//  Fetch
//
//  Created by Austin Vesich on 3/28/26.
//

import Foundation

@available(macOS 12.0, *)
extension URLRequest {
    init(_ url: URL, type: HTTPRequestType) {
        self.init(url: url)
        
        httpMethod = type.rawValue
        
        if type == .POST || type == .PUT {
            setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
    }
    
    public static func post(_ url: URL) -> URLRequest {
        return .init(url, type: .POST)
    }

    public static func get(_ url: URL) -> URLRequest {
        return .init(url, type: .GET)
    }
    
    public static func put(_ url: URL) -> URLRequest {
        return .init(url, type: .PUT)
    }

    public static func delete(_ url: URL) -> URLRequest {
        return .init(url, type: .DELETE)
    }
}
