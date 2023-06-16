//
//  Virtusa_TaskTests
//
//  Created by Nitu Warjurkar on 16/06/23.
//

import Foundation
@testable import Virtusa_Task

class HttpClientMockProtocol: HttpClientProtocol, Mockable{
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        return loadJson(filename: "Posts", type: T.self)
    }
    
    
}
