# ---- Stage 1: Building the application ----
FROM node:20 AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

# ---- Stage 2: Server the application ----
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html

