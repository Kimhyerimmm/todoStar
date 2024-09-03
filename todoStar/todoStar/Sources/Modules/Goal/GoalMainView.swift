//
//  GoalMainView.swift
//  todoStar
//
//  Created by 김혜림 on 9/3/24.
//

import UIKit

class GoalMainView: UIView {
    
    // MARK: - Property
    var dailyTodoTableView = UITableView()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        dailyTodoTableView = dailyTodoList()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        dailyTodoTableView = dailyTodoList()
        setupView()
    }
    
    
    // MARK: - Setup Method
    private func setupView() {
        let weeklyStatusView = weeklyStatusView()
        let dailyTodoView = dailyTodoView()
        let dailyTodoTableView = dailyTodoList()
        
        addSubview(weeklyStatusView)
        addSubview(dailyTodoView)
        addSubview(dailyTodoTableView)
        
        weeklyStatusView.translatesAutoresizingMaskIntoConstraints = false
        dailyTodoView.translatesAutoresizingMaskIntoConstraints = false
        dailyTodoTableView.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: 오토레이아웃(weekTodo)
        NSLayoutConstraint.activate([
            weeklyStatusView.topAnchor.constraint(equalTo: self.topAnchor),
            weeklyStatusView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            weeklyStatusView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            weeklyStatusView.heightAnchor.constraint(equalToConstant: 235)
        ])
        
        // MARK: 오토레이아웃(dailyTodoView)
        NSLayoutConstraint.activate([
            dailyTodoView.topAnchor.constraint(equalTo: weeklyStatusView.bottomAnchor, constant: 40),
            dailyTodoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            dailyTodoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
        
        // MARK: 오토레이아웃(dailyTodoTableView)
        NSLayoutConstraint.activate([
            dailyTodoTableView.topAnchor.constraint(equalTo: weeklyStatusView.bottomAnchor, constant: 100),
            dailyTodoTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            dailyTodoTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
    }
    
    
    // MARK: - View
    // MARK: 주간 현황
    func weeklyStatusView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.natural90
        
        let weeklyStatusView = weeklyStatus()
        
        addSubview(view)
        view.addSubview(weeklyStatusView)
        
        weeklyStatusView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weeklyStatusView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            weeklyStatusView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
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
        let emotion = ""
        dailyGoal.image = UIImage(named: emotion)
        dailyGoal.backgroundColor = .natural80
        dailyGoal.layer.cornerRadius = 17
        dailyGoal.clipsToBounds = true
        
        dailyGoal.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dailyGoal.widthAnchor.constraint(equalToConstant: 34),
            dailyGoal.heightAnchor.constraint(equalToConstant: 34),
        ])
        
        stackView.addArrangedSubview(dailyTitle)
        stackView.addArrangedSubview(dailyGoal)
        
        return stackView
    }
    
    // MARK: 오늘 목표
    func dailyTodoView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        
        let title = dailyTodoTitle()
        //let list = dailyTodoList()
        
        stackView.addArrangedSubview(title)
        //stackView.addArrangedSubview(list)
        
        return stackView
    }
    
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
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(button)
        
        return stackView
    }
    
    func dailyTodoList() -> UITableView {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalToConstant: 323)
        ])
        tableView.backgroundColor = .blue
        
        return tableView
    }
    
}
