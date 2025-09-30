variable "ALPINE_VERSION" { default = "3.22" }

group "default" {
  targets = [
    "chromium",
    "firefox",
    "palemoon",
    "ssh-ci",
    "trivalent",
    "xserver",
  ]
}

target "chromium" {
  context = "./chromium"
  dockerfile = "./Dockerfile"
  platforms = [
    "linux/386",
    "linux/amd64",
  ]
  cache-from = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/chromium/cache"
  ]
  cache-to = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/chromium/cache"
  ]
  pull = true
  tags = [
    "ghcr.io/techarohq/ci-images/chromium:latest"
  ]
}

target "firefox" {
  context = "./firefox"
  dockerfile = "./Dockerfile"
  platforms = [
    "linux/386",
    "linux/amd64",
  ]
  cache-from = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/firefox/cache"
  ]
  cache-to = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/firefox/cache"
  ]
  pull = true
  tags = [
    "ghcr.io/techarohq/ci-images/firefox:latest"
  ]
}

target "palemoon" {
  context = "./palemoon"
  dockerfile = "./Dockerfile"
  platforms = [
    "linux/386",
    "linux/amd64",
  ]
  cache-from = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/palemoon/cache"
  ]
  cache-to = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/palemoon/cache"
  ]
  pull = true
  tags = [
    "ghcr.io/techarohq/ci-images/palemoon:latest"
  ]
}

target "ssh-ci" {
  args = {
    ALPINE_VERSION = "3.22"
  }
  context = "./ssh-ci"
  dockerfile = "./Dockerfile"
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/ppc64le",
    "linux/riscv64",
  ]
  cache-from = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/ssh-ci/cache"
  ]
  cache-to = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/ssh-ci/cache"
  ]
  pull = true
  tags = [
    "ghcr.io/techarohq/ci-images/ssh-ci:latest"
  ]
}

target "trivalent" {
  context = "./trivalent"
  dockerfile = "./Dockerfile"
  platforms = [
    "linux/amd64",
    // "linux/arm64",
  ]
  cache-from = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/trivalent/cache"
  ]
  cache-to = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/trivalent/cache"
  ]
  pull = true
  tags = [
    "ghcr.io/techarohq/ci-images/trivalent:latest"
  ]
}


target "xserver" {
  context = "./xserver"
  dockerfile = "./Dockerfile"
  platforms = [
    "linux/386",
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v7",
    "linux/ppc64le",
  ]
  cache-from = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/xserver/cache"
  ]
  cache-to = [
    "type=registry,ref=ghcr.io/techarohq/ci-images/xserver/cache"
  ]
  tags = [
    "ghcr.io/techarohq/ci-images/xserver:latest"
  ]
}