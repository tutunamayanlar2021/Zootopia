//
//  UIViewController.swift
//  Zootopia
//
//  Created by Kader Oral on 16.07.2023.
//

import UIKit

extension UIViewController {
    static func getCurrentViewController() -> UIViewController? {
        guard let window = UIApplication.shared.keyWindow,
              let rootViewController = window.rootViewController else {
            return nil
        }
        
        var currentViewController: UIViewController? = rootViewController
        while let presentedViewController = currentViewController?.presentedViewController {
            currentViewController = presentedViewController
        }
        
        return currentViewController
    }
}
