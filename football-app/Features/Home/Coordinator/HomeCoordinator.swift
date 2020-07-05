//
//  HomeCoordinator.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import UIKit

class HomeCoordinator: BaseCoordinator {
    private var viewModel: HomeViewModel!
    
    override func start() {
        setupData()
        setupBinding()
        
        let homeVC = HomeVC()
        homeVC.viewModel = viewModel
        self.navigationController = UINavigationController(rootViewController: homeVC)
        self.navigationController.viewControllers = [homeVC]
    }
    
    private func setupData() {
        let repository = DataRepository()
        viewModel = HomeViewModel(repository: repository)
    }
    
    private func setupBinding() {
        viewModel.homeItemSelected.subscribe(to: self) { this, data in
            this.navigateToDetail(data: data)
        }
        
        viewModel.aboutSelected.subscribe(to: self) { this, _ in
            this.navigateToAbout()
        }
        
        viewModel.viewDidDisappear.subscribe(to: self) { this, _ in
            this.parentCoordinator?.didFinish(coordinator: this)
        }
    }
    
    private func navigateToDetail(data: TeamModel) {
        let detail = DetailCoordinator(data: data)
        detail.navigationController = navigationController
        start(coordinator: detail)
    }
    
    private func navigateToAbout() {
        let about = AboutCoordinator()
        about.navigationController = navigationController
        start(coordinator: about)
    }
}
