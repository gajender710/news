//
//  ContentView.swift
//  News
//
//  Created by Gajender Jangir on 25/04/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkmanager = NetworkManager()

    var body: some View {
        
        NavigationView {
            List(networkmanager.posts) { item in
                NavigationLink(destination: DetailView(url: item.url)) {
                    HStack {
                        Text(String(item.points))
                        Text(item.title)
                    }
                }
                
               
            }
            .navigationTitle("News")
        }
            
        .onAppear {
            networkmanager.fetch()
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
