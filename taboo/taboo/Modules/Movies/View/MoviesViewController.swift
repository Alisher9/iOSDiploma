//
//  MoviesViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//  
//

import UIKit

@objc protocol MovieViewDelegate: class {
    @objc optional func scrollViewDidScroll(_ scrollView: UIScrollView)
}

final class MoviesViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: MoviesPresentation?
    static var const = 1
    
    weak var delegate: MovieViewDelegate?
    
    var movieType: FilmType?
    
    var userId: String?
    
    var tableViewContentInset: UIEdgeInsets {
        get {
            return tableView.contentInset
        }
        set {
            tableView.contentInset = newValue
            tableView.scrollIndicatorInsets = newValue
        }
    }
    
    var contentOffset: CGPoint {
        return tableView.contentOffset
    }
    
    // MARK: - Private properties
    
    var models: [MovieProfileViewModel] = [] {
        didSet {
            tableView.reloadDataAnimated()
        }
    }
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.register(MovieCell.self)
        view.separatorStyle = .none
        view.backgroundColor = UIColor.lightGray
        view.showsVerticalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(getAdvertisements), for: .valueChanged)
        return refresh
    }()
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        if MoviesViewController.const == 1 {
            featuredMovie { (res) in
                self.models = [res]
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        featuredMovies { (response) in
            self.models = [response]
            self.tableView.reloadData()
        }
        MoviesViewController.const = 0
    }
    func featuredMovie(completionHandler: @escaping(MovieProfileViewModel) -> ()) {
            
            guard let url = URL(string: "https://c7286ae03971.ngrok.io/api/profile/2/") else { return }
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    return
                }
                do {
                    guard let data = data else {
                        return
                    }
                    
                    let json = try JSONDecoder().decode(MovieProfileViewModel.self, from: data)
                    
                    print("json", json)
                    DispatchQueue.main.async {
                        completionHandler(json)
                    }
                } catch let err {
                    print(err)
                }
                
            }) .resume()
        }
    
    
    func featuredMovies(completionHandler: @escaping(MovieProfileViewModel) -> ()) {
            
            guard let url = URL(string: "https://c7286ae03971.ngrok.io/api/profile/1/") else { return }
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    return
                }
                do {
                    guard let data = data else {
                        return
                    }
                    
                    let json = try JSONDecoder().decode(MovieProfileViewModel.self, from: data)
                    
                    print("json", json)
                    DispatchQueue.main.async {
                        completionHandler(json)
                    }
                } catch let err {
                    print(err)
                }
                
            }) .resume()
        }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        tableView.addSubview(refreshControl)
        view.addSubviews(tableView)
    }
    
    private func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    // MARK: - Public actions
    
    @objc func getAdvertisements() {
//        presenter?.getMovies(of: movieType)
    }
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension MoviesViewController: MoviesView {
    func update(with advertisements: [Film]) {
//        var filteredAdvertisements = advertisements.sorted { (lhs, rhs) -> Bool in
//            guard let lhsCreatedTime = lhs.createdTime,
//                let rhsCreatedTime = rhs.createdTime else {
//                return true
//            }
//            return lhsCreatedTime > rhsCreatedTime
//        }
//        if let id = userId {
//            filteredAdvertisements = filteredAdvertisements.filter { $0.userId == id }
//        }
//        self.advertisements = filteredAdvertisements
    }
    
    func showActivityIndicator() {
        tableView.showActivityIndicator()
    }
    
    func hideActivityIndicator() {
        tableView.hideActivityIndicator()
        refreshControl.endRefreshing()
    }
    
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
//        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MovieCell
        cell.viewModel = models[indexPath.row]
        cell.selectionStyle = .none
        cell.title = "Alish"
        cell.backgroundColor = .white
        return cell
    }
    
}

extension MoviesViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.scrollViewDidScroll?(scrollView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let vc = MovieCardViewController()
        navigationController?.pushViewController(vc, animated: true)
//        presenter?.didSelect(film: movies[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

// MARK: - Nested types

private extension MoviesViewController {
    
    enum Constants {
    }
    
}
