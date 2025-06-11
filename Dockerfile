# syntax=docker/dockerfile:1

FROM python:3.13-slim AS base

WORKDIR /app

FROM base AS builder

# Install build dependencies (none needed for this simple app, but placeholder for future)

# Create virtual environment and install dependencies using bind and cache mounts
RUN python -m venv /app/.venv
COPY --link requirements.txt requirements.txt
RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    --mount=type=cache,target=/root/.cache/pip \
    /app/.venv/bin/pip install -r requirements.txt

FROM base AS final

# Security: create non-root user
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Copy app code and virtual environment from builder
COPY --from=builder /app/.venv /app/.venv
COPY --link app.py app.py

# Set environment to use venv
ENV PATH="/app/.venv/bin:$PATH"

USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
