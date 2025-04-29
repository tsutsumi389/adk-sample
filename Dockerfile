FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# pipを使用してuvをインストール
RUN pip install --upgrade pip && \
    pip install uv

# 作業ディレクトリ
WORKDIR /app

# 必要なファイルをコピー
COPY requirements.txt .

# 依存関係をインストール
RUN pip install -r requirements.txt

# アプリケーションファイルをコピー
COPY . .

# コンテナ起動時に実行するコマンド
# CMD ["python", "app.py"]
CMD ["adk", "web"]