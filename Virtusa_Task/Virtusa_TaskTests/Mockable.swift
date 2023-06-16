//
//  Mockable.swift
//  Virtusa_TaskTests
//
//  Created by Nitu Warjurkar on 16/06/23.
//

import Foundation

protocol Mockable{
    var bundle: Bundle {get}
    func loadJson<T: Decodable>(filename: String, type: T.Type)-> [T]
}
extension Mockable {
    var bundle: Bundle{
        return Bundle(for: type(of: self) as! AnyClass)
    }
    func loadJson<T: Decodable>(filename: String, type: T.Type)-> [T]{
        guard let path = bundle.url(forResource: "Posts", withExtension: "json") else {fatalError("Unable to Load JSON file") }
        do {
            let data = try Data(contentsOf: path)
            let posts = try JSONDecoder().decode([T].self, from: data)
            return posts
        }catch {
           fatalError("Failed to decode.")
        }
    }
}
