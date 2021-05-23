//
//  MultipleImagesView.swift
//  taboo
//
//  Created by Alisher Sattarbek on 5/17/21.
//

import UIKit

final class MultipleImagesView: UIView {
    
    // MARK: - Public properties

    var imageURLs: [String] = [] {
        didSet {
//            pageControl.numberOfPages = imageURLs.count
        }
    }

    // MARK: - Private properties
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        view.collectionViewLayout = layout
        view.delegate = self
        view.dataSource = self
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = ColorName.lightGray.color
        view.register(MultipleImagesCollectionViewCell.self)
        return view
    }()
    
    private lazy var pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.hidesForSinglePage = true
        return pageControl
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubviews(collectionView,
                    pageControl)
    }
    
    private func configureConstraints() {
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    // MARK: - Private actions
    
}
    
// MARK: - Extensions

extension MultipleImagesView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as MultipleImagesCollectionViewCell
//        cell.imageView.setImage(fileName: imageURLs[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let thisWidth = CGFloat(self.frame.width)
        return CGSize(width: thisWidth, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
