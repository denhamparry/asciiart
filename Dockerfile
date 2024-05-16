FROM cgr.dev/chainguard/python:latest-dev as builder

WORKDIR /app

# hadolint ignore=DL3003, DL3013
RUN pip install --no-cache-dir pillow

# hadolint ignore=DL3006, DL3007
FROM cgr.dev/chainguard/python:latest

WORKDIR /app

# Make sure you update Python version in path
COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages \
    /home/nonroot/.local/lib/python3.12/site-packages

COPY ./main.py .

ENTRYPOINT [ "python", "/app/main.py" ]