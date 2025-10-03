# PenStream

A simple blog built with **Laravel** and **Docker**, using plain **HTML/CSS** for the frontend.

## Features
- CRUD blog posts
- Minimal HTML/CSS frontend
- Dockerized for easy setup

## Setup
```bash
git clone https://github.com/your-username/PenStream.git
cd PenStream
cp .env.example .env
php artisan key:generate
docker compose up -d
docker compose exec app php artisan migrate
```
Visit the app at http://localhost:8000
