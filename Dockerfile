FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY main.go .
RUN go mod init main && \
    go build -o main

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

ENTRYPOINT [ "./main" ]