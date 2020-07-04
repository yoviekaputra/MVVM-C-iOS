//
//  DetailCoordinator.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import Foundation

class DetailCoordinator: BaseCoordinator {
    private var data: TeamModel?
    private var viewModel = TeamDetailViewModel()
    
    init(data: TeamModel) {
        self.data = data
    }
    
    override func start() {
        setupBinding()
        
        let detail = TeamDetailVC()
        detail.viewModel = viewModel
        detail.data = data
        navigationController.present(detail, animated: true)
    }
    
    private func setupBinding() {
        viewModel.didDisappear.subscribe(to: self) { this, _ in
            this.parentCoordinator?.didFinish(coordinator: this)
        }
    }
}
