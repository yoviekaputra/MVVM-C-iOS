//
//  AboutCoordinator.swift
//  football-app
//
//  Created by Yovi Eka Putra on 05/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import Foundation

class AboutCoordinator: BaseCoordinator {
    private let viewModel = AboutViewModel()
    
    override func start() {
        setupBinding()
        
        let about = AboutVC()
        about.viewModel = viewModel
        navigationController.pushViewController(about, animated: true)
    }
    
    private func setupBinding() {
        viewModel.viewDidDisapear.subscribe(to: self) { this, _ in
            this.parentCoordinator?.didFinish(coordinator: this)
        }
    }
}
