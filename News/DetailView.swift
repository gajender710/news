//
//  DetailView.swift
//  News
//
//  Created by Gajender Jangir on 25/04/22.
//

import SwiftUI
import WebKit

struct DetailView: View {
    var url:String?
    var body: some View {
        webView(urlstring: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}


// here we are using UIRep.. to show web view with help uikit component WKWebView
struct webView : UIViewRepresentable{
    
    let urlstring : String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let safestring = urlstring{
            if let url = URL(string: safestring){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
