//
//  ExampleView.swift
//  TinyHubExampleHub
//
//  Created by Shunzhe Ma on 8/8/20.
//

import SwiftUI
import TinyHubView

struct ExampleView: View {
    
    /*
     Necessary variables
     */
    @State var isDisplaying = false
    
    @State var progressValue: Float = 0.0
    
    var body: some View {
        
        TinyHubView(style: .dark, titleText: "アセットをダウンロードしています…", systemIconName: "square.and.arrow.down.fill", isVisible: $isDisplaying, progressValue: $progressValue, tapToDismiss: true) {
            print("Tapped")
        }
        
        Button("アラートを表示/非表示") {
            self.isDisplaying.toggle()
        }
        
        Slider(value: $progressValue)
        
        Button("進捗バーの表示") {
            Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { (_) in
                self.progressValue += 0.0001
            })
        }
        
    }
}
