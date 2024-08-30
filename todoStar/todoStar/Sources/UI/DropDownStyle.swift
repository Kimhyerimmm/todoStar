//
//  DropDownStyle.swift
//  todoStar
//
//  Created by 김혜림 on 8/30/24.
//

import UIKit

class DropDownMenu: UIView, UITableViewDelegate, UITableViewDataSource {
    // MARK: - property
    // 드롭다운 데이터
    private let options: [String]
    private let dropDownAction: (String) -> Void
    
    // 드롭다운 버튼
    private let dropDownButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .natural90
        config.baseForegroundColor = .white
        config.background.cornerRadius = 10
//        button.titleLabel?.font = UIFont.bodyMedium()
//        button.backgroundColor = .natural90
//        button.tintColor = .white
//        button.layer.cornerRadius = 10
//        button.contentHorizontalAlignment = .left
        
        var titleAttr = AttributedString("Select an option")
            titleAttr.font = UIFont.bodyMedium() // 폰트 스타일 설정
            titleAttr.foregroundColor = UIColor.white // 텍스트 색상 설정

            config.attributedTitle = titleAttr
        
        button.configuration = config
        
        return button
    }()
    
    // 드롭다운 테이블 뷰
    private let dropDownMenuList: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 10
        tableView.isHidden = true
        
        return tableView
    }()
    
    
    // MARK: - init
    init(options: [String], dropDownAction: @escaping (String) -> Void) {
        self.options = options
        self.dropDownAction = dropDownAction
        
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - view
    private func setUpView() {
        // 버튼 기본 설정
        dropDownButton.setTitle("선택해주세요.", for: .normal)
        dropDownButton.addAction(UIAction { _ in
            self.toggleDropDown()
        }, for: .touchUpInside)
        
        
        // 테이블 뷰 기본 설정
        dropDownMenuList.delegate = self
        dropDownMenuList.dataSource = self
        addSubview(dropDownButton)
        addSubview(dropDownMenuList)
        
        // 레이아웃
        dropDownButton.translatesAutoresizingMaskIntoConstraints = false
        dropDownMenuList.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // dropDownButton 레이아웃
                    dropDownButton.leadingAnchor.constraint(equalTo: leadingAnchor),
                    dropDownButton.trailingAnchor.constraint(equalTo: trailingAnchor),
                    dropDownButton.topAnchor.constraint(equalTo: topAnchor),
                    dropDownButton.heightAnchor.constraint(equalToConstant: 60),
                    
                    // dropDownMenuList 레이아웃
                    dropDownMenuList.leadingAnchor.constraint(equalTo: leadingAnchor),
                    dropDownMenuList.trailingAnchor.constraint(equalTo: trailingAnchor),
                    dropDownMenuList.topAnchor.constraint(equalTo: dropDownButton.bottomAnchor),
                    dropDownMenuList.heightAnchor.constraint(equalToConstant: 120)
        ])
    }

    
    
    // MARK: - function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = options[indexPath.row]
        
        return cell
    }
    
    func updateDropDownButtonTitle(to title: String) {
        UIView.animate(withDuration: 0.3) {
            self.dropDownButton.setTitle(title, for: .normal)
            self.layoutIfNeeded()
        }
    }
    
    @objc private func toggleDropDown() {
        dropDownMenuList.isHidden.toggle()
    }
    
    // MARK: - delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectOption = options[indexPath.row]
        dropDownButton.setTitle(selectOption, for: .normal)
        dropDownAction(selectOption)
        tableView.isHidden = true
    }
    
}
