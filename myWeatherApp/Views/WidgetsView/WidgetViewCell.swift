import UIKit

final class WidgetViewCell: UITableViewCell {
    static let identifier = "WidgetCell"
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19"
        label.font = .systemFont(ofSize: 64)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    lazy var maxAndMinLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "H:24; M:18"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    lazy var locationLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tokyo, Japan"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    lazy var weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Mid Rain"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    lazy var vStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [maxAndMinLabel, locationLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 5
        return sv
    }()
    
    lazy var weatherImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Sun cloud angled rain large")
        iv.contentMode = .scaleAspectFit
        iv.frame = CGRect(x: 0, y: 0, width: 160, height: 160)
        return iv
    }()
    
    lazy var background: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setBackground()
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension WidgetViewCell {
    private func setupUI() {
        self.backgroundColor = .clear
        self.tintColor = .clear
        
        self.addSubview(vStack)
        self.addSubview(temperatureLabel)
        self.addSubview(weatherDescriptionLabel)
        self.addSubview(weatherImage)
        
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            temperatureLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            weatherImage.topAnchor.constraint(equalTo: background.topAnchor, constant: -20),
            weatherImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -4),
            
            weatherDescriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            weatherDescriptionLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -25),
            
            vStack.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -25),
            vStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            vStack.heightAnchor.constraint(equalToConstant: 41),
        ])
    }
    
    private func setBackground() {
        self.addSubview(background)
        
        let path: UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 1
        shape.strokeColor = #colorLiteral(red: 0.2119999975, green: 0.1650000066, blue: 0.5180000067, alpha: 1)
        shape.fillColor = #colorLiteral(red: 0.3490000069, green: 0.2119999975, blue: 0.7059999704, alpha: 1)
        shape.zPosition = -1
        background.layer.insertSublayer(shape, at: 0)
        
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            background.leftAnchor.constraint(equalTo: self.leftAnchor),
            background.rightAnchor.constraint(equalTo: self.rightAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            background.heightAnchor.constraint(equalToConstant: 185)
        ])
    }
    
    private func getPathForTabBar() -> UIBezierPath {
        let width = self.frame.width + 40
        let height = self.frame.height + 150
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0.37965*height))
        path.addCurve(to: CGPoint(x: 0.03312*width, y: 0.02995*height), controlPoint1: CGPoint(x: 0, y: 0.18083*height), controlPoint2: CGPoint(x: 0, y: 0.08142*height))
        path.addCurve(to: CGPoint(x: 0.21492*width, y: 0.04559*height), controlPoint1: CGPoint(x: 0.06623*width, y: -0.02153*height), controlPoint2: CGPoint(x: 0.1158*width, y: 0.00085*height))
                path.addLine(to: CGPoint(x: 0.9003*width, y: 0.35499*height))
        path.addCurve(to: CGPoint(x: 0.98602*width, y: 0.42173*height), controlPoint1: CGPoint(x: 0.94813*width, y: 0.37658*height), controlPoint2: CGPoint(x: 0.97204*width, y: 0.38738*height))
        path.addCurve(to: CGPoint(x: width, y: 0.59997*height), controlPoint1: CGPoint(x: width, y: 0.45609*height), controlPoint2: CGPoint(x: width, y: 0.50405*height))
                path.addLine(to: CGPoint(x: width, y: 0.74857*height))
        path.addCurve(to: CGPoint(x: 0.98116*width, y: 0.96318*height), controlPoint1: CGPoint(x: width, y: 0.8671*height), controlPoint2: CGPoint(x: width, y: 0.92636*height))
        path.addCurve(to: CGPoint(x: 0.87135*width, y: height), controlPoint1: CGPoint(x: 0.96232*width, y: height), controlPoint2: CGPoint(x: 0.93199*width, y: height))
                path.addLine(to: CGPoint(x: 0.12865*width, y: height))
        path.addCurve(to: CGPoint(x: 0.01884*width, y: 0.96318*height), controlPoint1: CGPoint(x: 0.06801*width, y: height), controlPoint2: CGPoint(x: 0.03768*width, y: height))
        path.addCurve(to: CGPoint(x: 0, y: 0.74857*height), controlPoint1: CGPoint(x: 0, y: 0.92636*height), controlPoint2: CGPoint(x: 0, y: 0.8671*height))
                path.addLine(to: CGPoint(x: 0, y: 0.37965*height))
                path.close()
        
        return path
    }
}
