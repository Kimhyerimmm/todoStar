//
//  GoalListView.swift
//  todoStar
//
//  Created by 김혜림 on 9/4/24.
//

import UIKit

class GoalListView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - Property
    private let viewModel = GoalListViewModel()

    // 중요도 높음 리스트
    private let importanceHighView = UIView()
    private let highTitle = UILabel()
    private var highCollectionListView: UICollectionView!

    // 중요도 중간 리스트
    private let importanceMiddleView = UIView()
    private let middleTitle = UILabel()
    //private var middleCollectionListView = UICollectionView()

    // 중요도 낮음 리스트
    private let importanceRowView = UIView()
    private let rowTitle = UILabel()
    //private var rowCollectionListView = UICollectionView()


    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup Method
    func setupView() {
        highViewList()

        highView()

        addSubview(importanceHighView)
        addSubview(importanceMiddleView)
        addSubview(importanceRowView)

        importanceHighView.translatesAutoresizingMaskIntoConstraints = false
        importanceMiddleView.translatesAutoresizingMaskIntoConstraints = false
        importanceRowView.translatesAutoresizingMaskIntoConstraints = false

        // importanceHighView 오토 레이아웃
        NSLayoutConstraint.activate([
            importanceHighView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            importanceHighView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            importanceHighView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])

        // importanceMiddleView 오토 레이아웃
        NSLayoutConstraint.activate([
            importanceMiddleView.topAnchor.constraint(equalTo: importanceHighView.bottomAnchor, constant: 40),
            importanceMiddleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            importanceMiddleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])

        // importanceRowView 오토 레이아웃
        NSLayoutConstraint.activate([
            importanceRowView.topAnchor.constraint(equalTo: importanceMiddleView.bottomAnchor, constant: 40),
            importanceRowView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            importanceRowView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }


    // MARK: - View
    // MARK: 중요도 높음 리스트
    func highView() {
        highViewTitle()

        importanceHighView.addSubview(highTitle)
        importanceHighView.addSubview(highCollectionListView)

        highTitle.translatesAutoresizingMaskIntoConstraints = false
        highCollectionListView.translatesAutoresizingMaskIntoConstraints = false

        // 타이틀 오토 레이아웃
        NSLayoutConstraint.activate([
            highTitle.topAnchor.constraint(equalTo: importanceHighView.topAnchor),
            highTitle.leadingAnchor.constraint(equalTo: importanceHighView.leadingAnchor),
            highTitle.trailingAnchor.constraint(equalTo: importanceHighView.trailingAnchor),
            highTitle.heightAnchor.constraint(equalToConstant: 20)
        ])

        // 리스트 오토 레이아웃
        NSLayoutConstraint.activate([
            highCollectionListView.topAnchor.constraint(equalTo: highTitle.bottomAnchor, constant: 10),
            highCollectionListView.leadingAnchor.constraint(equalTo: importanceHighView.leadingAnchor),
            highCollectionListView.trailingAnchor.constraint(equalTo: importanceHighView.trailingAnchor),
            highCollectionListView.heightAnchor.constraint(equalToConstant: (140 * 4) - 20)
        ])
    }

    func highViewTitle() {
        highTitle.text = "반드시 해야 해요!"
        highTitle.font = .bodySmallRegular()
        highTitle.textColor = .natural40
    }

    func highViewList() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20

        highCollectionListView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        highCollectionListView.register(GoalListCell.self, forCellWithReuseIdentifier: GoalListCell.identifier)
        highCollectionListView.dataSource = self
        highCollectionListView.delegate = self
        highCollectionListView.backgroundColor = .clear
    }

    // MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalListCell.identifier, for: indexPath) as! GoalListCell
        let model = viewModel.goalLists[indexPath.item]
        cell.model(with: model)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width

        return CGSize(width: width, height: 120)
    }
}
