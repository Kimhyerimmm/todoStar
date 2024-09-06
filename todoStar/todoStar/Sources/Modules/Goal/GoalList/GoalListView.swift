//
//  GoalListView.swift
//  todoStar
//
//  Created by 김혜림 on 9/4/24.
//

import UIKit

class GoalListView: UIView {

    // MARK: - Property
    private let viewModel = GoalListViewModel()

    // 중요도 높음 리스트
    private let importanceHighView = UIView()
    private let highTitle = UILabel()
    private let highTableView = UITableView()

    // 중요도 중간 리스트
    private let importanceMiddleView = UIView()
    private let middleTitle = UILabel()
    private let middleTableView = UITableView()

    // 중요도 낮음 리스트
    private let importanceRowView = UIView()
    private let rowTitle = UILabel()
    private let rowTableView = UITableView()


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
            importanceHighView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20)
        ])

        // importanceMiddleView 오토 레이아웃
        NSLayoutConstraint.activate([
            importanceMiddleView.topAnchor.constraint(equalTo: importanceHighView.bottomAnchor, constant: 40),
            importanceMiddleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            importanceMiddleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20)
        ])

        // importanceRowView 오토 레이아웃
        NSLayoutConstraint.activate([
            importanceRowView.topAnchor.constraint(equalTo: importanceMiddleView.bottomAnchor, constant: 40),
            importanceRowView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            importanceRowView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20)
        ])
    }


    // MARK: - View
    // MARK: 중요도 높음 리스트
    
}
