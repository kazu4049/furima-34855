# README

## users　テーブル

|Column   |Type      |Options           |
|---------|----------|------------------|
| name     | string    | null:false        |
| password | string    | null:false        |
| email    | string    | null:false        |


### Association
* has_many :items
* has_many :record
* has_one  :address



##　items テーブル

|Column       |Type        |Options            |
|-------------|------------|-------------------|
| items_name  | string     | null: false       |
| category    | string     | null: false       |
| price       | string     | null: false       |
| seller      | references | foreign_key: true |

### Association
* belongs_to :user
* has_one    :record




## record テーブル

|Column  |Type        |Options            |
|--------|------------|-------------------|
| items  | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association
* belongs_to :user
* belongs_to :items



## address テーブル

|Column       |Type        |Options            |
|-------------|------------|-------------------|
| postal_code | string     | null: false       |
| prefectures | string     | null: false       |
| phone_number| string     | null: false       |
 


### Association
*belongs_to  :user
