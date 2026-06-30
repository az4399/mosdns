FROM --platform=$BUILDPLATFORM golang:1.26-alpine AS builder

WORKDIR /root/src/

ARG CGO_ENABLED=0
ARG TARGETOS=linux
ARG TARGETARCH=amd64
ARG VERSION=dev/unknown

COPY go.mod go.sum ./
RUN go mod download

COPY ./ ./
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH go build -ldflags "-s -w -X main.version=${VERSION}" -trimpath -o /mosdns

FROM alpine:latest

RUN apk add --no-cache ca-certificates

COPY --from=builder /mosdns /usr/bin/mosdns
