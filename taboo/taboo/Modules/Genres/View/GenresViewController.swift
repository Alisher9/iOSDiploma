//
//  GenresViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/9/21.
//  
//

import UIKit

final class GenresViewController: BaseViewController {
    
    // MARK: - Public properties
    
    var presenter: GenresPresentation?
    
    var genresArray = ["Драма",
                       "Комедия",
                       "Боевик",
                       "Мелодрама",
                       "Триллер",
                       "Биография",
                       "Детектив",
                       "Детский",
                       "Восточные",
                       "Ужасы",
                       "Семейный",
                       "Мультфильмы",
                       "Фантастика",
                       "Аниме"]
    
    private var colors: [UIColor] = [
        .systemPurple,
        .systemRed,
        .systemYellow,
        .systemBlue,
        .systemGray,
        .systemOrange,
        .systemTeal,
        .systemGreen,
        .systemIndigo,
        .systemGray2,
        .brown,
        .cyan,
        .lightGray,
        .pink
    ]
    
    private var images = ["11",
                          "12",
                          "13",
                          "14",
                          "15",
                          "16",
                          "17",
                          "18",
                          "19",
                          "20",
                          "21",
                          "22",
                          "23",
                          "24"]
    
    // MARK: - Private properties
    
    private lazy var searchController: UISearchController = {
       let results = UIViewController()
        results.view.backgroundColor = .red
        let vc = UISearchController(searchResultsController: results)
        vc.searchBar.placeholder = "Поиск фильмов"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()
    
    private lazy var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { _, _ -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                heightDimension: .fractionalHeight(1)))

            item.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                         leading: 7,
                                                         bottom: 2,
                                                         trailing: 7)

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)),
                                                           subitem: item,
                                                           count: 2)

            group.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                          leading: 0,
                                                          bottom: 10,
                                                          trailing: 0)

            return NSCollectionLayoutSection(group: group)
        })
    )
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
//        DispatchQueue.main.async { [weak self] in
//            self?.navigationController?.navigationBar.sizeToFit()
//        }
    }

//    override func viewDidAppear(_ animated: Bool) {
//        navigationItem.largeTitleDisplayMode = .always
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Жанры"
//        navigationController?.navigationBar.backgroundColor = .red
        
//        self.navigationItem.largeTitleDisplayMode = .never
//        self.navigationItem.largeTitleDisplayMode = .always
        
        navigationController?.navigationBar.prefersLargeTitles = true
//        if #available(iOS 11.0, *) {
//                self.navigationItem.largeTitleDisplayMode = .never
//                self.navigationItem.largeTitleDisplayMode = .always
//            }
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        view.addSubview(collectionView)
        collectionView.register(GenreCollectionViewCell.self,
                                forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        
        setupView()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView.frame = view.bounds
//    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubview(collectionView)
    }
    
    private func configureConstraints() {
        collectionView.snp.makeConstraints {
            $0.bottom.left.right.top.equalTo(view.safeAreaLayoutGuide)
//            $0.top.equalToSuperview()
        }
    }
    
    // MARK: - Public actions
    
    // MARK: - Private actions
    
}

// MARK: - Extensions

extension GenresViewController: GenresView {
}

extension GenresViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let resultsController = searchController.searchResultsController as? SearchResultsViewController,
              let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
    }
}

extension GenresViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier,
                                                            for: indexPath) as? GenreCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: genresArray[indexPath.row],
                       color: colors[indexPath.row],
                       image: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = GenreDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Nested types

private extension GenresViewController {
    
    enum Constants {
    }
    
}
