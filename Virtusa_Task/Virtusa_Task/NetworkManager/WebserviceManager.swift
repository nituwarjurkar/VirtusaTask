//
//  WebserviceManager.swift
//  Virtusa_Task
//
//  Created by Nitu Warjurkar on 19/06/23.
//

import Foundation

class WebserviceManager {
    
    var httpClient: HttpClientProtocol?
    
    init(httpClient: HttpClientProtocol?) {
        self.httpClient = httpClient
    }
    
    func fetchDetails<T: Codable>()async throws -> [T]? {
        let baseUrl = Constants.baseURL + Endpoints.posts
        guard let url = URL(string: baseUrl)else {return nil}
        
        return try await httpClient?.fetch(url: url)
    }
}



