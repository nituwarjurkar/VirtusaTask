//
//  ViewModel.swift
//  Virtusa_Task
//
//  Created by Nitu Warjurkar on 16/06/23.
//

import Foundation


class ViewModel {
    
    var posts : Posts?
    weak var delegate: ViewModelProtocol?
    var webserviceManager = WebserviceManager(httpClient: HttpClient())
    
    init(delegate:ViewModelProtocol?) {
        self.delegate = delegate
    }
    
     func fetchPosts(){
        Task {
            do {
                posts = try await webserviceManager.fetchDetails() ?? []
                delegate?.fetchSuccess()
            }catch {
                delegate?.fetchfailure(message: AlertFailure.message)
            }
        }
    }
}
