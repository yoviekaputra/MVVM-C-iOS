//
//  HomeViewModel.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import Foundation

class HomeViewModel {
    let homeItemSelected = DelegateView<TeamModel>()
    let aboutSelected = DelegateView<Void>()
    
    func fetctTeam() -> [TeamModel] {
        return [
            TeamModel(name: "MU", description: "", log: "", imageUrl: "https://upload.wikimedia.org/wikipedia/id/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png"),
            TeamModel(name: "MU", description: "", log: "", imageUrl: "https://upload.wikimedia.org/wikipedia/id/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png"),
            TeamModel(name: "MU", description: "", log: "", imageUrl: "https://upload.wikimedia.org/wikipedia/id/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png"),
            TeamModel(name: "MU", description: "", log: "", imageUrl: "https://upload.wikimedia.org/wikipedia/id/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png"),
            TeamModel(name: "MU", description: "", log: "", imageUrl: "https://upload.wikimedia.org/wikipedia/id/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png")
        ]
    }
}
