//
//  UIImageView+Extension.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import UIKit

private let imageCache = NSCache<NSString,UIImage>()

extension UIImageView {
    func load(fromUrl: String, placeholder: UIImage? = nil, mode: UIView.ContentMode = .scaleAspectFit) {
        let indicator = getLoadingIndicator()
        let url = URL(string: fromUrl)
        self.backgroundColor = UIColor.clear
        self.contentMode = mode
        
        self.setPlaceholder(placeholder: placeholder, indicator: indicator)
        
        if let cache = imageCache.object(forKey: (url?.absoluteString ?? "") as NSString) {
            self.image = cache
            indicator.removeFromSuperview()
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200,
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else {
                        return
                }
                
                imageCache.setObject(image, forKey: (url?.absoluteString ?? "") as NSString)
                DispatchQueue.main.async {
                    self.image = image
                    indicator.removeFromSuperview()
                }
            }.resume()
        }
    }
    
    private func setPlaceholder(placeholder: UIImage? = nil, indicator: UIView) {
        if let placeholder = placeholder {
            self.image = placeholder
        } else {
            self.addSubview(indicator)
        }
    }
    
    private func getLoadingIndicator() -> UIView {
        let indicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            indicator.style = .medium
        } else {
            indicator.style = .gray
        }
        indicator.center.x = self.frame.width / 2
        indicator.center.y = self.frame.height / 2
        indicator.startAnimating()
        return indicator
    }
}
