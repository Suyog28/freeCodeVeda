# FreeCodeVeda

A comprehensive educational platform built with modern web technologies.

## 🏗️ Project Structure

```
freecodeveda/
├── frontend/          # React + Vite frontend application
├── backend/           # Node.js + Express backend API
├── docs/             # Project documentation
├── scripts/          # Build and deployment scripts
├── docker/           # Docker configurations
└── README.md         # This file
```

## 🚀 Quick Start

### Prerequisites

- Node.js >= 18
- npm >= 8

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd freecodeveda
   ```

2. **Install dependencies**

   ```bash
   npm run install:all
   ```

3. **Set up environment variables**

   ```bash
   # Backend
   cp backend/env.example backend/.env
   # Edit backend/.env with your configuration

   # Frontend
   cp frontend/env.example frontend/.env
   # Edit frontend/.env with your configuration
   ```

4. **Start development servers**
   ```bash
   npm run dev
   ```

This will start both frontend and backend servers concurrently.

## 📁 Directory Structure

### Frontend (`/frontend`)

- **React 18** with **Vite** for fast development
- **React Router** for navigation
- **Modern CSS** with responsive design
- **Component-based architecture**

### Backend (`/backend`)

- **Node.js** with **Express.js** framework
- **MongoDB** with **Mongoose** ODM
- **RESTful API** design
- **JWT authentication**
- **File upload support**

## 🛠️ Available Scripts

### Root Level

- `npm run dev` - Start both frontend and backend in development mode
- `npm run build` - Build both frontend and backend for production
- `npm run install:all` - Install dependencies for all packages
- `npm run test` - Run tests for both frontend and backend
- `npm run lint` - Run linting for both frontend and backend

### Frontend

- `npm run dev:frontend` - Start frontend development server
- `npm run build:frontend` - Build frontend for production
- `npm run test:frontend` - Run frontend tests
- `npm run lint:frontend` - Run frontend linting

### Backend

- `npm run dev:backend` - Start backend development server
- `npm run build:backend` - Build backend for production
- `npm run start` - Start production backend server
- `npm run test:backend` - Run backend tests
- `npm run lint:backend` - Run backend linting

## 🌐 Environment Variables

### Backend (`.env`)

```env
PORT=5000
MONGODB_URI=mongodb://localhost:27017/freecodeveda
JWT_SECRET=your-secret-key
NODE_ENV=development
```

### Frontend (`.env`)

```env
VITE_API_URL=http://localhost:5000/api
VITE_APP_NAME=FreeCodeVeda
```

## 🐳 Docker Support

Docker configurations are available in the `/docker` directory for easy deployment.

## 📚 API Documentation

API documentation and Postman collection are available in the `/docs` directory.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions, please refer to the documentation in the `/docs` directory or create an issue in the repository.
