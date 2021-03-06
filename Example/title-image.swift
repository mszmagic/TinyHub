//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/8/20.
//

import SwiftUI
import TinyHubView

struct ContentView: View {
    
    @State var isDisplaying = false
    
    var body: some View {
        TinyHubView(style: .dark, titleText: "メッセージを送信しました", systemIconName: "paperplane.fill", isVisible: $isDisplaying, onTap: {
            print("User Tapped")
        })
        Button("アラートを表示/非表示") {
            self.isDisplaying.toggle()
        }
    }
}
