# SHIENについて
<img width="1438" alt="スクリーンショット 2021-01-22 0 53 21" src="https://user-images.githubusercontent.com/69615045/105375733-5055c400-5c4c-11eb-95d8-9da1aa60ac48.png">
SHIENは案件管理を行えるCRMツールです！<br>
案件を登録したり、登録したデータをcsv出力することできます。<br>


主要な機能は以下の通りです。
- csv出力機能
- 通知機能
- 案件管理機能
- 案件検索機能
- ユーザー管理機能
- チーム作成機能

# URL
URL
http://www.sh1en.com/

basic認証
 ID:sh1en
 PW:sh1en

github
https://github.com/nyappy15ch/SHIEN

# 使用技術

### サーバーサイド
- Ruby(2.6.5)
- RubyOnRails(6.0.0)

### フロントサイド
- Javascript
- bootstrap
- YubinBango(郵便番号から住所を自動保管するライブラリ)

### DB
- MySQL

### インフラ
- AWS(EC2,Route53)
- Capistrano
![SHIEN_cloud構成図](https://user-images.githubusercontent.com/69615045/105365464-a07b5900-5c41-11eb-85da-ae79041fd19c.png)

### Webサーバー
- nginx

### Appサーバー
- unicorn

### 本番DB
- MariaDB

# 注力した点

**①検索結果をcsv出力できるようにしました**

検索した結果全てを、csv出力できるようにしました。<br>
検索結果を出力したい時があると考え、実装しました。

![検索結果の出力](https://user-images.githubusercontent.com/69615045/105373845-6febed00-5c4a-11eb-85f3-443be59c21cb.gif)



**②検索結果から任意のデータをcsv出力できるようにしました**

チェックボックスを用意し、チェックが入った結果のみcsv出力できるようにしました。<br>
DBから任意のデータを取り出しやすくするために実装しました。

![任意のデータを出力](https://user-images.githubusercontent.com/69615045/105370214-b2132f80-5c46-11eb-8ef2-fc37311b2055.gif)



**③ワンクリックで、チェックを全て外せるようにしました**

ボタンをクリックすれば、チェックを全て外せるようにしました。<br>
複数チェックした時、解除する手間があると考え実装しました。

![ワンクリックでチェック解除](https://user-images.githubusercontent.com/69615045/105370553-0a4a3180-5c47-11eb-9bee-394b40140189.gif)



**④検索結果が1件だった時、詳細ページへ遷移するようにしました**

検索結果が1件だけの時、詳細ページへ遷移します。<br>
ユーザーがクリックする手間を省くために実装しました。

![詳細ページへ遷移](https://user-images.githubusercontent.com/69615045/105372951-7cbc1100-5c49-11eb-9af0-cf5771cf3117.gif)



**⑤郵便番号から住所を自動で補完する機能をつけました**

郵便番号を入力するだけで、住所が補完されるようにしました。<br>
案件登録は入力項目が多いので、手間を省くために実装しました。

![住所自動保管](https://user-images.githubusercontent.com/69615045/105374404-07e9d680-5c4b-11eb-9388-eec3a9e408e0.gif)



**⑥通知に既読機能をつけ、未読のものをわかりやすくしました**

JSを使って、未読の通知は色が変わるようにしました。<br>
ユーザーが対応漏れを防ぐために実装しました。

![通知の既読機能](https://user-images.githubusercontent.com/69615045/105373070-a07f5700-5c49-11eb-822f-82b606913323.gif)



# 苦労した点・そこから学んだこと

【苦労したこと】<br>
機能を実装する際、やり方ばかりみてしまう癖に苦労しました。

【学んだこと】<br>
「どうしたら自分の意図した状態になるか？」ということを常に考えることを学びました。


実装中、やり方ばかりを求めていることに気づきました。

そこから、どうしたら自分の意図した状態になるだろうか？と考えるようになりました。

その結果、まずは自分なりに考えて実装してみるという癖がつきました。

# 今後実装予定の機能

- TwitterAPIを使用し、トレンドを表示させる

- 非同期通信で通知を表示





### About Me

藤村和弥 24歳 3月31日生まれです。

以前は、自動車ディーラーで営業として働いていました。
現在は、データセンターでオペレーターとして働いています。

### SNS
**[Twitter](https://twitter.com/Fujimmm_331)** **[Qiita](https://qiita.com/nyappy15th)**
