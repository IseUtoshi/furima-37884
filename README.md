# テーブル設計

#### note
※Commentsテーブル及び関連カラムについては、READMEに記載するが実装予定はない。


## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| katakana_first_name | string  | null: false               |
| katakana_last_name  | string  | null: false               |
| birth_day           | integer | null: false               |
| birth_month         | integer | null: false               |
| birth_year          | integer | null: false               |


### Association

- has_many :items
- has_many :purchases
- has_many :comments

#### note
※deviseのユーザー管理機能を利用する。
※encrypted_passwordは6字以上。
※first_name,last_nameは全角文字のバリデーションが必要。
※katakana_first_name,katakana_last_nameはカタカナ文字のバリデーションが必要。
※生年月日はプルダウンメニューから選択できるようにする


## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| explain  | text       | null: false                    |
| price    | integer    | null: false                    |
| favorite | integer    |                                |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase
- has_many   :comments

#### note
※favoriteはお気に入り機能実装時に使用予定。(現在実装予定なし)
※priceには300~9,999,999の制限を設ける。
※商品画像はActivestorageにより実装する。
※カテゴリ、状態、配送費用負担者、配送地域、配送までの日数についてはActivehashを用いて実装。


## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## delivery_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| building         | string     |                                |
| house_number     | string     | null: false                    |
| municipalities   | string     | null: false                    |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase

#### note
※postcodeはハイフン付きのバリデーションを設定。
※telephone_numberはハイフン無しのバリデーションを設定。
※都道府県名に関してはActivehashで実装。


----------

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item