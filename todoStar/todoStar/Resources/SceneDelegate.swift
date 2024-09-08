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
        
        // tabBarController: viewController
        let goalMainVC = GoalMainViewController()
        let storageMainVC = StorageMainViewController()
        let recordMainVC = RecordMainViewController()
        let reportMainVC = ReportMainViewController()
        let settingMainVC = SettingMainViewController()
        
        // tabBarController: icon
        let iconNames = ["goal", "storage", "record", "report", "setting"]
        var icons: [UIImage] = []

        for name in iconNames {
            guard let icon = UIImage(named: name) else {
                fatalError("\(name) 이미지가 없습니다.")
            }
            icons.append(icon)
        }
        
        // tabBarController: thirdNC icon
        let thirdNCIcon = UIView()
        thirdNCIcon.frame = CGRect(x: 0, y: 0, width: 45, height: 38)
        thirdNCIcon.backgroundColor = UIColor.primary100
        thirdNCIcon.layer.cornerRadius = 10
        thirdNCIcon.clipsToBounds = true

        let icon = UIImageView(image: icons[2])
        icon.frame = CGRect(x: 0, y: 0, width: 27, height: 27)
        icon.center = CGPoint(x: thirdNCIcon.bounds.width / 2,
                              y: thirdNCIcon.bounds.height / 2)
        thirdNCIcon.addSubview(icon)

        let thirdTabBarItemImage = thirdNCIcon.asImage().withRenderingMode(.alwaysOriginal)

        // tabBarController: navigationController
        let firstNC = CustomNavigationController.navigationControllerCreate(rootVC: goalMainVC, image: icons[0], tag: 0)
        let secondNC = CustomNavigationController.navigationControllerCreate(rootVC: storageMainVC, image: icons[1], tag: 1)
        let thirdNC = CustomNavigationController.navigationControllerCreate(rootVC: recordMainVC, image: thirdTabBarItemImage, tag: 2)
        let fourthNC = CustomNavigationController.navigationControllerCreate(rootVC: reportMainVC, image: icons[3], tag: 3)
        let fifthNC = CustomNavigationController.navigationControllerCreate(rootVC: settingMainVC, image: icons[4], tag: 4)

        let navigationControllers = [firstNC, secondNC, thirdNC, fourthNC, fifthNC]
        let tabBarController = CustomTabBarController.tabBarControllerCreate(VC: navigationControllers)

        // tabBarController: height
        let navigationHeightView = CustomTabBarController.tabBarHeightControllView()
        navigationHeightView.translatesAutoresizingMaskIntoConstraints = false
        tabBarController.view.addSubview(navigationHeightView)

        NSLayoutConstraint.activate([
            navigationHeightView.bottomAnchor.constraint(equalTo: tabBarController.tabBar.topAnchor),
            navigationHeightView.leadingAnchor.constraint(equalTo: tabBarController.view.leadingAnchor),
            navigationHeightView.trailingAnchor.constraint(equalTo: tabBarController.view.trailingAnchor),
            navigationHeightView.heightAnchor.constraint(equalToConstant: 10)
        ])

        window?.rootViewController = tabBarController
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

