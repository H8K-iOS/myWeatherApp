import UIKit

extension WidgetsViewController {
    func createButton(imageName: String, selector: Selector) -> UIButton {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(
            UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate),
            for: .normal)
        btn.tintColor = .gray
        btn.imageView?.contentMode = .scaleAspectFit
        btn.contentVerticalAlignment = .center
        btn.contentHorizontalAlignment = .center
        btn.backgroundColor = .darkGray.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 15
        btn.widthAnchor.constraint(equalToConstant: 42).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 42).isActive = true
        btn.addTarget(self, action: selector, for: .touchUpInside)
        return btn
    }
}
