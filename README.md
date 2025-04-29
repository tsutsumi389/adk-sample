# ADKサンプルコード

このプロジェクトは、ADK（Agent Development Kit）のサンプルコードです。

## 使用技術

- **LLM**: Docker Model Runner: AI モデルを使用

## デフォルト設定

このプロジェクトでは、環境変数を設定するために `.env` ファイルを使用します。Docker Model Runnerを使う場合の設定例です：
multi_tool_agent配下に`.env`を作成

```
OPENAI_API_BASE=http://model-runner.docker.internal/engines/llama.cpp/v1
OPENAI_API_KEY=example_api_key
```
