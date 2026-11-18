# ---------- Stage 1: build the static site with Parcel ----------
FROM node:22-alpine AS builder

# Working directory inside the build container
WORKDIR /app

# Copy dependency files first so Docker can cache npm ci
COPY package*.json ./
RUN npm ci

# Copy the website source and build it into /app/dist
COPY src/ ./src/
COPY styles/ ./styles/
RUN npm run build

# ---------- Stage 2: serve the built files with Nginx ----------
FROM nginx:1.27-alpine

# Copy only the built website from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Nginx listens on port 80 inside the container
EXPOSE 80

# Run Nginx in the foreground so the container stays alive
CMD ["nginx", "-g", "daemon off;"]
