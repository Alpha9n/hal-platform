## 概要
HALオークションのプラットフォームレポジトリ

## ファイル構成
```
.
├── README.md
├── docker-compose.yml
└── docker-files
    ├── database
    │   ├── Dockerfile                  # MySQLのコンテナのDockerfile
    │   └── init-files                  # データベース初期化ファイル
    │       └── test_mysql_init.sql     # テスト用のデータベース初期化ファイル
    └── node
        ├── Dockerfile                  # Node.jsのコンテナのDockerfile
        └── projects                    # プロジェクトレポジトリ格納用ディレクトリ
```

## 開発環境構築手順
**1. レポジトリをクローン**
```bash
git clone https://github.com/mentai-pasta/hal-platform
```
**2. プロジェクトレポジトリをクローン**  
*e.g. hal-auctionプロジェクトをクローン*
```bash
cd ./hal-auction/docker-files/node/projects
git clone https://github.com/mentai-pasta/hal-auction
```
**3. Dockerコンテナをビルド**
```bash
cd ../../
docker-compose up --build
```

## 命名規則について
- ディレクトリ名: ケバブケース               (e.g. sample-project)
- ファイル名: パスカルケース                 (e.g. SampleProject)
- ブランチ名: feature/機能名(ケバブケース)    (e.g. feature/sample-feature)