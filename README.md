# テーブル設計

#### note
※Commentsテーブル及び関連カラムについては、READMEに記載するが実装予定はない。


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_one  :user_profiles
- has_many :items
- has_many :item_purchases
- has_many :comments

#### note
※deviseのユーザー管理機能を利用する。
※encrypted_passwordは6字以上。


## user_profiles テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| first_name          | string | null: false |
| last_name           | string | null: false |
| katakana_first_name | string | null: false |
| katakana_last_name  | string | null: false |

### Association

- belongs_to :user

#### note
※first_name,last_nameは全角文字のバリデーションが必要。
※katakana_first_name,katakana_last_nameはカタカナ文字のバリデーションが必要。
※誕生日/月/年について、Activehashを用いた実装を行う。


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
- has_one    :item_purchase
- has_many   :comments

#### note
※favoriteはお気に入り機能実装時に使用予定。(現在実装予定なし)
※priceには300~9,999,999の制限を設ける。
※商品画像はActivestorageにより実装する。
※配送費用負担者、配送地域、配送までの日数についてはActivehashを用いて実装。
※sold_outのフラグ管理が必要？Activehashで実装予定。


## item_purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| building         | string     |                                |
| house_number     | string     | null: false                    |
| municipalities   | string     | null: false                    |
| telephone_number | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

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