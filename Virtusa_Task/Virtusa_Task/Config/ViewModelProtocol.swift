//
//  ViewModelProtocol.swift
//  Virtusa_Task
//
//  Created by Nitu Warjurkar on 19/06/23.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    func fetchSuccess()
    func fetchfailure(message: String)
}
