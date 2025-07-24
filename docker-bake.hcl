variable "ALPINE_VERSION" { default = "3.22" }

group "default" {
  targets = [
    "palemoon",
    "ssh-ci",
    "xserver",
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
    "linux/arm/v7",
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