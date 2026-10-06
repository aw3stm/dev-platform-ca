# Option 1 - Express.js API

A REST API built with Node.js, Express.js, TypeScript and MySQL.

The API provides user registration and login, JWT authentication, and article management.

## Technologies

- Node.js
- Express.js
- TypeScript
- MySQL
- mysql2
- dotenv
- bcrypt
- JSON Web Token (JWT)

## Prerequisites

Before running the project, make sure you have installed:

- Node.js
- npm
- MySQL

- ## Installation

Clone the repository:

```bash
git clone https://github.com/aw3stm/dev-platform-ca.git
```

Navigate into the project folder:

```bash
cd option-1-express-api
```

Install the dependencies:

```bash
npm install
```


## Database setup

The repository includes an SQL export of the database:

```text
article_api.sql
```

Import this file into MySQL before starting the API.

The database is named:

```text
article_api
```

The project is configured to connect to a MySQL server using the following settings:

```text
Host: localhost
Port: 3306
```

## Environment variables

Create a `.env` file in the root of the project.

Add the following variables:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=article_api
DB_PORT=3306
JWT_SECRET=your_secret
```

Replace `your_password` with your MySQL password and `your_secret` with a secret string used to sign JWT tokens.

The `.env` file contains sensitive information and should not be committed to GitHub.

## Running the project

Start the development server with:

```bash
npm run dev
```

The API runs on:

```text
http://localhost:3000
```

The port is currently set to `3000` in `src/index.ts`.

## Build

To compile the TypeScript project:

```bash
npm run build
```

This runs the TypeScript compiler and generates the compiled files in the `dist` folder.

## API endpoints

### Health check

```http
GET /
```

Returns a message confirming that the API is running.

### Authentication

#### Register a user

```http
POST /auth/register
```

Request body:

```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

#### Login

```http
POST /auth/login
```

Request body:

```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

A successful login returns a JWT token.

### Articles

#### Get all articles

```http
GET /articles
```

#### Get an article by ID

```http
GET /articles/:id
```

#### Create an article

```http
POST /articles
```

This endpoint requires authentication using a valid JWT token.

Request body:

```json
{
  "title": "Example article",
  "body": "Article content",
  "category": "Technology"
}
```

The JWT should be sent in the authorization header:

```text
Authorization: Bearer YOUR_TOKEN
```

## Authentication

User passwords are hashed using bcrypt before being stored in the database.

Login returns a JSON Web Token (JWT). The token is required when creating an article.

The JWT expires after one hour.

## Validation and error handling

The API validates incoming data and returns appropriate HTTP status codes for common errors, including:

- `400` for invalid input
- `401` for authentication errors
- `404` when an article cannot be found
- `409` when an email is already registered

The project also includes error-handling middleware.


## Available npm scripts

### Development

```bash
npm run dev
```

Runs the API using `tsx` in watch mode.

### Build

```bash
npm run build
```

Compiles the TypeScript project.

## Course project

This project was created as part of the Development Platforms course.
