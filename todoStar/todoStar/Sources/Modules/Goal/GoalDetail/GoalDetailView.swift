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
    var viewModel: GoalDetailViewModel?
    init(goalDetailViewModel: GoalDetailViewModel) {
        self.viewModel = goalDetailViewModel
        super.init(frame: .zero)
        setupView()
    }

    // 뷰 생성
    private let scrollView = UIScrollView()
    private let contentView = UIView()

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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        // 오토레이아웃(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        // 오토레이아웃(contentView)
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
        contentView.addSubview(titleLastGoal)
        contentView.addSubview(importanceView)
        contentView.addSubview(progressStatusView)
        //contentView.addSubview(middleGoalCollectionView)

        titleLastGoal.translatesAutoresizingMaskIntoConstraints = false
        importanceView.translatesAutoresizingMaskIntoConstraints = false
        progressStatusView.translatesAutoresizingMaskIntoConstraints = false
        //middleGoalCollectionView.translatesAutoresizingMaskIntoConstraints = false

        // 오토레이아웃(titleLastGoal)
        NSLayoutConstraint.activate([
            titleLastGoal.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLastGoal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLastGoal.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleLastGoal.heightAnchor.constraint(equalToConstant: 40)
        ])

        // 오토레이아웃(importanceView)
        NSLayoutConstraint.activate([
            importanceView.topAnchor.constraint(equalTo: titleLastGoal.bottomAnchor, constant: 20),
            importanceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            importanceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            importanceView.heightAnchor.constraint(equalToConstant: 96)
        ])

        // 오토레이아웃(progressStatusView)
        NSLayoutConstraint.activate([
            progressStatusView.topAnchor.constraint(equalTo: titleLastGoal.bottomAnchor, constant: 20),
            progressStatusView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            progressStatusView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            progressStatusView.heightAnchor.constraint(equalToConstant: 132)
        ])
        /*
        // 오토레이아웃(middleGoalCollectionView)
        NSLayoutConstraint.activate([
            middleGoalCollectionView.topAnchor.constraint(equalTo: progressStatusView.topAnchor, constant: 20),
            middleGoalCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            middleGoalCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            middleGoalCollectionView.heightAnchor.constraint(equalToConstant: 220),
            middleGoalCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])

        */
        // 데이터 뷰에 넘기기
        if let viewModel = viewModel,
           let goalData = viewModel.selecteGoalData.first {
            titleLastGoalCreate(with: goalData)
        }
    }


    // MARK: - View
    func titleLastGoalCreate(with model: GoalDetailModel) {
        titleLastGoal.text = model.lastGoal
        titleLastGoal.font = .subtitleMedium()
        titleLastGoal.textColor = .white
    }

    func middleGoalCollectionViewCreate() -> UICollectionView {
        let view = UICollectionView()

        return view
    }



    // MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }


    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        if let middleGoal = viewModel?.selecteGoalData.first?.middleGoal[indexPath.item] {

        }

        return cell
    }
}
