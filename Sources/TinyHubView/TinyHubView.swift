//
//  TinyHubView.swift
//
//
//  Created by Shunzhe Ma on 8/8/20.
//

import SwiftUI

@available(OSX 11, *)
@available(iOS 14, *)
public struct CustomStyle {
    var textColor: Color
    var backgroundColor: Color
}

public enum TinyHubStyle {
    case light
    case dark
    case success
    case info
    case warning
}

@available(OSX 11, *)
@available(iOS 14, *)
public struct TinyHubView: View {
    
    /*
     ビューのコンテンツ（タイトル、アイコン）
     */
    var titleText: String
    var systemIconName = ""
    
    /*
     スタイル
     */
    var textColor: Color = .white
    var backgroundColor: Color = .black
    
    /*
     ユーザーがビューをタップした場合には、これを消します。
     */
    var tapToDismiss = true
    var tapAction: () -> Void
    
    /*
     内部変数
     */
    @Binding private var isHubVisible: Bool
    
    /*
     Progress Bar
     */
    @Binding public var progressBarValue: Float
    
    /**
     ハブビューを初期化
     
    - parameter style: ハブディスプレイビューのスタイル.
     
    - parameter  titleText: アラートのタイトル用の文字列.
     
    - parameter systemIconName: 使用したいシステムアイコン名を入力してください.
     
    - parameter isVisible: Binding<Bool> ビューハブを表示するかしないかを制御するブーリアン型の変数.
     
    - parameter  tapToDismiss: この変数がtrueに設定されていると、ユーザーがタップするとハブが消えます.
     
    - parameter onTap: ユーザーがハブディスプレイをタップしたときに実行されるアクション.

     # Example #
    ```
     TinyHubView(style: .dark, titleText: "メッセージを送信しました", systemIconName: "paperplane.fill", isVisible: $isDisplaying, tapToDismiss: true, onTap: {
         print("Tapped")
     })
    ```

    */
    public init(style: TinyHubStyle, titleText: String, systemIconName: String = "", isVisible: Binding<Bool>, progressValue: Binding<Float> = Binding.constant(0.0), tapToDismiss: Bool = true, onTap: @escaping () -> Void) {
        switch style {
            case .light:
                textColor = .black
                backgroundColor = .white
            case .dark:
                textColor = .white
                backgroundColor = .black
            case .info:
                textColor = .white
                backgroundColor = .blue
            case .success:
                textColor = .white
                backgroundColor = .green
            case .warning:
                textColor = .white
                backgroundColor = .yellow
        }
        self._isHubVisible = isVisible
        self.titleText = titleText
        self.systemIconName = systemIconName
        self.tapAction = onTap
        self.tapToDismiss = tapToDismiss
        self._progressBarValue = progressValue
    }
    
    /**
     ハブビューを初期化 (テキストの色と背景色をカスタマイズ)
     
     - parameter customStyle: テキストの色と背景色をカスタマイズ

     # Example #
    ```
     TinyHubView(customStyle: CustomStyle(textColor: .white, backgroundColor: .blue), isVisible: $isDisplaying, titleText: "メッセージを送信しました", systemIconName: "paperplane.fill", tapToDismiss: true) {
         print("Tapped")
     }
    ```

    */
    public init(customStyle: CustomStyle, isVisible: Binding<Bool>, progressValue: Binding<Float> = Binding.constant(0.0), titleText: String, systemIconName: String = "", tapToDismiss: Bool = true, onTap: @escaping () -> Void) {
        self.textColor = customStyle.textColor
        self.backgroundColor = customStyle.backgroundColor
        self._isHubVisible = isVisible
        self.titleText = titleText
        self.systemIconName = systemIconName
        self.tapAction = onTap
        self.tapToDismiss = tapToDismiss
        self._progressBarValue = progressValue
    }
    
    
    /*
     ビューの実行
     */
    public var body: some View {
        
        VStack {
            Label(self.titleText, systemImage: self.systemIconName)
                
            if self.progressBarValue != 0.0 {
                ProgressView("", value: self.progressBarValue, total: 1.0)
                    .frame(width: 200, height: 5, alignment: .center)
                    .padding(.top, 10)
            }
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 15)
        .foregroundColor(textColor)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(backgroundColor)
                .shadow(radius: 5)
        )
        .offset(y: isHubVisible ? 0 : -150)
        .animation(.easeInOut, value: self.isHubVisible)
        .onTapGesture {
            // タップイベントについてアプリケーションに伝えます
            self.tapAction()
            // タップが消えるように設定している場合、タブを消します
            if self.tapToDismiss {
                self.isHubVisible = false
            }
        }
        
        Spacer()
        
    }
    
}

@available(OSX 12, *)
@available(iOS 15, *)
public extension View {
    @ViewBuilder
    public func addTinyHubView(style: TinyHubStyle, titleText: String, systemIconName: String = "", isVisible: Binding<Bool>, progressValue: Binding<Float> = Binding.constant(0.0), tapToDismiss: Bool = true, onTap: @escaping () -> Void) -> some View {
        return self.overlay(content: {
            VStack {
                TinyHubView.init(style: style, titleText: titleText, systemIconName: systemIconName, isVisible: isVisible, progressValue: progressValue, tapToDismiss: tapToDismiss, onTap: onTap)
                Spacer()
            }
        })
    }
}
