FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY dist/mosdns /usr/bin/mosdns
RUN chmod +x /usr/bin/mosdns
WORKDIR /etc/mosdns
ENTRYPOINT ["mosdns"]
CMD ["start", "-c", "/etc/mosdns/config.yaml"]
