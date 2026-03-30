//
//  URLSession+RequestType.swift
//  Fetch
//
//  Created by Austin Vesich on 3/28/26.
//

import Foundation

@available(macOS 12.0, *)
extension URLSession {
    public func post<T: Fetchable>(_ value: T, to route: any FetchableRoute) async throws {
        var request = URLRequest.post(route.rawValue)
        request.httpBody = value.data
        _ = try await URLSession.shared.upload(for: request, from: value.data)
    }
        
    public func get<T: Fetchable>(from route: any FetchableRoute) async throws -> T? {
        let (data, _) = try await URLSession.shared.data(for: URLRequest.get(route.rawValue))
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public func put<T: Fetchable>(_ value: T, to route: any FetchableRoute) async throws {
        var request = URLRequest.put(route.rawValue)
        request.httpBody = value.data
        _ = try await URLSession.shared.upload(for: request, from: value.data)
    }
    
    public func delete<T: Fetchable>(_ value: T, to route: any FetchableRoute) async throws {
        _ = try await URLSession.shared.upload(for: URLRequest.delete(route.rawValue), from: value.data)
    }
}
