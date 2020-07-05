//
//  HomeViewModel.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import Foundation

class HomeViewModel {
    private var repo: DataRepository!
    
    let viewDidDisappear = DelegateView<Void>()
    let homeItemSelected = DelegateView<TeamModel>()
    let aboutSelected = DelegateView<Void>()
    
    init(repository: DataRepository) {
        self.repo = repository
    }
    
    func fetctTeam() -> [TeamModel] {
        return repo.fetchTeams()
    }
}
