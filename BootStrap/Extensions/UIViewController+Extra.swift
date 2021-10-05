//
//  UIViewController+Extra.swift
//   
//
//  Created by Istiak on 12/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

// MARK: - UIViewController extension
/// This extesion adds some useful functions to UIViewController.
public extension UIViewController {

    /// - Parameter tableView: UITableView to be delected.
    func smoothlyDeselectRows(tableView: UITableView) {
        let selectedIndexPaths = tableView.indexPathsForSelectedRows ?? []

        if let coordinator = transitionCoordinator {
            coordinator.animateAlongsideTransition(in: parent?.view, animation: { coordinatorContext in
                selectedIndexPaths.forEach {
                    tableView.deselectRow(at: $0, animated: coordinatorContext.isAnimated)
                }
            }, completion: { coordinatorContext in
                if coordinatorContext.isCancelled {
                    selectedIndexPaths.forEach {
                        tableView.selectRow(at: $0, animated: false, scrollPosition: .none)
                    }
                }
            })
        } else {
            selectedIndexPaths.forEach {
                tableView.deselectRow(at: $0, animated: false)
            }
        }
    }

    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        self.present(alert, animated: true, completion: nil)
    }

    func showRetryAlert(_ handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: Localised("No Internet"), message: Localised("Please try again"), preferredStyle: .alert)
        let retryAction = UIAlertAction(title: Localised("Retry"), style: .default, handler: handler)
        alert.addAction(retryAction)
        present(alert, animated: true) {}
    }

    func backAction(buttonImage image: UIImage = #imageLiteral(resourceName: "backIcon"), action: Selector) {
        let backButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
        self.navigationItem.leftBarButtonItem = backButtonItem
    }

    func backAction(buttonTitle: String, action: Selector) {
        let backButtonItem = UIBarButtonItem(title: Localised(buttonTitle), style: .plain, target: self, action: action)
        backButtonItem.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont(name: "HiraginoSans-W3", size: 14)!,
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1)
            ], for: .normal)
        self.navigationItem.leftBarButtonItem = backButtonItem
    }

    func setupNavigationBar() {
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "backIcon")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "backIcon")
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
    func rightAction(buttonTitle title: String, action: Selector) {
        let rightButtonItem = UIBarButtonItem(title: Localised(title), style: .plain, target: self, action: action)
        rightButtonItem.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont(name: "HiraginoSans-W3", size: 14)!,
            NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.9960784314, green: 0.3803921569, blue: 0.6392156863, alpha: 1)
            ], for: .normal)
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }

    func showNotificationPermissionAlert(_ handler: ((UIAlertAction) -> Void)?) {
        let settingsAction = Localised("Settings")
        let cancelAction = Localised("Cancel")
        let message = Localised("Your need to give a permission from notification settings.")
        let alertController = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)

        alertController.addAction(UIAlertAction(title: settingsAction, style: .default, handler: {_ in
            DispatchQueue.main.async {
                guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                    return
                }

                if UIApplication.shared.canOpenURL(settingsUrl) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(settingsUrl, completionHandler: {_ in
                        })
                    } else {
                        UIApplication.shared.openURL(settingsUrl as URL)
                    }
                }
            }
        }))

        alertController.addAction(UIAlertAction(title: cancelAction, style: .cancel, handler: handler))

        present(alertController, animated: true, completion: nil)
    }

}

extension UINavigationController {
    func previousViewController() -> UIViewController? {
        let lenght = self.viewControllers.count
        let previousViewController: UIViewController? = lenght >= 2 ? self.viewControllers[lenght-2] : nil
        return previousViewController
    }

}

extension UIViewController {
    var tabbarHeight: CGFloat {
        guard let _tabbar = self.tabBarController?.tabBar else {
            return 0
        }
        return _tabbar.bounds.height
    }
}
