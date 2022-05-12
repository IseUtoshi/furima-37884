# テーブル設計

#### note
※Commentsテーブル及び関連カラムについては、READMEに記載するが実装予定はない。


## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| katakana_first_name | string | null: false               |
| katakana_last_name  | string | null: false               |
| birthday            | date   | null: false               |


### Association

- has_many :items
- has_many :purchases
- has_many :comments

#### note
※deviseのユーザー管理機能を利用する。
※encrypted_passwordは6字以上。
※first_name,last_nameは全角文字のバリデーションが必要。
※katakana_first_name,katakana_last_nameはカタカナ文字のバリデーションが必要。



## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| explain              | text       | null: false                    |
| price                | integer    | null: false                    |
| category_id          | integer    | null: false                    |
| status_id            | integer    | null: false                    |
| delivery_charge_id   | integer    | null: false                    |
| delivery_from_id     | integer    | null: false                    |
| delivery_duration_id | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase
- has_many   :comments

#### note
※priceには300~9,999,999の制限を設ける。
※商品画像はActivestorageにより実装する。


## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery_addresses


## delivery_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| building         | string     |                                |
| house_number     | string     | null: false                    |
| municipality     | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase

#### note
※postcodeはハイフン付きのバリデーションを設定。
※telephone_numberはハイフン無しのバリデーションを設定。


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