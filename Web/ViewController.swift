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
    
    func loadWebPage(url: String) {
        let myUrl = NSURL(string: url)
        let myRequest = NSURLRequest(URL: myUrl!)
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
    
    func webViewDidStartLoad(webView: UIWebView) {
        aivMyActivity.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        aivMyActivity.stopAnimating()
    }

    @IBAction func btnGotoUrl(sender: UIButton) {
    }
    @IBAction func btnGoSites1(sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    @IBAction func btnGoSite2(sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    @IBAction func btnLoadHtmlString(sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹페이지</p><p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        wvwMy.loadHTMLString(htmlString, baseURL: nil)
        
    }
    @IBAction func btnLoadHtmlFile(sender: UIButton) {
        let myHtmlBundle = NSBundle.mainBundle()
        let filePath = myHtmlBundle.pathForResource("htmlView", ofType: "html")
        loadWebPage(filePath!)
    }
    @IBAction func btnStop(sender: UIBarButtonItem) {
        wvwMy.stopLoading()
    }
    @IBAction func btnReload(sender: UIBarButtonItem) {
        wvwMy.reload()
    }
    @IBAction func btnGoBack(sender: UIBarButtonItem) {
        wvwMy.goBack()
    }
    @IBAction func btnGoForward(sender: UIBarButtonItem) {
        wvwMy.goForward()
    }

}

