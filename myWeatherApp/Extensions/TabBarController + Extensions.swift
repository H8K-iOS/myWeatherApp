import UIKit

extension WeatherTabBarController {
    func createSideButton(imageName: String, selector: Selector) -> UIView {
        let tapGesture = UITapGestureRecognizer(target: self, action: selector)
        
        let nextImg = UIImageView()
        nextImg.image = UIImage(systemName: imageName)
        nextImg.tintColor = .white
        nextImg.contentMode = .scaleAspectFit
        nextImg.translatesAutoresizingMaskIntoConstraints = false
        
        nextImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        nextImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        view.addSubview(nextImg)
        
        nextImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextImg.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }
}

func createHStack(subviews: [UIView]) -> UIStackView{
    let hs = UIStackView(arrangedSubviews: subviews)
    hs.translatesAutoresizingMaskIntoConstraints = false
    hs.axis = .horizontal
    hs.distribution = .fillEqually
    hs.alignment = .leading
    hs.spacing = 180
    hs.backgroundColor = .clear
    return hs
}
