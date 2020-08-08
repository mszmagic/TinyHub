# TinyHub (SwiftUI)

<img width="500" alt="image" src="https://github.com/mszmagic/TinyHub/blob/master/Example/example_images/social-image.png?raw=true">

`TinyHubView` は画面の最上部に表示される小さくてエレガントなアラートビューです。このソフトウェアは `SwiftUI` で書かれています。

## 使い方

現在、このフレームワークは `SwiftUI` アプリケーションでのみ機能します。

### タイトルのみ

```swift
TinyHubView(style: .dark, titleText: "Message sent!", isVisible: $isDisplaying, onTap: {
    print("User Tapped")
})
```

<img width="500" alt="image" src="https://github.com/mszmagic/TinyHub/blob/master/Example/example_images/title-only.gif?raw=true">

### 画像付きのタイトル

```swift
TinyHubView(style: .dark, titleText: "Message sent!", systemIconName: "paperplane.fill", isVisible: $isDisplaying, onTap: {
    print("User Tapped")
})
```

<img width="500" alt="image" src="https://github.com/mszmagic/TinyHub/blob/master/Example/example_images/image-title-only.gif?raw=true">

### タップして閉じる

```swift
import TinyHubView
```

ユーザーがアラートをタップしたときにアラートが自動的に閉じるように、 `tapToDismiss` を有効にすることができます。

```swift
TinyHubView(style: .dark, titleText: "Message sent!", isVisible: $isDisplaying, tapToDismiss: true, onTap: {
    print("User Tapped")
})
```

### テキストの色と背景色をカスタマイズ

```swift
TinyHubView(customStyle: CustomStyle(textColor: .white, backgroundColor: .blue), isVisible: $isDisplaying, titleText: "メッセージを送信しました", systemIconName: "paperplane.fill", tapToDismiss: true) {
    print("Tapped")
}
```

`TinyHubView` を利用しているアプリケーション例を見るには、[こちらをクリックしてください](/Example)

## インストール方法：

### Swift Package Manager

1. Xcode内からプロジェクトを開く
2. 上部のシステムバーの"File"をクリック
3. "Swift Packages"をクリック、次いで"Add package dependency…"をクリック
4. 以下のURLをペースト：`https://github.com/mszmagic/TinyHub.git`
5. "Next"をクリック
6. "branch"オプションを選択し、"master"に設定されていることを確認
7. "Done"をクリック。

## ⭐️

このリポジトリへの貢献を温かく歓迎します。Githubのイシューを自由に作成して、質問したり、提案したりすることができます。また、Githubのプルリクエストを自由に作成することもできます。
