//
//  AppCoordinator.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private var window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let home = HomeCoordinator()
        self.start(coordinator: home)
        
        window.rootViewController = home.navigationController
        window.makeKeyAndVisible()
    }
}
