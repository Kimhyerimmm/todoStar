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
    private let title: String
    private let dropDownAction: (String) -> Void
    
    private let dropDownButton: UIView
    private let dropDownButtonTitle: UILabel
    private let dropDownButtonIcon: UIImageView
    private let dropDownMenuList: UITableView
    
    
    // MARK: - init
    init(options: [String], title: String, dropDownAction: @escaping (String) -> Void) {
        self.options = options
        self.title = title
        self.dropDownAction = dropDownAction
        
        self.dropDownButton = UIView()
        self.dropDownButtonTitle = UILabel()
        self.dropDownButtonIcon = UIImageView()
        self.dropDownMenuList = UITableView()
        
        super.init(frame: .zero)
        
        dropDownButtonCreate()
        dropDownMenuListCreate()
        
        setUpView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleDropDown))
        dropDownButton.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - view
    private func setUpView() {
        // 뷰 붙이기
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
        cell.textLabel?.font = UIFont.bodyRegular()
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.natural90
        
        let selectedBackGroundView = UIView()
        selectedBackGroundView.backgroundColor = UIColor.natural70
        cell.selectedBackgroundView = selectedBackGroundView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func updateDropDownButtonTitle(to title: String) {
        dropDownButtonTitle.text = title
    }
    
    
    // 드롭다운 버튼
    private func dropDownButtonCreate() {
        let icon = UIImage(named: "down")
        
        dropDownButton.backgroundColor = UIColor.natural90
        dropDownButton.layer.cornerRadius = 10
        
        dropDownButtonTitle.text = title
        dropDownButtonTitle.font = UIFont.bodyMedium()
        dropDownButtonTitle.textColor = UIColor.natural70
        
        dropDownButtonIcon.image = icon
        
        dropDownButtonTitle.translatesAutoresizingMaskIntoConstraints = false
        dropDownButtonIcon.translatesAutoresizingMaskIntoConstraints = false
        
        dropDownButton.addSubview(dropDownButtonTitle)
        dropDownButton.addSubview(dropDownButtonIcon)
        
        NSLayoutConstraint.activate([
            dropDownButtonTitle.leadingAnchor.constraint(equalTo: dropDownButton.leadingAnchor, constant: 20),
            dropDownButtonTitle.centerYAnchor.constraint(equalTo: dropDownButton.centerYAnchor),
            dropDownButtonIcon.trailingAnchor.constraint(equalTo: dropDownButton.trailingAnchor, constant: -20),
            dropDownButtonIcon.centerYAnchor.constraint(equalTo: dropDownButton.centerYAnchor)
        ])
    }
    
    // 드롭다운 테이블 뷰
    private func dropDownMenuListCreate() {
        dropDownMenuList.layer.cornerRadius = 10
        dropDownMenuList.backgroundColor = UIColor.natural90
        dropDownMenuList.isHidden = true
        dropDownMenuList.delegate = self
        dropDownMenuList.dataSource = self
    }
    
    private func resetDropDownButoon() {
        dropDownButtonIcon.image = UIImage(named: "down")
        dropDownButton.backgroundColor = UIColor.natural90
        dropDownButtonTitle.textColor = UIColor.white
    }
    
    
    @objc private func toggleDropDown() {
        let isHidden = dropDownMenuList.isHidden
        dropDownMenuList.isHidden = false
        
        let dropDownIcon = isHidden ? "up" : "down"
        dropDownButtonIcon.image = UIImage(named: dropDownIcon)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.dropDownMenuList.alpha = isHidden ? 1.0 : 0.0
            self.dropDownButton.backgroundColor = isHidden ? UIColor.natural80 : UIColor.natural90
            self.dropDownButtonTitle.textColor = isHidden ? UIColor.natural60 : UIColor.natural70
        }, completion: { _ in
            self.dropDownMenuList.isHidden = !isHidden
        })
        
    }
    
    // MARK: - delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectOption = options[indexPath.row]
        
        updateDropDownButtonTitle(to: selectOption)
        resetDropDownButoon()
        dropDownAction(selectOption)
        tableView.isHidden = true
    }
    
}
