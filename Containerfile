# ---- Stage 1: Building the application ----
FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp main.go

# ---- Stage 2: Server the application ----
FROM alpine:latest
COPY --from=builder /app/myapp /usr/local/bin/myapp
CMD /usr/local/bin/myapp

