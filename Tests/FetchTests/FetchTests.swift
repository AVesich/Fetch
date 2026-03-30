import Testing
@testable import Fetch

import Foundation

@Test func example() async throws {
    let weather: Weather? = try? await URLSession.shared.get(from: Weather.Routes.get(city: "London"))
    
    dump(weather)
    #expect(weather != nil)
}
