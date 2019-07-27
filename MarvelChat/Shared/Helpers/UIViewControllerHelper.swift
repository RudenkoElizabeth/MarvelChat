//
//  UIViewControllerHelper.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit.UIViewController

extension UIViewController {
    func showAlertWith(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {
    class func instantiateFromStoryboard(_ name: String, viewController: String? = nil) -> UIViewController {
        let viewControllerName: String = viewController != nil ? viewController! : name
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName)
        return viewController
    }
}
