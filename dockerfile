# Multi-stage Dockerfile demonstrating security patch requirements
# These base images are intentionally outdated to show security patch scenarios

# Stage 1: Node.js application with outdated base image
FROM node:14.19.0-alpine AS frontend-builder
# Current LTS: 20.x, Previous LTS: 18.x
# Node 14 reached end-of-life and has multiple security vulnerabilities
# CVE-2023-23918, CVE-2023-23919, CVE-2023-23920 affect this version

WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm ci --only=production
COPY frontend/ .
RUN npm run build

# Stage 2: Python application with outdated base
FROM python:3.9.10-slim-bullseye AS backend-builder
# Multiple security updates available for Python 3.9.10
# CVE-2023-24329, CVE-2023-27043 affect this version
# Debian Bullseye also has security updates pending

WORKDIR /app/backend
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY backend/ .

# Stage 3: Production image with security concerns
FROM ubuntu:20.04
# Ubuntu 20.04 has multiple security patches available
# Should be updated to at least 20.04.6 or consider 22.04 LTS

# Install vulnerable versions of system packages
RUN apt-get update && apt-get install -y \
    nginx=1.18.0-0ubuntu1 \
    openssl=1.1.1f-1ubuntu2 \
    curl=7.68.0-1ubuntu2 \
    git=1:2.25.1-1ubuntu3 \
    && rm -rf /var/lib/apt/lists/*
# These packages have known CVEs that have been patched in newer versions

# Install an old Node.js runtime with vulnerabilities
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs=14.19.0-1nodesource1
# Node 14 is EOL and has unpatched security vulnerabilities

# Copy application files
COPY --from=frontend-builder /app/frontend/build /usr/share/nginx/html
COPY --from=backend-builder /app/backend /app

# Use outdated nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Security issues in this Dockerfile:
# 1. Base images are outdated with known CVEs
# 2. System packages need security patches
# 3. Node.js 14 is end-of-life
# 4. Python 3.9.10 has security vulnerabilities
# 5. Ubuntu 20.04 needs to be updated to latest patch
# 6. OpenSSL version has critical vulnerabilities
# 7. Git version has RCE vulnerability (CVE-2022-24765)

# Additional outdated images for demonstration
# FROM alpine:3.13  # Should be 3.18+
# FROM nginx:1.20   # Should be 1.24+
# FROM redis:6.2.6  # Should be 7.2+
# FROM postgres:13.5 # Should be 13.13+ or 15.x
# FROM jenkins/jenkins:2.332.1 # Multiple security updates available

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]

# Note for Dependabot:
# This Dockerfile intentionally uses outdated base images and packages
# to demonstrate how Dependabot handles security patches for:
# - Base image updates (FROM statements)
# - System package updates (apt packages)
# - Runtime vulnerabilities (Node.js, Python)
# These would trigger high-priority security alerts requiring patches
