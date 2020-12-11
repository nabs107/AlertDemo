//
//  UIAlertWrapper.swift
//  AlertDemo
//
//  Created by Nabin Shrestha on 12/11/20.
//

import UIKit

public final class UIAlertWrapper: NSObject {
    
    private class func topViewController () -> UIViewController {
        let rootViewController = UIApplication.shared.windows.first?.rootViewController
        assert(rootViewController != nil, "App has no keyWindow, cannot present Alert/Action Sheet.")
        return UIAlertWrapper.topVisibleViewController(viewController: rootViewController!)
    }
    
    private class func topVisibleViewController(viewController: UIViewController) -> UIViewController {
        if viewController is UITabBarController {
            return UIAlertWrapper.topVisibleViewController(viewController: (viewController as! UITabBarController).selectedViewController!)
        } else if viewController is UINavigationController {
            return UIAlertWrapper.topVisibleViewController(viewController: (viewController as! UINavigationController).visibleViewController!)
        } else if viewController.presentedViewController != nil {
            return UIAlertWrapper.topVisibleViewController(viewController: viewController.presentedViewController!)
        } else if viewController.children.count > 0 {
            return UIAlertWrapper.topVisibleViewController(viewController: viewController.children.last!)
        }
        return viewController
    }
    
    public class func presentAlert(title: String,
        message: String,
        cancelButtonTitle: String,
        otherButtonTitles: [String]? = nil,
        clickedButtonAtIndex:((_ buttonIndex: Int) -> Void)? = nil) {
         
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler:
            {(alert: UIAlertAction) in
                if let _clickedButtonAtIndex = clickedButtonAtIndex {
                    _clickedButtonAtIndex(-1)
                }
        }))
        
        if let _otherButtonTitles = otherButtonTitles {
            for (index, string) in _otherButtonTitles.enumerated() {
                alert.addAction(UIAlertAction(title: string, style: .default, handler:
                    {(alert: UIAlertAction) in
                        if let _clickedButtonAtIndex = clickedButtonAtIndex {
                            _clickedButtonAtIndex(index)
                        }
                }))
            }
        }
        
        let currentViewController = UIAlertWrapper.topViewController()
        currentViewController.present(alert, animated: true, completion: nil)
    }
    
    public class func presentActionSheet(title: String?,
        cancelButtonTitle: String,
        otherButtonTitles: [String],
        clickedButtonAtIndex:((_ buttonIndex: Int) -> Void)? = nil) {
            
        let currentViewController = UIAlertWrapper.topViewController()
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler:
            {(alert: UIAlertAction) in
                if let _clickedButtonAtIndex = clickedButtonAtIndex {
                    _clickedButtonAtIndex(-1)
                }
        }))
        
        for (index, string) in otherButtonTitles.enumerated() {
            alert.addAction(UIAlertAction(title: string, style: .default, handler:
                {(alert: UIAlertAction) in
                    if let _clickedButtonAtIndex = clickedButtonAtIndex {
                        _clickedButtonAtIndex(index)
                    }
            }))
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
//            switch presententionStyle {
//            case let .Rect(rect):
//                alert.popoverPresentationController?.sourceView = currentViewController.view
//                alert.popoverPresentationController?.sourceRect = rect
//            case let .BarButton(barButton):
//                alert.popoverPresentationController?.barButtonItem = barButton
//            }
        }
        
        currentViewController.present(alert, animated: true, completion: nil)
    }
}
