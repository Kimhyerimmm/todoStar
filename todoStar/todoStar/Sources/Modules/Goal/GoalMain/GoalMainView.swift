//
//  GoalMainView.swift
//  todoStar
//
//  Created by 김혜림 on 9/3/24.
//

import UIKit

protocol GoalMainViewDelegate: AnyObject {
    func didTapMoreButton()
}

class GoalMainView: UIView, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    weak var delegate: GoalMainViewDelegate?

    // MARK: - Property
    private let viewModel = GoalMainViewModel()
    private var dailyTodoListView: UICollectionView!
    private let restButton = UIButton()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        viewModel.loadGoal()
        dailyTodoListView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        viewModel.loadGoal()
        dailyTodoListView.reloadData()
    }
    
    
    // MARK: - Setup Method
    private func setupView() {
        setupDailyTodoListView()
        
        let weeklyStatusView = weeklyStatusView()
        let dailyTodoTitle = dailyTodoTitle()
        restButton.configuration = buttonWhiteStyle(title: "오늘은 쉴래요!")
        buttonConstraint(button: restButton, in: self)
        
        addSubview(weeklyStatusView)
        addSubview(dailyTodoTitle)
        addSubview(dailyTodoListView)
        addSubview(restButton)
        
        weeklyStatusView.translatesAutoresizingMaskIntoConstraints = false
        dailyTodoTitle.translatesAutoresizingMaskIntoConstraints = false
        dailyTodoListView.translatesAutoresizingMaskIntoConstraints = false
        restButton.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: 오토레이아웃(weekTodo)
        NSLayoutConstraint.activate([
            weeklyStatusView.topAnchor.constraint(equalTo: self.topAnchor),
            weeklyStatusView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            weeklyStatusView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            weeklyStatusView.heightAnchor.constraint(equalToConstant: 230)
        ])
        
        // MARK: 오토레이아웃(dailyTodoTitle)
        NSLayoutConstraint.activate([
            dailyTodoTitle.topAnchor.constraint(equalTo: weeklyStatusView.bottomAnchor, constant: 30),
            dailyTodoTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            dailyTodoTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        // MARK: 오토레이아웃(dailyTodoListView)
        NSLayoutConstraint.activate([
            dailyTodoListView.topAnchor.constraint(equalTo: dailyTodoTitle.bottomAnchor, constant: 10),
            dailyTodoListView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dailyTodoListView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dailyTodoListView.heightAnchor.constraint(equalToConstant: 323)
        ])
        
        // MARK: 오토레이아웃(restButton)
        NSLayoutConstraint.activate([
            restButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -125)
        ])
    }
    
    
    // MARK: - View
    // MARK: 주간 현황
    func weeklyStatusView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.natural100

        let weeklyStatusView = weeklyStatus()
        
        addSubview(view)
        view.addSubview(weeklyStatusView)
        
        weeklyStatusView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weeklyStatusView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weeklyStatusView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weeklyStatusView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
        
        return view
    }
    
    func weeklyStatus() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        
        enum Day: String, CaseIterable {
            case mon = "월"
            case tue = "화"
            case wed = "수"
            case thu = "목"
            case fri = "금"
            case sat = "토"
            case sun = "일"
        }
        
        for day in Day.allCases {
            let dailyTodoStack = dailyStatus(day.rawValue)
            stackView.addArrangedSubview(dailyTodoStack)
        }
        
        return stackView
    }
    
    func dailyStatus(_ title: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 12
        
        let dailyTitle = UILabel()
        dailyTitle.text = title
        dailyTitle.font = .bodySmallRegular()
        dailyTitle.textColor = .natural40
        
        let dailyGoal = UIImageView()
        let emotion: String
        // TODO: 조건에 따라 이미지 들어오도록
        //dailyGoal.image = UIImage(named: emotion)
        dailyGoal.backgroundColor = .natural90
        dailyGoal.layer.cornerRadius = 20
        dailyGoal.clipsToBounds = true
        
        dailyGoal.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dailyGoal.widthAnchor.constraint(equalToConstant: 40),
            dailyGoal.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        stackView.addArrangedSubview(dailyTitle)
        stackView.addArrangedSubview(dailyGoal)
        
        return stackView
    }
    
    // MARK: 오늘 목표
    func dailyTodoTitle() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        
        let title = UILabel()
        title.text = "도전 중인 목표"
        title.font = .subtitleMedium()
        title.textColor = .white
        
        let button = UIButton()
        button.configuration = textButtonStyle(title: "더보기")
        button.addAction(UIAction { _ in
            self.delegate?.didTapMoreButton()
        }, for: .touchUpInside)

        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(button)
        
        return stackView
    }
    
    private func setupDailyTodoListView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 254.0, height: 323.0)
        layout.minimumLineSpacing = 20.0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        dailyTodoListView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        dailyTodoListView.register(CurrentGoalListCell.self, forCellWithReuseIdentifier: CurrentGoalListCell.identifier)
        dailyTodoListView.dataSource = self
        dailyTodoListView.delegate = self
        dailyTodoListView.showsHorizontalScrollIndicator = false
        dailyTodoListView.backgroundColor = .clear
    }
    
    // MARK: - UICollectionViewDataSource & UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.currentGoals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentGoalListCell.identifier, for: indexPath) as! CurrentGoalListCell
        let model = viewModel.currentGoals[indexPath.item]
        cell.model(with: model)
        return cell
    }
}
