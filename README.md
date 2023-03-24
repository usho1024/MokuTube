![f179f0ef-1916-cdf3-f5c1-96198160c3df](https://user-images.githubusercontent.com/89927015/226163365-cff802e5-c7a2-42d6-8f53-1cbbacfe2c23.png)

## サービス概要
MokuTubeはYouTube上にある作業用BGMを流しながらゆるっと気軽に参加できるオンライン自習室サービスです。</br>
**“もくもく会をもっとカジュアルに“** がコンセプトです。</br>
基本的には登録不要ですべての機能を使うことができます（ゲストは24時間だけ有効）。</br>
自習室内では常にWebSocketによるリアルタイム通信が行われるので、家にいながら本当の自習室にいるかのような没入感が味わえます。

### 使い方
1. ゲストログイン OR ログイン
1. ルーム一覧からルームを選んで入室
1. 着席する

基本的にこれだけです。</br>
最短3クリックで使えるようになっています。

### ターゲット層
勉強のモチベーションを上げたい独学者（プログラミングに限らず）

### サービスの詳細についてはこちらのQiita記事をご覧ください！
[【個人開発】独学が捗る！オンライン自習室サービスを作りました](https://qiita.com/takasho1024/items/ffb7feca33f0bb61ebe1)

## 主な機能
- ルーム内
  - リアルタイムな座席情報の共有
  - ルームにいるユーザー同士のリアルタイムチャット
  - BGMの視聴
  - 滞在時間の計測（ストップウォッチ）
- ルーム一覧
  - ルームのソート（公式ルーム、ユーザーが多い順、作成日時が新しい順）
  - 動的なページネーション
  - 現在の着席ユーザー人数の表示
- ルームの作成
  - 10種類のアイソメトリックイラストからルームイメージを選択（iStockの素材を使用）
  - YouTube Data APIによる再生リストの自動取得
  - BGMの試聴
- 認証関係、マイページ
  - トークンベースの認証
      - 新規会員登録
      - 一般会員ログイン
      - ゲストログイン（24時間だけ有効）
  - ユーザーの詳細情報の閲覧
  - ユーザーの登録情報の編集

## 使用技術一覧
### フロントエンド
- Nuxt.js 2.15.8（SPAモード）
- Vuetify
- Jest
- ESLint
- Prettier
- 主要なpackage
    - @nuxtjs/axios 
    - @nuxtjs/auth（認証関係）
    - @nuxtjs/google-gtag（Googleアナリティクス用）
    - @nuxtjs/moment（表示日時のフォーマット）
    - actioncable（RailsのActionCableとの提携）
    - vue-youtube（YouTubeIFramePlayerAPIのVue用ラッパー）
    - vuex-persistedstate（Vuexデータの永続化）

### バックエンド
- Ruby 3.1.2
- Rails 6.1.7（APIモード）
- RSpec
- RuboCop
- MySQL 8.0.31
- Nginx
- 主要なGem
    - rack-cors
    - devise_token_auth（アクセストークンの発行）
    - carrierwave（画像アップロード）

### インフラ
- AWS（ECS Fargate, ECR, Route53, ACM, ALB, RDS, S3）
- CircleCI

### 開発環境
- VSCode
- Docker（docker-compose）
- MacBook Air (M1, 2020)

## ER図
![MokuTube drawio](https://user-images.githubusercontent.com/89927015/226162816-f6895e28-f460-446c-9ab4-1f2aa7cfad74.png)

## インフラ構成図
![インフラ構成図 drawio](https://user-images.githubusercontent.com/89927015/226162808-885658ba-c9b4-422b-a956-114d62fbe97b.png)

## 画面遷移図
https://www.figma.com/file/pVENDmlMDRL8bmqPZAZLgh/MokuTube?node-id=0%3A1&t=O7xDJdwuVfVuppbw-1
