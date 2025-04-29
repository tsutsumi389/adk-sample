.PHONY: build up down restart logs clean setup help shell ps

# デフォルトターゲット
help:
	@echo "利用可能なコマンド:"
	@echo "  make build    - Dockerイメージをビルドする"
	@echo "  make up       - コンテナを起動する"
	@echo "  make down     - 実行中のコンテナを停止する"
	@echo "  make restart  - コンテナを再起動する"
	@echo "  make logs     - コンテナのログを表示する"
	@echo "  make clean    - 未使用のDockerリソースをクリーンアップ"
	@echo "  make setup    - 開発環境をセットアップする"
	@echo "  make shell    - 実行中のコンテナにシェルで接続する"
	@echo "  make ps       - コンテナの状態を確認する"

# Dockerイメージをビルド
build:
	docker-compose build

# コンテナを起動
up:
	docker-compose up -d
	@echo "アプリケーションが起動しました。http://localhost:8000/ にアクセスしてください"

# コンテナを停止
down:
	docker-compose down

# コンテナを再起動
restart: down up

# コンテナのログを表示
logs:
	docker-compose logs -f

# Dockerリソースをクリーンアップ
clean:
	docker-compose down --rmi local
	docker system prune -f

# 開発環境のセットアップ
setup:
	@echo "開発環境をセットアップしています..."
	pip install -r requirements.txt
	@echo "セットアップが完了しました"

# 直接アプリケーションを実行（Docker不使用）
run-local:
	python app.py

# コンテナにシェルで接続
shell:
	docker-compose exec uv-app /bin/bash || docker-compose exec uv-app /bin/sh

# コンテナの状態を確認
ps:
	docker-compose ps

update-requirements:
	pip freeze > requirements.txt