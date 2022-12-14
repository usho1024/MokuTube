## 【テーマ】

### ◇サービス名
まっちれぽ

### ◇概要
恋愛マッチングアプリに存在する要注意ユーザーの情報を共有できるサービスです。
このサービスを使えば「仲良くなって会いに行ったらマルチの勧誘をされた…」等の被害を未然に防ぐことができます。

### ◇テーマを選んだ理由
過去にマッチングアプリでビジネス関連の勧誘をされたことがあったから
興味本位で勧誘をしている集会所に行ってみたが、話半分で聞いていたので幸い被害はなかった
しかし現場で多くの人たちが詐欺師に騙されているところを目の当たりにしてマッチングアプリの闇を知った
事前に相手の素性を知ることができるようなサービスがあればこのような場面は回避できると思った

アムウェイや事業者集団『環境』などの悪質詐欺グループによる被害が現在社会的に大きな問題となっているから
自分のポートフォリオがこの問題解決の一助になるのではないかと考えた


## 【機能一覧】

### ◇会員関連
- 新規登録/ログイン
- Twitterログイン
- ゲストログイン
- 会員情報編集
- 閲覧履歴

### ◇投稿関連
- 要注意ユーザーに関する情報の投稿※
- レビュー
- レビューへのいいね
- 投稿一覧
- ソート
- 無限スクロール
- 投稿詳細

### ◇その他
- 要注意ユーザーの検索（複数条件指定・ソート可）
- 直近一週間の投稿のPVランキング
- 統計表示
- ゲストログインがログイン後24時間で論理削除されるバッチ処理
- お問合せ
- レスポンシブデザイン

※画像アップロードはできない（肖像権の侵害になり得る&トラブル防止の為）


## 【使用技術一覧】

### ◇フロントエンド
- HTML / CSS
- JavaScript
- Nuxt.js 2.15.8（SPAモード）
- Vuetify (UIフレームワーク)
- Jest（テスト）
- eslint/Prettier(コード解析ツール)

### ◇バックエンド
- Ruby 3.1.2
- Ruby on Rails 6.1.7(APIモード)
- RSpec（テスト）
- RuboCop(コード解析ツール)
- MySQL 8.0.31

### ◇インフラ
- AWS（ECR / ECS(Fargate) / VPC / Route53 / ALB / RDS / S3 / ACM / SSM / CloudWatch / CodeBuild）
- CircleCI
- Terraform(インフラのコード管理)

### ◇開発環境
- VScode
- Docker/docker-compose
