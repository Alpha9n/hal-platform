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
**1. 開発環境レポジトリをクローン**
開発環境のdocker-compose.ymlを含むレポジトリをクローンします。
```bash
git clone https://github.com/mentai-pasta/hal-platform
```
**2. Dockerコンテナをビルド**
```bash
cd ./hal-platform
docker-compose up --build
```

**3. nodeコンテナにVSCodeからアクセス**

**4. プロジェクトレポジトリをクローン**  
以下コマンドをnodeコンテナ内で実行してください
```bash
cd /home/node/projects/
git clone https://github.com/mentai-pasta/auction-app.git
cd auction-app/
code -r .
```

## 命名規則について
- ディレクトリ名: ケバブケース               (e.g. sample-project)
- ファイル名: パスカルケース                 (e.g. SampleProject)
- ブランチ名: feature/機能名(ケバブケース)    (e.g. feature/sample-feature)