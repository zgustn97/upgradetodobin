//
//  Mywebview.swift
//  upgradetodobin
//
//  Created by 박현수 on 2021/08/13.
//

import SwiftUI
import WebKit


struct MyWebView:UIViewRepresentable {
    
    var urlToload:String
    
    
    func makeUIView(context: Context ) -> WKWebView {
        
        
        guard let url = URL(string: self.urlToload) else {
            return WKWebView()
        }
        let webview = WKWebView()
        
        webview.load(URLRequest(url:url))
        return webview
    }
    
    func updateUIView(_ uiView:WKWebView, context: UIViewRepresentableContext<MyWebView>) {
        
    }
}
