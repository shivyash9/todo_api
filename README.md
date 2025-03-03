# To-Do List API (Rails)

## Overview

This is a simple **To-Do List API** built using **Ruby on Rails** with **SQLite3**. It allows users to **create**, **list**, **update**, and **delete** tasks. Each task has a **status enum**, an **assigned\_to** field, and timestamps.

---

## Features

- ✅ **Create a Task**
- ✅ **List All Tasks**
- ✅ **Update a Task (Edit Title, Description, Assigned To, Status)**
- ✅ **Mark Task as Completed**
- ✅ **Delete a Task**

---

## Setup Instructions

### 1️⃣ Install Ruby & Rails

Make sure you have **Ruby 3.3.3** and **Rails 7.2.1** installed.

### 2️⃣ Clone the Repository

```sh
git clone <repository-url>
cd todo-list-api
```

### 3️⃣ Install Dependencies

```sh
bundle install
```

### 4️⃣ Setup Database

```sh
rails db:migrate
```

### 5️⃣ Start the Server

```sh
rails server
```

Server will run at **[http://localhost:3000](http://localhost:3000)**

---

## API Endpoints 📌

### 1️⃣ List All Tasks

```http
GET http://localhost:3000/api/v1/tasks
```

#### Response Example

```json
[
  {
    "id": 1,
    "title": "Finish Rails API",
    "description": "Complete the API and test it",
    "assigned_to": "John Doe",
    "status": "pending",
    "completed": false,
    "created_at": "2025-03-03T12:00:00.000Z",
    "updated_at": "2025-03-03T12:00:00.000Z"
  }
]
```

---

### 2️⃣ Create a New Task

```http
POST http://localhost:3000/api/v1/tasks
```

#### Request Body

```json
{
  "id": 2,
  "title": "Build Rails API",
  "description": "A simple to-do API",
  "assigned_to": "Alice",
  "status": "pending",
  "completed": false,
  "created_at": "2025-03-03T12:05:00.000Z",
  "updated_at": "2025-03-03T12:05:00.000Z"
}
```

---

### 3️⃣ Update Task (Title, Description, Assigned To, Status)

```http
PATCH http://localhost:3000/api/v1/tasks/:id
```

#### Request Body

```json
{
  "task": {
    "title": "Updated Title",
    "description": "Updated Description",
    "assigned_to": "Bob",
    "status": "in_progress"
  }
}
```

#### Response Example

```json
{
  "id": 2,
  "title": "Updated Title",
  "description": "Updated Description",
  "assigned_to": "Bob",
  "status": "in_progress",
  "completed": false,
  "created_at": "2025-03-03T12:05:00.000Z",
  "updated_at": "2025-03-03T12:10:00.000Z"
}
```

---

### 4️⃣ Mark Task as Completed

```http
PATCH http://localhost:3000/api/v1/tasks/:id/mark_completed
```

#### Response Example

```json
{
  "id": 2,
  "title": "Updated Title",
  "description": "Updated Description",
  "assigned_to": "Bob",
  "status": "completed",
  "completed": true,
  "created_at": "2025-03-03T12:05:00.000Z",
  "updated_at": "2025-03-03T12:15:00.000Z"
}
```

---

### 5️⃣ Delete a Task

```http
DELETE http://localhost:3000/api/v1/tasks/:id
```

#### Response Example

*No Content (204)*

---

## Status Enum Values

| Value | Meaning     |
| ----- | ----------- |
| `0`   | Pending     |
| `1`   | In Progress |
| `2`   | Completed   |

---

## Testing API with cURL

### Create a Task

```sh
curl -X POST http://localhost:3000/api/v1/tasks \
     -H "Content-Type: application/json" \
     -d '{"task": {"title": "New Task", "description": "Do something", "assigned_to": "Alice"}}'
```

### List Tasks

```sh
curl -X GET http://localhost:3000/api/v1/tasks
```

### Update a Task

```sh
curl -X PATCH http://localhost:3000/api/v1/tasks/1 \
     -H "Content-Type: application/json" \
     -d '{"task": {"status": "in_progress"}}'
```

### Mark Task as Completed

```sh
curl -X PATCH http://localhost:3000/api/v1/tasks/1/mark_completed
```

### Delete a Task

```sh
curl -X DELETE http://localhost:3000/api/v1/tasks/1
```

---

## Conclusion

This API is a simple **To-Do List** backend built with **Rails**. It allows CRUD operations on tasks without authentication.

🚀 **Happy Coding!** 🎉

