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
    
// url의 인수를 통해 웹 페이지의 주소를 전달받아 웹 페이지를 보여 줌
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        wvwMy.loadRequest(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wvwMy.delegate = self
        loadWebPage("http://m.naver.com")  // 앱 실행 시 초기 홈페이지를 불러옴
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        // 웹 뷰가 시작될 때 인디케이터를 시작
        aivMyActivity.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // 웹 뷰가 종료될 때 인디케이터를 종료
        aivMyActivity.stopAnimating()
    }
    
    // "http//" 문자열이 없을 경우 자동으로 삽입
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }

    // 테스트 필드에 적힌 주소로 웹 뷰 로딩
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text! = ""
        loadWebPage(myUrl)
    }
    
    // [Site1] 버튼 클릭 시 fallinmac.tistory.com으로 이동
    @IBAction func btnGoSites1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    
    //[Site2] 버튼 클릭 시 blog.2sam.net으로 이동
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    
    // HTML 코드를 변수에 저장하고 [html] 버튼을 클릭하면
    // HTML 문법에 맞게 작성된 문자열 변수를 웹 뷰로 나타냄
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹페이지</p><p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        wvwMy.loadHTMLString(htmlString, baseURL: nil)
        
    }
    
    // htmlView.html을 웹 뷰로 나타냄
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let myHtmlBundle = Bundle.main
        let filePath = myHtmlBundle.path(forResource: "htmlView", ofType: "html")
        loadWebPage(filePath!)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        wvwMy.stopLoading()  // 웹 페이지의 로딩을 중지
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        wvwMy.reload()  // 웹 페이지를 재로딩
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        wvwMy.goBack()  // 이전 웹 페이지로 이동
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        wvwMy.goForward()  // 다음 웹 페이지로 이동
    }

}

