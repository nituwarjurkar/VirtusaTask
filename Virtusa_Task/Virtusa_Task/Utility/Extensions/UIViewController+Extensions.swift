//
//  UIViewController+Extensions.swift
//  VirtusaTask
//
//  Created by Nitu Warjurkar on 15/06/23.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String, actionTitle: String, completion: (()->())? = nil) {
        let alertController = UIAlertController( title: title,
                                                 message: message,
                                                 preferredStyle: .alert)
        alertController.addAction(UIAlertAction( title: actionTitle,
                                                 style: .default,
                                                 handler: { _ in
            completion?()
        }))
        self.present(alertController, animated: true)
    }
    
}

