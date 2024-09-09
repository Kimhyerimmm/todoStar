//
//  GoalDetailView.swift
//  todoStar
//
//  Created by 김혜림 on 9/9/24.
//

import UIKit

class GoalDetailView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - Property
    // 데이터모델 연결
    var goalDetailViewModel: GoalDetailViewModel?
    init(goalDetailViewModel: GoalDetailViewModel) {
        self.goalDetailViewModel = goalDetailViewModel
        super.init(frame: .zero)
        setupView()
    }

    // 뷰 생성
    private let scroll = UIScrollView()
    private let content = UIView()

    private let titleLastGoal = UILabel()
    private let importanceView = UIView()
    private let progressStatusView = UIView()
    private var middleGoalCollectionView: UICollectionView!



    // MARK: - Life Cycle
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


    // MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }


    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()

        return cell
    }
}
