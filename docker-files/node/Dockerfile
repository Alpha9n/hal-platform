FROM node:22-bookworm

ENV PNPM_HOME="/pnpm"
ENV PATH="${PNPM_HOME}:$PATH"
RUN corepack enable

# 実行確認
RUN pnpm --version