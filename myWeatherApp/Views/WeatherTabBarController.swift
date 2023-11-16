import UIKit
final class WeatherTabBarController: UITabBarController {
    //MARK: Constansts
    let nav1 = UINavigationController(rootViewController: WeatherViewController())
    
    //MARK: Variables
    lazy var bottomSheetButton = createSideButton(imageName: "mappin.and.ellipse", selector: #selector(bottomSheetButtonTapped))
    lazy var widgetListButton = createSideButton(imageName: "list.star", selector: #selector(widgetsListButtonTapped))
    lazy var sideButtonsHStack = createHStack(subviews: [bottomSheetButton, widgetListButton ])
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setSideButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
    }
    
    override func loadView() {
        super.loadView()
        self.tabBar.addSubview(bottomSheetButton)
        self.tabBar.addSubview(widgetListButton)
        setTabBar()
    }
    
    //MARK: - Functions
    @objc func bottomSheetButtonTapped() {
        
    }
    
    @objc func widgetsListButtonTapped() {
        let vm = WidgetsViewModel()
        let vc = WidgetsViewController(vm)
        present(vc, animated: true)
    }
}

//MARK: - Extensions
extension WeatherTabBarController {
    private func setSideButtons() {
        self.view.addSubview(sideButtonsHStack)
        
        NSLayoutConstraint.activate([
            sideButtonsHStack.widthAnchor.constraint(equalTo: tabBar.widthAnchor),
            sideButtonsHStack.heightAnchor.constraint(equalToConstant: 100),
            sideButtonsHStack.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            sideButtonsHStack.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor, constant: 20),
            
            bottomSheetButton.heightAnchor.constraint(equalToConstant: 50),
            bottomSheetButton.widthAnchor.constraint(equalToConstant: 50),
            
            widgetListButton.heightAnchor.constraint(equalToConstant: 50),
            widgetListButton.widthAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func setTabBar() {
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .white
        let path: UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 1
        shape.strokeColor = #colorLiteral(red: 0.4589999914, green: 0.5099999905, blue: 0.9570000172, alpha: 1).withAlphaComponent(0.5).cgColor
        shape.fillColor = #colorLiteral(red: 0.1449999958, green: 0.1410000026, blue: 0.2980000079, alpha: 1).withAlphaComponent(0.6).cgColor
        shape.zPosition = -1
        self.tabBar.layer.insertSublayer(shape, at: 0)
        nav1.tabBarItem = UITabBarItem(title: "",
                                       image: UIImage(systemName: ""),
                                       tag: 1)
        
        setViewControllers([nav1], animated: true)
    }
    
    //MARK: TabBar Drawing
    private func getPathForTabBar() -> UIBezierPath {
        let width = self.tabBar.bounds.width
        let height = self.tabBar.bounds.height + 40
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: -0.06504*height))
                path.addLine(to: CGPoint(x: 0.00019*width, y: -0.06699*height))
                path.addLine(to: CGPoint(x: -0.00064*width, y: -0.06778*height))
                path.addLine(to: CGPoint(x: -0.00064*width, y: -0.06504*height))
                path.addLine(to: CGPoint(x: -0.00064*width, y: 0.96748*height))
                path.addLine(to: CGPoint(x: -0.00064*width, y: 0.96951*height))
                path.addLine(to: CGPoint(x: 0, y: 0.96951*height))
                path.addLine(to: CGPoint(x: width, y: 0.96951*height))
                path.addLine(to: CGPoint(x: 1.00064*width, y: 0.96951*height))
                path.addLine(to: CGPoint(x: 1.00064*width, y: 0.96748*height))
                path.addLine(to: CGPoint(x: 1.00064*width, y: -0.06504*height))
                path.addLine(to: CGPoint(x: 1.00064*width, y: -0.06777*height))
                path.addLine(to: CGPoint(x: 0.99982*width, y: -0.06699*height))
                path.addLine(to: CGPoint(x: width, y: -0.06504*height))
                path.addCurve(to: CGPoint(x: 0.99981*width, y: -0.06699*height), controlPoint1: CGPoint(x: 0.99982*width, y: -0.06699*height), controlPoint2: CGPoint(x: 0.99982*width, y: -0.06699*height))
                path.addLine(to: CGPoint(x: 0.99981*width, y: -0.06698*height))
                path.addLine(to: CGPoint(x: 0.99978*width, y: -0.06695*height))
                path.addLine(to: CGPoint(x: 0.99967*width, y: -0.06685*height))
                path.addLine(to: CGPoint(x: 0.99925*width, y: -0.06645*height))
                path.addCurve(to: CGPoint(x: 0.99757*width, y: -0.06487*height), controlPoint1: CGPoint(x: 0.99887*width, y: -0.06609*height), controlPoint2: CGPoint(x: 0.99831*width, y: -0.06556*height))
                path.addCurve(to: CGPoint(x: 0.99107*width, y: -0.05884*height), controlPoint1: CGPoint(x: 0.99609*width, y: -0.06349*height), controlPoint2: CGPoint(x: 0.9939*width, y: -0.06145*height))
                path.addCurve(to: CGPoint(x: 0.96691*width, y: -0.03696*height), controlPoint1: CGPoint(x: 0.98542*width, y: -0.05362*height), controlPoint2: CGPoint(x: 0.97719*width, y: -0.04612*height))
                path.addCurve(to: CGPoint(x: 0.88471*width, y: 0.03264*height), controlPoint1: CGPoint(x: 0.94634*width, y: -0.01865*height), controlPoint2: CGPoint(x: 0.91756*width, y: 0.00626*height))
                path.addCurve(to: CGPoint(x: 0.67172*width, y: 0.1676*height), controlPoint1: CGPoint(x: 0.81898*width, y: 0.08541*height), controlPoint2: CGPoint(x: 0.73696*width, y: 0.14405*height))
                path.addCurve(to: CGPoint(x: 0.5*width, y: 0.20279*height), controlPoint1: CGPoint(x: 0.6042*width, y: 0.19198*height), controlPoint2: CGPoint(x: 0.56778*width, y: 0.20279*height))
                path.addCurve(to: CGPoint(x: 0.32571*width, y: 0.1676*height), controlPoint1: CGPoint(x: 0.43222*width, y: 0.20279*height), controlPoint2: CGPoint(x: 0.39324*width, y: 0.19198*height))
                path.addCurve(to: CGPoint(x: 0.11401*width, y: 0.03264*height), controlPoint1: CGPoint(x: 0.26047*width, y: 0.14405*height), controlPoint2: CGPoint(x: 0.1791*width, y: 0.08541*height))
                path.addCurve(to: CGPoint(x: 0.03269*width, y: -0.03696*height), controlPoint1: CGPoint(x: 0.08148*width, y: 0.00626*height), controlPoint2: CGPoint(x: 0.05302*width, y: -0.01865*height))
                path.addCurve(to: CGPoint(x: 0.00882*width, y: -0.05884*height), controlPoint1: CGPoint(x: 0.02253*width, y: -0.04612*height), controlPoint2: CGPoint(x: 0.01441*width, y: -0.05362*height))
                path.addCurve(to: CGPoint(x: 0.00241*width, y: -0.06487*height), controlPoint1: CGPoint(x: 0.00602*width, y: -0.06145*height), controlPoint2: CGPoint(x: 0.00387*width, y: -0.06349*height))
                path.addCurve(to: CGPoint(x: 0.00075*width, y: -0.06645*height), controlPoint1: CGPoint(x: 0.00168*width, y: -0.06556*height), controlPoint2: CGPoint(x: 0.00112*width, y: -0.06609*height))
                path.addLine(to: CGPoint(x: 0.00033*width, y: -0.06685*height))
                path.addLine(to: CGPoint(x: 0.00022*width, y: -0.06695*height))
                path.addLine(to: CGPoint(x: 0.00019*width, y: -0.06698*height))
                path.addLine(to: CGPoint(x: 0.00019*width, y: -0.06698*height))
                path.addCurve(to: CGPoint(x: 0, y: -0.06504*height), controlPoint1: CGPoint(x: 0.00019*width, y: -0.06699*height), controlPoint2: CGPoint(x: 0.00019*width, y: -0.06699*height))
        return path
        
    }
}
