//
//  ErrorHandler.swift
//   
//
//  Created by Istiak on 9/7/18.
//

import Foundation

enum AppErrorCodes: Int {
    
    case noInternet = -1009
    case timeOut = -1001
    case serviceUnavailable = 503
}

class ErrorHandler {
    
    let offlineErrorMsg = "インターネット接続がオフラインのようです"
    let unexpectedErrorMsg = "[AC-01] エラーが発生しました。しばらく時間が経っても問題が解決しない場合は事務局にお問合せください"
    
    func showError(appError: AppError, viewController: UIViewController) {
        if appError.code == AppErrorCodes.noInternet.rawValue {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.showErrorView(text: self.offlineErrorMsg, viewController: viewController)
            }
        } else if appError.code == AppErrorCodes.timeOut.rawValue {
            showErrorView(text: offlineErrorMsg, viewController: viewController)
        } else {
            showErrorView(text: unexpectedErrorMsg, viewController: viewController)
        }
    }
    
    static func isErrorViewVisible() -> Bool {
        var isErrorViewVisible = false

        let topViewController = UIApplication.shared.topMostViewController()
        if topViewController is ErrorViewController {
            isErrorViewVisible = true
        }

        return isErrorViewVisible
    }
    
    private func showErrorView(text: String, viewController: UIViewController) {
            let errorAlert = UIAlertController(title: nil, message: text, preferredStyle: UIAlertControllerStyle.alert)
            
            errorAlert.view.tintColor = #colorLiteral(red: 0.9411764706, green: 0.4156862745, blue: 0.6039215686, alpha: 1)
            
            errorAlert.addAction(UIAlertAction(title: "OK",  style: .default, handler: {_ in
              
            }))
            
           viewController.present(errorAlert, animated: true, completion: nil)
    }
}
