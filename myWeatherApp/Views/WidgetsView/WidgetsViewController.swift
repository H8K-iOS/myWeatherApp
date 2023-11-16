import UIKit

final class WidgetsViewController: UIViewController {
    //MARK: Variables
    private var viewModel: WidgetsViewModel
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.tintColor = .clear
        tv.register(WidgetViewCell.self, forCellReuseIdentifier: WidgetViewCell.identifier)
        tv.showsVerticalScrollIndicator = false
        tv.layer.zPosition = -1
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    private lazy var label: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Weather"
        lb.font = .systemFont(ofSize: 22)
        lb.textColor = .white
        lb.textAlignment = .left
        return lb
    }()
    private lazy var hStack: UIStackView = {
        let hs = UIStackView(arrangedSubviews: [backButton, label, addLocationbutton])
        hs.translatesAutoresizingMaskIntoConstraints = false
        hs.axis = .horizontal
        hs.distribution = .equalSpacing
        return hs
    }()
    private lazy var backButton = createButton(imageName: "chevron.backward", selector: #selector(backButtonTapped))
    private lazy var addLocationbutton = createButton(imageName: "plus", selector: #selector(backButtonTapped))
    
    //MARK: - Lifecycle
    init(_ viewModel: WidgetsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1099999994, green: 0.1059999987, blue: 0.200000003, alpha: 1)
        
        setHierarchy()
        setLayouts()
    }
    
    //MARK: Functions
    @objc private func backButtonTapped() {
        self.dismiss(animated: true)
    }
    
}

//MARK: - Extensions
private extension WidgetsViewController {
    func setViews() {
        
    }
    
    func setHierarchy() {
        self.view.addSubview(tableView)
        self.view.addSubview(backButton)
        self.view.addSubview(label)
        self.view.addSubview(hStack)
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hStack.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            hStack.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            hStack.heightAnchor.constraint(equalToConstant: 42),
            
            tableView.topAnchor.constraint(equalTo: hStack.safeAreaLayoutGuide.bottomAnchor, constant: 6),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

//MARK: TableView DataSource
extension WidgetsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WidgetViewCell.identifier, for: indexPath) as? WidgetViewCell else { fatalError("fatal error") }
        return cell
    }
    
}

//MARK: TableView Delegate
extension WidgetsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        220
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



