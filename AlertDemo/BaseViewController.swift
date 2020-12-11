//
//  BaseViewController.swift
//  AlertDemo
//
//  Created by Nabin Shrestha on 12/11/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    func showAlert(with title: String, and message: String, actionTitle: String? = "Close") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
