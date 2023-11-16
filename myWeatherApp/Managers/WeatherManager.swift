import Foundation
import WeatherKit
import CoreLocation

final class WeatherManager {
    static let shared = WeatherManager()
    private let service = WeatherService()
    
    private init() {}
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
       Task {
        do {
            let result = try await service.weather(for: location)
            
            print("current weather \(result.currentWeather)")
        } catch {
            print("fail")
        }
    }
    }
}
