# Task List Manager

A simple Laravel app to manage tasks and lists, built with Docker.

## Setup

```bash
git clone https://github.com/YourUsername/task-list-manager.git
cd task-list-manager
docker compose up -d --build
docker exec -it laravel_app php artisan key:generate
docker exec -it laravel_app php artisan migrate
```

Access the app at http://localhost:8000
