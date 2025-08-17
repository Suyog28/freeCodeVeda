# Project Structure Documentation

## Overview

This document provides a detailed breakdown of the project's folder structure and organization following IT company standards.

## Root Directory Structure

```
freecodeveda/
├── frontend/          # React frontend application
├── backend/           # Node.js backend API
├── docs/             # Project documentation
├── scripts/          # Build and deployment scripts
├── docker/           # Docker configurations
├── .gitignore        # Git ignore rules
├── package.json      # Root package.json for monorepo
└── README.md         # Main project documentation
```

## Frontend Directory (`/frontend`)

```
frontend/
├── src/                    # Source code
│   ├── components/         # Reusable UI components
│   │   ├── Header.jsx      # Navigation header
│   │   └── Footer.jsx      # Site footer
│   ├── pages/              # Page components
│   │   ├── Home.jsx        # Homepage
│   │   ├── Courses.jsx     # Courses listing
│   │   ├── Batches.jsx     # Batch information
│   │   ├── Blogs.jsx       # Blog listing
│   │   ├── BlogDetail.jsx  # Individual blog post
│   │   ├── Team.jsx        # Team members
│   │   ├── Contact.jsx     # Contact form
│   │   ├── Enroll.jsx      # Enrollment form
│   │   └── Admin.jsx       # Admin dashboard
│   ├── lib/                # Utility libraries
│   │   └── api.js          # API client functions
│   ├── assets/             # Static assets
│   ├── App.jsx             # Main application component
│   ├── App.css             # Application styles
│   ├── index.css           # Global styles
│   └── main.jsx            # Application entry point
├── public/                 # Public static files
├── dist/                   # Build output (generated)
├── package.json            # Frontend dependencies
├── vite.config.js          # Vite configuration
├── eslint.config.js        # ESLint configuration
├── netlify.toml            # Netlify deployment config
└── _redirects              # Netlify redirects
```

## Backend Directory (`/backend`)

```
backend/
├── models/                 # Database models
│   ├── Course.js           # Course data model
│   ├── Batch.js            # Batch data model
│   ├── Blog.js             # Blog post model
│   ├── TeamMember.js       # Team member model
│   ├── Enquiry.js          # Enquiry form model
│   └── Registration.js     # Registration model
├── data/                   # JSON data files (fallback)
│   ├── courses.json        # Course data
│   ├── batches.json        # Batch data
│   ├── blogs.json          # Blog data
│   ├── team.json           # Team data
│   ├── enquiries.json      # Enquiry submissions
│   └── registrations.json  # Registration submissions
├── server.js               # Main server file
├── db.js                   # Database connection
├── package.json            # Backend dependencies
├── nodemon.json            # Nodemon configuration
└── env.example             # Environment variables template
```

## Documentation Directory (`/docs`)

```
docs/
├── README.md               # Main project documentation
├── PROJECT_STRUCTURE.md    # This file
├── API_DOCUMENTATION.md    # API endpoints documentation
├── DEPLOYMENT.md           # Deployment instructions
├── QUICK_START.md          # Quick start guide
└── postman_collection.json # Postman API collection
```

## Scripts Directory (`/scripts`)

```
scripts/
├── build.sh                # Build script for production
├── deploy.sh               # Deployment automation
├── setup.sh                # Environment setup
└── test.sh                 # Test execution
```

## Docker Directory (`/docker`)

```
docker/
├── docker-compose.yml      # Multi-container setup
├── Dockerfile.frontend     # Frontend container
├── Dockerfile.backend      # Backend container
└── nginx.conf              # Nginx configuration
```

## Key Design Principles

### 1. Separation of Concerns

- **Frontend**: User interface and client-side logic
- **Backend**: Business logic and data management
- **Documentation**: Comprehensive project documentation
- **Scripts**: Automation and deployment tools

### 2. Monorepo Structure

- Single repository for related projects
- Shared configuration and tooling
- Consistent dependency management
- Unified build and deployment processes

### 3. Standard Naming Conventions

- **Lowercase** for directories and files
- **kebab-case** for multi-word names
- **Descriptive** names that clearly indicate purpose
- **Consistent** structure across similar components

### 4. Configuration Management

- Environment-specific configuration files
- Centralized dependency management
- Shared linting and formatting rules
- Unified build configurations

## File Organization Rules

### Components

- One component per file
- Related components in the same directory
- Shared components in `/components`
- Page-specific components in `/pages`

### Assets

- Images and media in `/assets`
- Public files in `/public`
- Generated files in `/dist` or `/build`
- Configuration files in root or specific directories

### Dependencies

- Root `package.json` for workspace management
- Individual `package.json` files for specific functionality
- Shared dev dependencies at root level
- Package-specific dependencies in respective directories

## Best Practices

1. **Keep it Simple**: Avoid deeply nested directories
2. **Be Consistent**: Use the same structure across similar components
3. **Document Everything**: Maintain up-to-date documentation
4. **Version Control**: Use meaningful commit messages
5. **Dependencies**: Keep dependencies up-to-date and secure
6. **Testing**: Maintain test coverage for critical functionality
7. **Code Quality**: Use linting and formatting tools consistently

## Future Considerations

- **Microservices**: Structure supports future microservice architecture
- **Scalability**: Directory structure allows for easy scaling
- **Team Collaboration**: Clear separation enables parallel development
- **Deployment**: Docker support for containerized deployment
- **Monitoring**: Structure supports logging and monitoring integration
