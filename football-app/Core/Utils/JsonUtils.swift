//
//  JsonUtils.swift
//  football-app
//
//  Created by Yovi Eka Putra on 05/07/20.
//  Copyright © 2020 Yovi Eka Putra. All rights reserved.
//

import Foundation

class JsonUtils {
    func getJson<MODEL>(filename: String, model: MODEL.Type) -> MODEL? where MODEL: Codable {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return try JSONDecoder().decode(model, from: data)
            } catch {
                print("Error Parsing")
            }
        }
        return nil
    }
}
