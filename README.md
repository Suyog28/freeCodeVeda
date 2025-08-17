# FreeCodeVeda

A comprehensive educational platform built with modern web technologies.

## 🚀 Quick Start

```bash
# Install all dependencies
npm run install:all

# Start development servers
npm run dev

# Build for production
npm run build
```

## 📁 Project Structure

```
freecodeveda/
├── frontend/          # React + Vite frontend
├── backend/           # Node.js + Express backend
├── docs/              # Documentation
├── scripts/           # Build and deployment scripts
└── docker/            # Docker configurations
```

## 🌐 Deployment

This project is configured for easy deployment:

- **Frontend**: Deploy to [Netlify](https://netlify.com) with automatic builds
- **Backend**: Deploy to [Render](https://render.com) with MongoDB Atlas integration

### Quick Deployment

```bash
# Windows
scripts\deploy-to-production.bat

# Linux/Mac
scripts/deploy-to-production.sh
```

For detailed deployment instructions, see [docs/DEPLOYMENT_GUIDE.md](docs/DEPLOYMENT_GUIDE.md).

## 📚 Documentation

- [Project Structure](docs/PROJECT_STRUCTURE.md)
- [API Documentation](docs/README.md)
- [Deployment Guide](docs/DEPLOYMENT_GUIDE.md)
- [Refactoring Summary](docs/REFACTORING_SUMMARY.md)

## 🛠️ Development

```bash
# Frontend only
npm run dev:frontend

# Backend only
npm run dev:backend

# Run tests
npm test

# Lint code
npm run lint
```

## 📦 Docker Support

```bash
# Build and run with Docker Compose
docker-compose up --build
```

---

For more information, see the [documentation](docs/README.md).
"# freeCodeVeda" 
