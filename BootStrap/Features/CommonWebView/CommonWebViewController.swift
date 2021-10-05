//
//  CommonWebViewController.swift
//   
//
//  Created by ISTIAK on 9/5/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import Reusable
import WebKit
import SnapKit

class CommonWebViewController: UIViewController, StoryboardBased, ViewModelBased {
    
    var viewModel: CommonWebViewModel!
    var webView: WKWebView!
    var webURL: String!
    
    override func viewDidLoad() {
        self.setupNavigationBar()
        self.setupWebView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //loadTest()
//        if let url = self.webURL {
//            loadURL(url: url)
//        }
        
        if let _request = viewModel.request {
            webView.load(_request)
        } else {
            showAlert(title: Localised("Error!"), message: Localised("Could not load the request"))
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    private func setupWebView() {
        let config = self.getConfiguration()
        
        self.webView = WKWebView(frame: .zero, configuration: config)
        self.webView.navigationDelegate = self
        self.view.addSubview(self.webView)
        self.webView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
        }
    }
    
    private func loadURL(url: String) {
        if let url = URL(string: url) {
            self.webView.load(URLRequest(url: url))
        }
    }
    
    private func loadTest() {
        let request = URLRequest.init(url: Bundle.main.url(forResource: "index", withExtension: "html")!)
        self.webView.load(request)
    }
    
    private func getConfiguration() -> WKWebViewConfiguration {
        let config = WKWebViewConfiguration()
        return config
    }
}

extension CommonWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated {
            if let url = navigationAction.request.url, //let host = url.host, !host.hasPrefix("www.google.com")
                UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
                decisionHandler(.cancel)
            } else {
                print("Open it locally")
                decisionHandler(.allow)
            }
        } else {
            print("not a user click")
            decisionHandler(.allow)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
}
