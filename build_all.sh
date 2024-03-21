#!/bin/sh

# Alpine
echo "[alpine] Initializing Alpine build"
echo "[alpine] [default] Building default release image"
docker build -t angie:alpine docker/alpine/default/release
echo "[alpine] [default] Building default debug image"
docker build -t angie:debug docker/alpine/default/debug

echo "[alpine] [modules] Building modules release image"
docker build -t angie:modules docker/alpine/modules/release
echo "[alpine] [modules] Building modules debug image"
docker build -t angie:modules-debug docker/alpine/modules/debug


# Debian
echo "[debian] Initializing Debian build"
echo "[debian] [default] Building default release image"
docker build -t angie:debian docker/debian/default/release
echo "[debian] [default] Building default debug image"
docker build -t angie:debug-debian docker/debian/default/debug

echo "[debian] [modules] Building modules release image"
docker build -t angie:modules-debian docker/debian/modules/release
echo "[debian] [modules] Building modules debug image"
docker build -t angie:modules-debug-debian docker/debian/modules/debug


# Ubuntu
echo "[ubuntu] Initializing Ubuntu build"
echo "[ubuntu] [default] Building default release image"
docker build -t angie:ubuntu docker/ubuntu/default/release
echo "[ubuntu] [default] Building default debug image"
docker build -t angie:debug-ubuntu docker/ubuntu/default/debug

echo "[ubuntu] [modules] Building modules release image"
docker build -t angie:modules-ubuntu docker/ubuntu/modules/release
echo "[ubuntu] [modules] Building modules debug image"
docker build -t angie:modules-debug-ubuntu docker/ubuntu/modules/debug


# CentOS
echo "[centos] Initializing CentOS build"
echo "[centos] [default] Building default release image"
docker build -t angie:centos docker/centos/default/release
echo "[centos] [default] Building default debug image"
docker build -t angie:debug-centos docker/centos/default/debug

echo "[centos] [modules] Building modules release image"
docker build -t angie:modules-centos docker/centos/modules/release
echo "[centos] [modules] Building modules debug image"
docker build -t angie:modules-debug-centos docker/centos/modules/debug
