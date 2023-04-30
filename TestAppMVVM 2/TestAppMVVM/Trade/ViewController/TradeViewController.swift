//
//  TradeViewController.swift
//  TestAppMVVM
//
//  Created by Владимир on 19.03.2023.
//

import UIKit

class TradeViewController: UIViewController {
    
    private var viewModel: TradeViewModel
    var coordinator: TradeFlow?
    
    private let dispatchGroup = DispatchGroup()
    private var latest: [Latest] = []
    private var flashSale: [FlashSale] = []
    //MARK: - Properties
    private var search: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "What are you looking for?"
        search.layer.cornerRadius = 21
        search.layer.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.969, alpha: 1).cgColor
        search.clipsToBounds = true;
        search.sizeToFit()
        
        return search
    }()
    
    private var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private var arrowView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "arrow_image")
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var labelLocation: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = UIColor(red: 0.357, green: 0.357, blue: 0.357, alpha: 1)
        return label
    }()
    
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: Constants.TradeIdentifiers.categories)
        tableView.register(LatestTableViewCell.self, forCellReuseIdentifier: Constants.TradeIdentifiers.latests)
        tableView.register(FlashSaleTableViewCell.self, forCellReuseIdentifier: Constants.TradeIdentifiers.flashSales)
        tableView.register(BrandsTableViewCell.self, forCellReuseIdentifier: Constants.TradeIdentifiers.brands)
        tableView.backgroundColor = .white
        return tableView
    }()
    //MARK: - Init
    init(viewModel: TradeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
        loadLatest()
    }
    //MARK: - Methods
    private func loadLatest() {
        dispatchGroup.enter()
        dispatchGroup.enter()
        
        viewModel.fetchProducts {
            self.viewModel.latest.bind { [unowned self] latest in
                self.latest = latest
                dispatchGroup.leave()
            }
        } failure: { error in
            print(error)
        }
        
        viewModel.fetchFlashSaleProducts(success: {
            self.viewModel.flashSale.bind { [unowned self] flashSale in
                self.flashSale = flashSale
                dispatchGroup.leave()
            }
        }, failure: { error in
            print(error)
        })
        
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
}

//MARK: - TableViewDelegate
extension TradeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.sectionsTrade.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = viewModel.sectionsTrade[indexPath.item]
        
        switch type {
        case .categories:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TradeIdentifiers.categories, for: indexPath) as! CategoriesTableViewCell
            cell.setupUI()
            return cell
        case .latest:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TradeIdentifiers.latests, for: indexPath) as! LatestTableViewCell
            cell.setupUI()
            cell.latest = self.latest
            return cell
        case .flashSale:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TradeIdentifiers.flashSales, for: indexPath) as! FlashSaleTableViewCell
            cell.setupUI()
            cell.flashSale = self.flashSale
            return cell
        case .brands:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TradeIdentifiers.brands, for: indexPath) as! BrandsTableViewCell
            cell.setupUI()
            cell.latest = self.latest
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = viewModel.sectionsTrade[indexPath.item]
        
        switch type {
        case .categories:
            return 100
        case .latest:
            return  200
        case .flashSale:
            return 250
        case .brands:
            return 200
        }
    }
}

//MARK: - SetupUI
extension TradeViewController {
    private func setupUI() {
        
        navigationItem.leftBarButtonItem =  UIBarButtonItem(image: UIImage(named: "burger_image"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem =  UIBarButtonItem(image: UIImage(named: "profilePhoto_image"), style: .plain, target: self, action: nil)
        navigationItem.title = "Trade By Bata"
        
        let textFieldInsideSearchBar = self.search.value(forKey: "searchField") as! UITextField
        textFieldInsideSearchBar.leftViewMode = UITextField.ViewMode.never
        textFieldInsideSearchBar.rightViewMode = UITextField.ViewMode.always
        
        [search, tableView, containerView].forEach {
            view.addSubview($0)
        }
        
        [arrowView, labelLocation].forEach {
            containerView.addSubview($0)
        }
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        search.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalTo(view.center.x)
            make.left.equalTo(56)
            make.right.equalTo(-56)
            make.height.equalTo(26)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(search.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(-5)
            make.width.equalTo(80)
        }
        
        labelLocation.snp.makeConstraints { make in
            make.left.equalTo(5)
            make.top.right.bottom.equalToSuperview()
        }
        
        arrowView.snp.makeConstraints { make in
            make.centerY.equalTo(labelLocation)
            make.right.equalTo(-10)
        }
    }
}

