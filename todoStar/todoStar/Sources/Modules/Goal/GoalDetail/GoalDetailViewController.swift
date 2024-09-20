//
//  GoalDetailViewController.swift
//  todoStar
//
//  Created by 김혜림 on 9/9/24.
//

import UIKit

class GoalDetailViewController: UIViewController, GoalDetailViewDelegate {

    // MARK: - Property
    let setView = GoalDetailView()
    let viewModel: GoalDetailViewModel

    init(goalDetailViewModel: GoalDetailViewModel) {
        self.viewModel = goalDetailViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - Life Cycle
    override func loadView() {
        self.view = GoalDetailView(goalDetailViewModel: viewModel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // MARK: - Navigation Bar
        // 타이틀 설정
        let navigationTitle = CustomNavigationController.navigationTitle(title: "상세 목표")
        self.navigationItem.titleView = navigationTitle.titleView

        // 우측 버튼 설정
        let rightBarButtonItem = CustomNavigationController.setupRightBarButton(
            withImage: "cancle",
            target: self,
            action: UIAction { _ in
                if let tabBarController = self.navigationController?.tabBarController {
                    // 탭 바의 첫 번째 탭 선택
                    tabBarController.selectedIndex = 0

                    // 네비게이션 스택 초기화
                    if let navigationController = tabBarController.viewControllers?[0] as? UINavigationController {
                        navigationController.popToRootViewController(animated: false)
                    }
                }
            }
        )
        self.navigationItem.rightBarButtonItems = rightBarButtonItem

        let appearanceBar = UINavigationBarAppearance()
        appearanceBar.configureWithOpaqueBackground()  // 반투명 효과 제거
        appearanceBar.backgroundColor = .natural100 // 원하는 색상
        navigationController?.navigationBar.standardAppearance = appearanceBar
        navigationController?.navigationBar.scrollEdgeAppearance = appearanceBar
        
//        var button: CustomSwitchButton<GoalDetailViewModel>!
//        button = CustomSwitchButton(viewModel: viewModel,
//                                    onText: "진행 중",
//                                    offText: "보관 중",
//                                    parentView: view)
//
//        view.addSubview(button)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//
//        // 오토레이아웃(button)
//        NSLayoutConstraint.activate([
//            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
//            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            button.heightAnchor.constraint(equalToConstant: 60)
//        ])
    }

    // MARK: - Method
    // 편집 버튼 액션
    func didEditButton() {
        // TODO: 편집 팝업 뜨도록
    }
}
