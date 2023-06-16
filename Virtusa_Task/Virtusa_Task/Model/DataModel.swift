//
//  DataModel.swift
//  Virtusa_Task
//
//  Created by Nitu Warjurkar on 16/06/23.
//

import Foundation

// MARK: - WelcomeElement
struct DataModel: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Posts = [DataModel]
