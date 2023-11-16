import UIKit
import WeatherKit

class WeatherViewController: UIViewController {
    let backgroundImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setBackground()
        getLocation()
    }
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            print(String(describing: location))
            
            WeatherManager.shared.getWeather(for: location) {
                
            }
        }
    }
}

private extension WeatherViewController {
    
    // MARK: UI
    func setBackground() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(backgroundImage)
        backgroundImage.image = #imageLiteral(resourceName: "Background.png")
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    
}
