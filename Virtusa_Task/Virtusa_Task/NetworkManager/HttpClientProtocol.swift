//
//  HttpClientProtocol.swift
//  Virtusa_Task
//
//  Created by Nitu Warjurkar on 16/06/23.
//

import Foundation

protocol HttpClientProtocol{
    func fetch<T: Codable>(url: URL) async throws -> [T] 
}
