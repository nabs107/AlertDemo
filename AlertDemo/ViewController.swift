//
//  ViewController.swift
//  AlertDemo
//
//  Created by Nabin Shrestha on 12/11/20.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var showAlertButton: UIButton! {
        didSet {
            showAlertButton.layer.cornerRadius = 12
            showAlertButton.addTarget(self, action: #selector(showAlertButtonTapped), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var showSecondAlertButton: UIButton! {
        didSet {
            showSecondAlertButton.layer.cornerRadius = 12
            showSecondAlertButton.addTarget(self, action: #selector(showSecondAlertButtonTapped), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var showThirdAlertButton: UIButton! {
        didSet {
            showThirdAlertButton.layer.cornerRadius = 12
            showThirdAlertButton.addTarget(self, action: #selector(showThirdAlertButtonTapped), for: .touchUpInside)
        }
    }

    @IBOutlet weak var showFourthAlertButton: UIButton! {
        didSet {
            showFourthAlertButton.layer.cornerRadius = 12
            showFourthAlertButton.addTarget(self, action: #selector(showFourthAlertButtonTapped), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @objc
    func showAlertButtonTapped() {
        let alert = UIAlertController(title: "Alert 1", message: "This is alert created in this ViewController", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @objc
    func showSecondAlertButtonTapped() {
        showAlert(with: "Alert 2", and: "This alert is shown using BaseViewController.")
    }
    
    @objc
    func showThirdAlertButtonTapped() {
        showAlertDialog(with: "Alert 3", and: "This alert is shown using UIViewController extension.")
    }
    
    @objc
    func showFourthAlertButtonTapped() {
        UIAlertWrapper.presentAlert(title: "Alert 4", message: "This is alert from UIAlertWrapper class.", cancelButtonTitle: "Close", otherButtonTitles: ["Proceed"]) { (index) in
            if index == -1 {
                print("Close button tapped")
            } else if index == 0 {
                print("Proceed button tapped")
            }
        }
    }
}

