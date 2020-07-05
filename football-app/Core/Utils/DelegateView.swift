//
//  DelegateView.swift
//  football-app
//
//  Created by Yovi Eka Putra on 04/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import Foundation

class DelegateView<Input> {
    private(set) var accept: ((Input) -> Void)?
    
    func subscribe<Context: AnyObject>(to context: Context, with onNext: @escaping (Context, Input) -> Void) {
        self.accept = { [weak context] input in
            guard let object = context else {
                return
            }
            onNext(object, input)
        }
    }
}
