//
//  Fetchable.swift
//  Fetch
//
//  Created by Austin Vesich on 3/28/26.
//

import Foundation

@available(macOS 10.15, *)
public protocol Fetchable: Codable {}

@available(macOS 10.15, *)
extension Fetchable {
    public var data: Data {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return Data()
        }
    }
}
