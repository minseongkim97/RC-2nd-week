//
//  SceneDelegate.swift
//  ggokio
//
//  Created by MIN SEONG KIM on 2021/06/29.
//

import UIKit
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let center = UNUserNotificationCenter.current()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        print("connected")
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print(error)
            }
        }
        


        let updateContent = UNMutableNotificationContent()
        updateContent.title = "업데이트 사항"
        updateContent.body = "DIARY Font 변경"

        let updateTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)

        let request = UNNotificationRequest(identifier: "update",
                                            content: updateContent,
                                            trigger: updateTrigger)

        center.add(request) { error in
            if let error = error {
                print(error)
            }
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("did disconnect")

        let evalContent = UNMutableNotificationContent()
        evalContent.title = "오늘은 어떠셨나요?"
        evalContent.subtitle = "앱에 대해 평가해주세요"
        evalContent.body = "★ ★ ★ ★ ★"

        let evalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)

        let request = UNNotificationRequest(identifier: "evaluate",
                                            content: evalContent,
                                            trigger: evalTrigger )

        center.add(request) { error in
            if let error = error {
                print(error)
            }
        }
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

