//
//  GoalDetailView.swift
//  todoStar
//
//  Created by 김혜림 on 9/9/24.
//

import UIKit

protocol GoalDetailViewDelegate: AnyObject {
    func didEditButton()
}

class GoalDetailView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    weak var delegate: GoalDetailViewDelegate?

    // MARK: - Property
    // 데이터모델 연결
    var viewModel: GoalDetailViewModel? {
        didSet {
            updateViews()
        }
    }


    // 뷰 생성
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let titleLastGoal = UIView()
    private let importanceView = UIView()
    private let progressStatusView = UIView()
    private var middleGoalCollectionView: UICollectionView!
    private var button: CustomSwitchButton<GoalDetailViewModel>!

    init(goalDetailViewModel: GoalDetailViewModel) {
        self.viewModel = goalDetailViewModel
        super.init(frame: .zero)
        setupView()
    }



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
        // 데이터 뷰에 넘기기
        if let viewModel = viewModel,
           let goalData = viewModel.selecteGoalData.first {
            titleLastGoalSetup(with: goalData)
            importanceViewSetup(with: goalData)
            progressStatusViewSetup(with: goalData)
        }

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
            titleLastGoal.heightAnchor.constraint(equalToConstant: 102)
        ])

        // 오토레이아웃(importanceView)
        NSLayoutConstraint.activate([
            importanceView.topAnchor.constraint(equalTo: titleLastGoal.bottomAnchor, constant: 20),
            importanceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            importanceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            importanceView.heightAnchor.constraint(equalToConstant: 102)
        ])

        // 오토레이아웃(progressStatusView)
        NSLayoutConstraint.activate([
            progressStatusView.topAnchor.constraint(equalTo: importanceView.bottomAnchor, constant: 20),
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


    }


    // MARK: - View
    // MARK: - viewTitle And editButton
    func viewTitle(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .bodySmallRegular()
        label.textColor = .natural40

        return label
    }

    func viewEditButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "storage"), for: .normal)
        button.addAction(UIAction { _ in
            self.delegate?.didEditButton()
        }, for: .touchUpInside)

        return button
    }

    func viewTitleSet(text: String) -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

        let title = viewTitle(title: text)
        let button = viewEditButton()

        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(button)

        return stackView
    }



    // MARK: - titleLastGoal
    func titleLastGoalSetup(with model: GoalDetailModel) {
        titleLastGoal.backgroundColor = .natural90
        titleLastGoal.layer.cornerRadius = 10

        let title = viewTitleSet(text: "최종 목표")
        let titleLastGoalText = UILabel()
        titleLastGoalText.text = model.lastGoal
        titleLastGoalText.font = .subtitleMedium()
        titleLastGoalText.textColor = .white

        titleLastGoal.addSubview(title)
        titleLastGoal.addSubview(titleLastGoalText)

        title.translatesAutoresizingMaskIntoConstraints = false
        titleLastGoalText.translatesAutoresizingMaskIntoConstraints = false

        // 오토레이아웃(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: titleLastGoal.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: titleLastGoal.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: titleLastGoal.trailingAnchor, constant: -20)
        ])

        // 오토레이아웃(titleLastGoalText)
        NSLayoutConstraint.activate([
            titleLastGoalText.bottomAnchor.constraint(equalTo: titleLastGoal.bottomAnchor, constant: -20),
            titleLastGoalText.leadingAnchor.constraint(equalTo: titleLastGoal.leadingAnchor, constant: 20),
            titleLastGoalText.trailingAnchor.constraint(equalTo: titleLastGoal.trailingAnchor, constant: -20)
        ])
    }

    // MARK: - importanceView
    func importanceViewSetup(with model: GoalDetailModel) {
        importanceView.backgroundColor = .natural90
        importanceView.layer.cornerRadius = 10

        let title = viewTitleSet(text: "중요도")
        let importanceText = UILabel()
        importanceText.text = model.importance
        importanceText.font = .subtitleMedium()
        importanceText.textColor = .white

        importanceView.addSubview(title)
        importanceView.addSubview(importanceText)

        title.translatesAutoresizingMaskIntoConstraints = false
        importanceText.translatesAutoresizingMaskIntoConstraints = false
        
        // 오토레이아웃(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: importanceView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: importanceView.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: importanceView.trailingAnchor, constant: -20)
        ])

        // 오토레이아웃(importanceText)
        NSLayoutConstraint.activate([
            importanceText.bottomAnchor.constraint(equalTo: importanceView.bottomAnchor, constant: -20),
            importanceText.leadingAnchor.constraint(equalTo: importanceView.leadingAnchor, constant: 20),
            importanceText.trailingAnchor.constraint(equalTo: importanceView.trailingAnchor, constant: -20)
        ])
    }



    // MARK: - progresStatusView
    func progressStatusViewSetup(with model: GoalDetailModel) {
        progressStatusView.backgroundColor = .natural90
        progressStatusView.layer.cornerRadius = 10

        let title = viewTitle(title: "목표 상태")
        button = CustomSwitchButton(viewModel: viewModel!)

        progressStatusView.addSubview(title)
        progressStatusView.addSubview(button)

        title.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        // 오토레이아웃(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: progressStatusView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: progressStatusView.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: progressStatusView.trailingAnchor, constant: -20)
        ])

        // 오토레이아웃(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: progressStatusView.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: progressStatusView.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: progressStatusView.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
    }



    // MARK: - middleGoalCollectionView
    func middleGoalCollectionViewSetup() -> UICollectionView {
        let view = UICollectionView()

        return view
    }


    // MARK: - Method
    func updateViews() {
        if let viewModel = viewModel, let goalData = viewModel.selecteGoalData.first {
            titleLastGoalSetup(with: goalData)
            importanceViewSetup(with: goalData)
            progressStatusViewSetup(with: goalData)
        }
    }



    // MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }


    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        if (viewModel?.selecteGoalData.first?.middleGoal[indexPath.item]) != nil {

        }

        return cell
    }
}
