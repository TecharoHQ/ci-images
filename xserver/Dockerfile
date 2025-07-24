FROM --platform=${BUILDPLATFORM} alpine:3.22 AS build

RUN apk add -U go git build-base

WORKDIR /app
RUN git clone https://github.com/mattn/goreman /app \
  && mkdir -p /app/bin

ARG TARGETOS
ARG TARGETARCH

RUN \
  --mount=type=cache,target=/root/.cache \
  --mount=type=cache,target=/root/go \
  --mount=type=cache,target=/app/node_modules \
  GOOS=${TARGETOS} \
  GOARCH=${TARGETARCH} \
  GOARM=7 \
  CGO_ENABLED=0 \
  go build \
  -o /app/bin/goreman \
  -gcflags "all=-N -l" \
  -ldflags "-s -w -extldflags -static" \
  .

RUN go install github.com/mattn/goreman@latest

FROM debian:latest AS run
RUN apt-get update -y && \
  apt-get install -y tigervnc-standalone-server dwm xterm && \
  rm -rf /var/lib/apt/lists
ENV VNC_DESKTOP_NAME="Xtigervnc"
ENV VNC_GEOMETRY=1280x800
COPY app/ /app/
COPY --from=build /app/bin/goreman /usr/bin/goreman

CMD ["/app/main.sh"]
LABEL org.opencontainers.image.source="https://github.com/TecharoHQ/ci-images"