import Foundation
import CoreLocation

final class LocationManager: NSObject {
    static let shared = LocationManager()
    private let manager = CLLocationManager()
    
    private var location: CLLocation? {
        didSet {
            guard let location else { return }
            locationFetchComplition?(location)
        }
    }
    
    private var locationFetchComplition: ((CLLocation) -> Void)?
   
    
    func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {
        self.locationFetchComplition = completion
        
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location = location
        manager.stopUpdatingLocation()
    }
}
