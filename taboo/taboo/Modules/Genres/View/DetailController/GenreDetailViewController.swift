//
//  GenreDetailViewController.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/20/21.
//

import UIKit

final class GenreDetailViewController: UIViewController {
    
    var genresArray = ["Драма",
                       "Комедия",
                       "Боевик",
                       "Мелодрама",
                       "Трейлер",
                       "Биография",
                       "Детектив",
                       "Детский",
                       "Восточные",
                       "Хоррор", "Семейный", "Мультфильмы", "Сериал", "Аниме"]
    
    private lazy var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { _, _ -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                heightDimension: .fractionalHeight(1)))

            item.contentInsets = NSDirectionalEdgeInsets(top: 20,
                                                         leading: 5,
                                                         bottom: 5,
                                                         trailing: 5)

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140)),
                                                           subitem: item,
                                                           count: 2)

            group.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                          leading: 5,
                                                          bottom: 5,
                                                          trailing: 5)

            return NSCollectionLayoutSection(group: group)
        })
    )
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Detail"
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.register(GenreDetailCollectionViewCell.self, forCellWithReuseIdentifier: GenreDetailCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubview(collectionView)
    }
    
    private func configureConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.bottom.left.right.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
extension GenreDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreDetailCollectionViewCell.identifier,
                                                            for: indexPath) as? GenreDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: genresArray[indexPath.row])
//        cell.backgroundColor = .systemGreen
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let vc = MovieCardViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
