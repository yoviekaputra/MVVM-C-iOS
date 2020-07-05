//
//  CircleImageView.swift
//  football-app
//
//  Created by Yovi Eka Putra on 05/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    override func layoutSubviews() {
        layer.masksToBounds = false
        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = true
    }
}
