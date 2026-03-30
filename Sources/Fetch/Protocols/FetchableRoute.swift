//
//  FetchableRoute.swift
//  Fetch
//
//  Created by Austin Vesich on 3/30/26.
//

import Foundation

@available(macOS 10.15, *)
public protocol URLRepresentable: RawRepresentable where RawValue == URL {}

@available(macOS 10.15, *)
public protocol FetchableRoute: URLRepresentable {
    var baseRoute: String { get }
}
