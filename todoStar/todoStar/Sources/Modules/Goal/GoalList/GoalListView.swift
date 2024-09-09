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

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    // 중요도 높음 리스트
    private let importanceHighView = UIView()
    private let highTitle = UILabel()
    private var highCollectionListView: UICollectionView!

    // 중요도 중간 리스트
    private let importanceMiddleView = UIView()
    private let middleTitle = UILabel()
    private var middleCollectionListView: UICollectionView!

    // 중요도 낮음 리스트
    private let importanceRowView = UIView()
    private let rowTitle = UILabel()
    private var rowCollectionListView: UICollectionView!


    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        viewModel.loadGoal()
        highCollectionListView.reloadData()
        middleCollectionListView.reloadData()
        rowCollectionListView.reloadData()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup Method
    func setupView() {

        addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        // 오토 레이아웃(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        // 오토 레이아웃(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        setupContentView()
    }

    func setupContentView() {
        contentView.addSubview(importanceHighView)
        contentView.addSubview(importanceMiddleView)
        contentView.addSubview(importanceRowView)

        importanceHighView.translatesAutoresizingMaskIntoConstraints = false
        importanceMiddleView.translatesAutoresizingMaskIntoConstraints = false
        importanceRowView.translatesAutoresizingMaskIntoConstraints = false

        // collectionViewHeight
        let importanceViewHeight = viewHeight()

        // importanceHighView 오토 레이아웃
        NSLayoutConstraint.activate([
            importanceHighView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 30),
            importanceHighView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            importanceHighView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            importanceHighView.heightAnchor.constraint(equalToConstant: importanceViewHeight[0] + 30)
        ])

        // importanceMiddleView 오토 레이아웃
        NSLayoutConstraint.activate([
            importanceMiddleView.topAnchor.constraint(equalTo: importanceHighView.bottomAnchor, constant: 40),
            importanceMiddleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            importanceMiddleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            importanceMiddleView.heightAnchor.constraint(equalToConstant: importanceViewHeight[1] + 30)
        ])

        // importanceRowView 오토 레이아웃
        NSLayoutConstraint.activate([
            importanceRowView.topAnchor.constraint(equalTo: importanceMiddleView.bottomAnchor, constant: 40),
            importanceRowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            importanceRowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            importanceRowView.heightAnchor.constraint(equalToConstant: importanceViewHeight[2] + 30),
            importanceRowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])

        subView()
    }


    // MARK: - View
    func subView() {
        collectionViewTitle(view: highTitle, text: "반드시 해야 해요!")
        highCollectionListView = collectionViewList()

        collectionViewTitle(view: middleTitle, text: "해야 하지만 급하지 않아요.")
        middleCollectionListView = collectionViewList()

        collectionViewTitle(view: rowTitle, text: "하고 싶지만 급하지 않아요.")
        rowCollectionListView = collectionViewList()

        importanceHighView.addSubview(highTitle)
        importanceHighView.addSubview(highCollectionListView)

        importanceMiddleView.addSubview(middleTitle)
        importanceMiddleView.addSubview(middleCollectionListView)

        importanceRowView.addSubview(rowTitle)
        importanceRowView.addSubview(rowCollectionListView)

        highTitle.translatesAutoresizingMaskIntoConstraints = false
        highCollectionListView.translatesAutoresizingMaskIntoConstraints = false

        middleTitle.translatesAutoresizingMaskIntoConstraints = false
        middleCollectionListView.translatesAutoresizingMaskIntoConstraints = false

        rowTitle.translatesAutoresizingMaskIntoConstraints = false
        rowCollectionListView.translatesAutoresizingMaskIntoConstraints = false

        // collectionListHeight
        let collectionListHeight = viewHeight()

        // 오토 레이아웃(highTitle)
        NSLayoutConstraint.activate([
            highTitle.topAnchor.constraint(equalTo: importanceHighView.topAnchor),
            highTitle.leadingAnchor.constraint(equalTo: importanceHighView.leadingAnchor),
            highTitle.trailingAnchor.constraint(equalTo: importanceHighView.trailingAnchor),
            highTitle.heightAnchor.constraint(equalToConstant: 20)
        ])

        // 오토 레이아웃(highCollectionListView)
        NSLayoutConstraint.activate([
            highCollectionListView.topAnchor.constraint(equalTo: highTitle.bottomAnchor, constant: 10),
            highCollectionListView.leadingAnchor.constraint(equalTo: importanceHighView.leadingAnchor),
            highCollectionListView.trailingAnchor.constraint(equalTo: importanceHighView.trailingAnchor),
            highCollectionListView.heightAnchor.constraint(equalToConstant: collectionListHeight[0])
        ])

        // 오토 레이아웃(middleTitle)
        NSLayoutConstraint.activate([
            middleTitle.topAnchor.constraint(equalTo: importanceMiddleView.topAnchor),
            middleTitle.leadingAnchor.constraint(equalTo: importanceMiddleView.leadingAnchor),
            middleTitle.trailingAnchor.constraint(equalTo: importanceMiddleView.trailingAnchor),
            middleTitle.heightAnchor.constraint(equalToConstant: 20)
        ])

        // 오토 레이아웃(middleCollectionListView)
        NSLayoutConstraint.activate([
            middleCollectionListView.topAnchor.constraint(equalTo: middleTitle.bottomAnchor, constant: 10),
            middleCollectionListView.leadingAnchor.constraint(equalTo: importanceMiddleView.leadingAnchor),
            middleCollectionListView.trailingAnchor.constraint(equalTo: importanceMiddleView.trailingAnchor),
            middleCollectionListView.heightAnchor.constraint(equalToConstant: collectionListHeight[1])
        ])

        // 오토 레이아웃(rowTitle)
        NSLayoutConstraint.activate([
            rowTitle.topAnchor.constraint(equalTo: importanceRowView.topAnchor),
            rowTitle.leadingAnchor.constraint(equalTo: importanceRowView.leadingAnchor),
            rowTitle.trailingAnchor.constraint(equalTo: importanceRowView.trailingAnchor),
            rowTitle.heightAnchor.constraint(equalToConstant: 20)
        ])

        // 오토 레이아웃(rowCollectionListView)
        NSLayoutConstraint.activate([
            rowCollectionListView.topAnchor.constraint(equalTo: rowTitle.bottomAnchor, constant: 10),
            rowCollectionListView.leadingAnchor.constraint(equalTo: importanceRowView.leadingAnchor),
            rowCollectionListView.trailingAnchor.constraint(equalTo: importanceRowView.trailingAnchor),
            rowCollectionListView.heightAnchor.constraint(equalToConstant: collectionListHeight[2])
        ])
    }

    func collectionViewTitle(view: UILabel, text: String) {
        view.text = text
        view.font = .bodySmallRegular()
        view.textColor = .natural40
    }

    func collectionViewList() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(GoalListCell.self, forCellWithReuseIdentifier: GoalListCell.identifier)
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .clear

        return view
    }

    func viewHeight() -> [CGFloat] {
        var cellCounts: [CGFloat] = []
        let cellModels = [viewModel.highData, viewModel.middleData, viewModel.rowData]
        for model in cellModels {
            let count = model.count
            let height = CGFloat(count * 120)
            let padding = CGFloat((count - 1) * 20)
            let heightAll = height + padding
            cellCounts.append(heightAll)
        }

        return cellCounts
    }


    // MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView == highCollectionListView {
            if viewModel.highData.count == 0 {
                return 1
            } else {
                return viewModel.highData.count
            }
        } else if collectionView == middleCollectionListView {
            if viewModel.middleData.count == 0 {
                return 1
            } else {
                return viewModel.middleData.count
            }
        } else if collectionView == rowCollectionListView {
            if viewModel.rowData.count == 0 {
                return 1
            } else {
                return viewModel.rowData.count
            }
        } else {
            return 0
        }

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalListCell.identifier, for: indexPath) as! GoalListCell
        
        if collectionView == highCollectionListView {
            let model = viewModel.highData[indexPath.item]
            cell.model(with: model)
        } else if collectionView == middleCollectionListView {
            let model = viewModel.middleData[indexPath.item]
            cell.model(with: model)
        } else if collectionView == rowCollectionListView {
            let model = viewModel.rowData[indexPath.item]
            cell.model(with: model)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width

        return CGSize(width: width, height: 120)
    }
}
