//
//  ViewController.swift
//  Web
//
//  Created by Hakchin Kim on 9/8/16.
//  Copyright © 2016 Hakchin Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var txtUrl: UITextField!
    
    @IBOutlet weak var wvwMy: UIWebView!
    
    @IBOutlet weak var aivMyActivity: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        wvwMy.loadRequest(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wvwMy.delegate = self
        loadWebPage("http://m.naver.com")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        aivMyActivity.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        aivMyActivity.stopAnimating()
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }

    @IBAction func btnGotoUrl(_ sender: UIButton) {
    }
    @IBAction func btnGoSites1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹페이지</p><p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        wvwMy.loadHTMLString(htmlString, baseURL: nil)
        
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let myHtmlBundle = Bundle.main
        let filePath = myHtmlBundle.path(forResource: "htmlView", ofType: "html")
        loadWebPage(filePath!)
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        wvwMy.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        wvwMy.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        wvwMy.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        wvwMy.goForward()
    }

}

