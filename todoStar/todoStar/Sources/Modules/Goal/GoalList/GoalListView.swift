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

    }


    // MARK: - View
}
