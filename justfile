run:
    uv run baml-cli generate && uv run --env-file=.env main.py

dev:
    uv run fastapi dev main.py

baml:
    uv run baml-cli generate