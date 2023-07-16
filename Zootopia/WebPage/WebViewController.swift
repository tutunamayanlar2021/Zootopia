//
//  WebViewController.swift
//  Zootopia
//
//  Created by Kader Oral on 16.07.2023.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: URL(string: url ?? "https://developer.apple.com/forums/thread/670047")!))
    }
}
