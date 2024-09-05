//
//  SceneDelegate.swift
//  todoStar
//
//  Created by 김혜림 on 8/28/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = UIColor.natural100
        
        // TODO: 네비게이션 바 스타일 변경(아이콘 색상 변경 / 타이틀 빼기)
        UINavigationBar.appearance().tintColor = .white
        
        // 네비게이션 컨트롤러 연결 및 스타일 설정
        let goalMainViewController = GoalMainViewController()
        let storageMainViewController = StorageMainViewController()
        let recordMainViewController = RecordMainViewController()
        let reportMainViewController = ReportMainViewController()
        let settingMainViewController = SettingMainViewController()
        
        let firstNavigationController = CustomNavigationController(rootViewController: goalMainViewController)
        let secondNavigationController = CustomNavigationController(rootViewController: storageMainViewController)
        let thirdNavigationController = CustomNavigationController(rootViewController: recordMainViewController)
        let fourthNavigationController = CustomNavigationController(rootViewController: reportMainViewController)
        let fifthNavigationController = CustomNavigationController(rootViewController: settingMainViewController)

        let thirdMainViewControllerIcon = UIView()
        thirdMainViewControllerIcon.frame = CGRect(x: 0, y: 0, width: 45, height: 38)
        thirdMainViewControllerIcon.backgroundColor = UIColor.primary100
        thirdMainViewControllerIcon.layer.cornerRadius = 10
        thirdMainViewControllerIcon.clipsToBounds = true
        
        let icon = UIImageView(image: UIImage(named: "record"))
        icon.frame = CGRect(x: 0, y: 0, width: 27, height: 27)
        icon.center = CGPoint(x: thirdMainViewControllerIcon.bounds.width / 2,
                              y: thirdMainViewControllerIcon.bounds.height / 2)
        thirdMainViewControllerIcon.addSubview(icon)
        
        let thirdTabBarItemImage = thirdMainViewControllerIcon.asImage().withRenderingMode(.alwaysOriginal)
        
        firstNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "goal"), tag: 0)
        secondNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "storage"), tag: 1)
        thirdNavigationController.tabBarItem = UITabBarItem(title: "", image: thirdTabBarItemImage, tag: 2)
        fourthNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "report"), tag: 3)
        fifthNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "setting"), tag: 4)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstNavigationController,
                                            secondNavigationController,
                                            thirdNavigationController,
                                            fourthNavigationController,
                                            fifthNavigationController]
        tabBarController.tabBar.unselectedItemTintColor = .natural70
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.backgroundColor = .natural100
        
        // tabBarController 높이 조절을 위한 뷰 추가
        let navigationView = UIView()
        navigationView.backgroundColor = UIColor.natural100
        navigationView.addTopBorder(color: UIColor.natural80, thickness: 1)
        navigationView.layer.shadowColor = UIColor.natural100.cgColor
        navigationView.layer.shadowOpacity = 1
        navigationView.layer.shadowOffset = CGSize(width: 0, height: -20)
        navigationView.layer.shadowRadius = 20
        navigationView.layer.shadowPath = UIBezierPath(rect: CGRect(x: -50, y: -20, width: (window?.bounds.width)!+100, height: (window?.bounds.height)!+100)).cgPath
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        window?.addSubview(navigationView)
        
        window?.rootViewController = tabBarController
        
        NSLayoutConstraint.activate([
            navigationView.bottomAnchor.constraint(equalTo: window!.safeAreaLayoutGuide.bottomAnchor),
            navigationView.leadingAnchor.constraint(equalTo: window!.safeAreaLayoutGuide.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: window!.safeAreaLayoutGuide.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

