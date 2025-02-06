# Habilog

日々の習慣を記録して達成状況を可視化できるアプリケーション「Habilog」へようこそ！

## アプリケーション概要

Habilogは、次のような特徴を持つアプリケーションです。

- 日々の習慣を記録し、達成状況を可視化。
- 他のユーザーが投稿している内容を見ることで、モチベーションを向上。
- 使いやすいインターフェースで、継続的な習慣形成をサポート。

[アプリケーションはこちらからアクセスできます](https://habilog.onrender.com/)

---

## テスト用アカウント

以下のアカウント情報を使用してログインできます：

- **ID:** gupira
- **Password:** 0621

---

## 利用方法

1. アプリケーションにログインします。
2. 自分の達成したい習慣を登録します。
3. 日々の記録を行い、達成状況を確認します。

今後は、他のユーザーとコメントを通じてコミュニケーションが取れる機能も追加予定です。

---

## アプリケーション作成の背景

日々の習慣を記録していましたが、専用アプリがあると便利だと感じました。特に以下の点を意識して開発しました：

- **一目で可視化できる機能**：習慣の達成状況をグラフや一覧でわかりやすく。
- **他ユーザーの影響力**：周りのユーザーの頑張りを見ることで、自己改善の意欲を高める。

---

## 開発環境

- **フロントエンド**：HTML, CSS, JavaScript
- **バックエンド**：Ruby
- **データベース**：設計図はER図を参照してください。

---

## ローカルでの動作方法

以下の手順でローカル環境でHabilogを動作させることができます。

1. リポジトリをクローンします。

```bash
git clone <https://github.com/gupiragupio/habilog?tab=readme-ov-file#readme>


# テーブル設計

## users（ユーザー管理用） テーブル

| Column             | Type   | Options             |
| ------------------ | ------ | -----------         |
| nickname           | string | null: false             |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false             |


### Association

has_many :habits, dependent: :destroy


##  habits（習慣投稿用）テーブル

| Column                              | Type       | Options                     |
| ------------------                  | ------     | -----------                 |
| user                                | references | null: false ,foreign_key: true              |
| title                               | string     | null: false                 |
| description                         | text       |               |

 

### Association

belongs_to :user 
has_many :habit_logs, dependent: :destroy

## habit_logs（習慣記録用）テーブル

| Column                              | Type       | Options                     |
| ------------------                  | ------     | -----------                 |
| habit                               | references | null: false, foreign_key: true               |
| date                                | date       | null: false                 |
| note                                | text       |                             |
| status                              | boolean    | null: false, trueが達成、falseが未達成      |

### Association
belongs_to :habit
