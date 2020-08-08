//
//  ExampleView.swift
//  TinyHubExampleHub
//
//  Created by Shunzhe Ma on 8/8/20.
//

import SwiftUI

struct ExampleView: View {
    
    /*
     Necessary variables
     */
    @State var isDisplaying = false
    
    var body: some View {
        
        TinyHubView(style: .success, titleText: "メッセージを送信しました", systemIconName: "paperplane.fill", isVisible: $isDisplaying, tapToDismiss: true, onTap: {
            print("Tapped")
        })
        
        Button("アラートを表示/非表示") {
            self.isDisplaying.toggle()
        }
        
    }
}
