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
    
    @State var progressValue: Float = 0.0
    
    var body: some View {
        
        TinyHubView(style: .dark, titleText: "Test", systemIconName: "paperplane.fill", isVisible: $isDisplaying, progressValue: $progressValue, tapToDismiss: true) {
            print("Tapped")
        }
        
        Slider(value: $progressValue)
        
        Button("アラートを表示/非表示") {
            self.isDisplaying.toggle()
        }
        
    }
}
