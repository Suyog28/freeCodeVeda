# 🚀 FreeCodeVeda Deployment Checklist

## ✅ Pre-Deployment (Completed)

- [x] Project structure refactored to IT company standards
- [x] CodeVeda2 logo properly integrated into header
- [x] Project renamed from "Skillio App" to "freecodeveda"
- [x] Frontend and backend prepared for deployment
- [x] Deployment scripts created
- [x] Environment templates created
- [x] Netlify configuration updated
- [x] Render configuration created

## 🔧 Environment Setup

### 1. MongoDB Atlas

- [ ] Create MongoDB Atlas account
- [ ] Create new cluster
- [ ] Create database user
- [ ] Get connection string
- [ ] Configure network access (0.0.0.0/0)

### 2. Update Environment Files

- [ ] Copy `frontend/env.production.template` to `frontend/.env.production`
- [ ] Copy `backend/env.production.template` to `backend/.env.production`
- [ ] Update `VITE_API_URL` in frontend (will be your Render backend URL)
- [ ] Update `MONGODB_URI` in backend (your MongoDB Atlas connection string)
- [ ] Generate secure `JWT_SECRET` for backend
- [ ] Update `CORS_ORIGIN` in backend (will be your Netlify frontend URL)

## 🌐 Frontend Deployment (Netlify)

### 1. Connect Repository

- [ ] Go to [netlify.com](https://netlify.com)
- [ ] Sign in/Create account
- [ ] Click "New site from Git"
- [ ] Choose GitHub
- [ ] Select your repository

### 2. Configure Build Settings

- [ ] **Base directory**: `frontend`
- [ ] **Build command**: `npm run build`
- [ ] **Publish directory**: `dist`
- [ ] **Node version**: `18`

### 3. Environment Variables

- [ ] Add `VITE_API_URL`: `https://your-backend-url.onrender.com`
- [ ] Add `VITE_APP_NAME`: `FreeCodeVeda`

### 4. Deploy

- [ ] Click "Deploy site"
- [ ] Wait for build completion
- [ ] Note your Netlify URL

## ⚙️ Backend Deployment (Render)

### 1. Create Web Service

- [ ] Go to [render.com](https://render.com)
- [ ] Sign in/Create account
- [ ] Click "New +" → "Web Service"
- [ ] Connect your GitHub repository

### 2. Configure Service

- [ ] **Name**: `freecodeveda-backend`
- [ ] **Root Directory**: `backend`
- [ ] **Runtime**: `Node`
- **Build Command**: `npm install`
- **Start Command**: `npm start`
- **Plan**: Free (or choose appropriate plan)

### 3. Environment Variables

- [ ] `NODE_ENV`: `production`
- [ ] `PORT`: `10000`
- [ ] `MONGODB_URI`: Your MongoDB Atlas connection string
- [ ] `JWT_SECRET`: Your secure JWT secret
- [ ] `CORS_ORIGIN`: Your Netlify frontend URL

### 4. Deploy

- [ ] Click "Create Web Service"
- [ ] Wait for build and deployment
- [ ] Note your Render URL

## 🔄 Update URLs and Redeploy

### 1. Update Frontend

- [ ] Go back to Netlify
- [ ] Update `VITE_API_URL` with your actual Render backend URL
- [ ] Trigger new deployment

### 2. Update Backend

- [ ] Go back to Render
- [ ] Update `CORS_ORIGIN` with your actual Netlify frontend URL
- [ ] Redeploy the service

## ✅ Post-Deployment Verification

### Frontend (Netlify)

- [ ] Visit your Netlify site
- [ ] Check if app loads correctly
- [ ] Test navigation
- [ ] Verify API calls work
- [ ] Confirm CodeVeda2 logo displays properly in header

### Backend (Render)

- [ ] Test health endpoint: `https://your-backend-url.onrender.com/api/health`
- [ ] Check Render logs for errors
- [ ] Verify database connection

## 🚨 Troubleshooting

### Common Issues

- **CORS Errors**: Ensure CORS_ORIGIN matches exactly (no trailing slashes)
- **Build Failures**: Check Node.js version compatibility
- **Database Issues**: Verify MongoDB Atlas connection string and network access
- **Environment Variables**: Double-check all variables are set correctly
- **Logo Display**: CodeVeda2 logo should be visible in header (40px height on desktop, 32px on mobile)

### Getting Help

- **Netlify**: [docs.netlify.com](https://docs.netlify.com)
- **Render**: [render.com/docs](https://render.com/docs)
- **MongoDB Atlas**: [docs.atlas.mongodb.com](https://docs.atlas.mongodb.com)

## 📚 Resources

- **Comprehensive Guide**: [docs/DEPLOYMENT_GUIDE.md](docs/DEPLOYMENT_GUIDE.md)
- **Deployment Scripts**: `scripts/deploy-to-production.sh` (Linux/Mac) or `scripts/deploy-to-production.bat` (Windows)
- **Project Documentation**: [docs/README.md](docs/README.md)

---

**🎯 Goal**: Deploy FreeCodeVeda frontend to Netlify and backend to Render with MongoDB Atlas integration.

**⏱️ Estimated Time**: 30-60 minutes for first deployment

**💡 Pro Tip**: Use the deployment scripts to automate the preparation process!

**✨ Note**: The header now features the CodeVeda2 logo alongside "FreeCodeVeda" text branding, with responsive design and hover effects.
