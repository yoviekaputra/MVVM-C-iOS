//
//  HomeItemCell.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import UIKit

class HomeItemCell: UITableViewCell {
    static let identifier = "HomeItemCell"
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func binding(model: TeamModel) {
        avatar.load(fromUrl: model.imageUrl)
        title.text = model.name
        subtitle.text = model.description
    }
}
