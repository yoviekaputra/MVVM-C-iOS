//
//  TeamDetailVC.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import UIKit

class TeamDetailVC: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    var viewModel: TeamDetailViewModel!
    var data: TeamModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear.accept?(())
    }
}

extension TeamDetailVC {
    private func setupUI() {
        if let data = data {
            avatar.load(fromUrl: data.imageUrl)
            name.text = data.name
            desc.text = data.description
        }
    }
}
