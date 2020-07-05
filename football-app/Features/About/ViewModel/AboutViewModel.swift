//
//  AboutViewModel.swift
//  football-app
//
//  Created by Yovi Eka Putra on 05/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import UIKit

class AboutViewModel {
    let avatar = UIImage(named: "me")
    let name = "Yovi Eka Putra"
    let email = "yovi121093@gmail.com"
    let github = "https://github.com/yovi-ep"
    
    let viewDidDisapear = DelegateView<Void>()
}
