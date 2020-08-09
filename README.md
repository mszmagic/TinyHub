# TinyHub (SwiftUI)

<img width="500" alt="image" src="https://github.com/mszmagic/TinyHub/blob/master/social-image.png?raw=true">

`TinyHubView` は画面の最上部に表示される小さくてエレガントなアラートビューです。このソフトウェアは `SwiftUI` で書かれています。

**現在、このフレームワークは `SwiftUI` アプリケーションでのみ機能します。**

## 使い方

```swift
import TinyHubView
```

```swift
@State var isDisplaying = false
```

### 画像付きのタイトル

➡️ [title-image.swift](/Example/title-image.swift)

```swift
TinyHubView(style: .dark, titleText: "メッセージを送信しました", systemIconName: "paperplane.fill", isVisible: $isDisplaying, onTap: {
    print("Tapped")
})
```

<img width="500" alt="image" src="https://github.com/mszmagic/TinyHub/blob/master/Example/example_images/image-title-only.gif?raw=true">

### （オプション） 進捗バーの表示

 `progressValue` 変数を指定して、進捗レポートを表示できます。

進捗バーは、進捗値が0より大きい場合にのみ表示されます。

➡️ [with-progress-report.swift](/Example/with-progress-report.swift)

```swift
@State var progressValue: Float = 0.0
```

```swift
TinyHubView(style: .dark, titleText: "アセットをダウンロードしています…", systemIconName: "square.and.arrow.down.fill", isVisible: $isDisplaying, progressValue: $progressValue, tapToDismiss: true) {
    print("Tapped")
}
```

<img width="500" alt="image" src="https://github.com/mszmagic/TinyHub/blob/master/Example/example_images/progress-bar.gif?raw=true">

### タイトルのみ

➡️ [title-only.swift](/Example/title-only.swift)

```swift
TinyHubView(style: .dark, titleText: "Message sent!", isVisible: $isDisplaying, onTap: {
    print("User Tapped")
})
```

<img width="500" alt="image" src="https://github.com/mszmagic/TinyHub/blob/master/Example/example_images/title-only.gif?raw=true">

### テキストの色と背景色をカスタマイズ

```swift
TinyHubView(customStyle: CustomStyle(textColor: .white, backgroundColor: .blue), isVisible: $isDisplaying, titleText: "メッセージを送信しました", systemIconName: "paperplane.fill", tapToDismiss: true) {
    print("Tapped")
}
```

`TinyHubView` を利用しているアプリケーション例を見るには、[こちらをクリックしてください](/Example)

## 利用可能なスタイル：

`.light`: ライトテーマ

`.dark`: ダークテーマ

`.success`: 操作の成功を表示

`.info`: ユーザーに情報メッセージを表示

`.warning`: ユーザーにエラーまたは警告メッセージを表示

## インストール方法：

### Swift Package Manager

1. Xcode内からプロジェクトを開く
2. 上部のシステムバーの"File"をクリック
3. "Swift Packages"をクリック、次いで"Add package dependency…"をクリック
4. 以下のURLをペースト：`https://github.com/mszmagic/TinyHub.git`
5. "Next"をクリック
6. "branch"オプションを選択し、"master"に設定されていることを確認
7. "Done"をクリック。

@available(OSX 11, *)
@available(iOS 14, *)

## ⭐️

このリポジトリへの貢献を温かく歓迎します。Githubのイシューを自由に作成して、質問したり、提案したりすることができます。また、Githubのプルリクエストを自由に作成することもできます。
