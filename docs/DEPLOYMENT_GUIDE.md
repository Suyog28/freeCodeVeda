# Deployment Guide

This guide will help you deploy FreeCodeVeda to production:

- **Frontend**: Hosted on Netlify
- **Backend**: Hosted on Render

## Prerequisites

1. **GitHub Repository**: Ensure your code is pushed to a GitHub repository
2. **Netlify Account**: Sign up at [netlify.com](https://netlify.com)
3. **Render Account**: Sign up at [render.com](https://render.com)
4. **MongoDB Atlas**: Set up a cloud MongoDB database

## Frontend Deployment (Netlify)

### Step 1: Prepare Frontend for Production

1. **Update Environment Variables**:
   Create a `.env.production` file in the `frontend/` directory:

   ```bash
   VITE_API_URL=https://your-backend-url.onrender.com
   VITE_APP_NAME=FreeCodeVeda
   ```

2. **Build the Frontend**:
   ```bash
   cd frontend
   npm run build
   ```

### Step 2: Deploy to Netlify

#### Option A: Deploy via Netlify UI (Recommended for first deployment)

1. **Connect Repository**:

   - Go to [netlify.com](https://netlify.com) and sign in
   - Click "New site from Git"
   - Choose your GitHub repository
   - Select the `frontend` folder as the base directory

2. **Configure Build Settings**:

   - **Build command**: `npm run build`
   - **Publish directory**: `dist`
   - **Node version**: `18`

3. **Environment Variables**:

   - Go to Site settings → Environment variables
   - Add:
     - `VITE_API_URL`: Your Render backend URL
     - `VITE_APP_NAME`: `FreeCodeVeda`

4. **Deploy**:
   - Click "Deploy site"
   - Wait for the build to complete

#### Option B: Deploy via Netlify CLI

1. **Install Netlify CLI**:

   ```bash
   npm install -g netlify-cli
   ```

2. **Login and Deploy**:
   ```bash
   cd frontend
   netlify login
   netlify deploy --prod
   ```

### Step 3: Configure Custom Domain (Optional)

1. Go to Site settings → Domain management
2. Add your custom domain
3. Configure DNS settings as instructed

## Backend Deployment (Render)

### Step 1: Prepare Backend for Production

1. **Update Environment Variables**:
   Create a `.env.production` file in the `backend/` directory:

   ```bash
   NODE_ENV=production
   PORT=10000
   MONGODB_URI=your_mongodb_atlas_connection_string
   JWT_SECRET=your_jwt_secret_key
   CORS_ORIGIN=https://your-netlify-site.netlify.app
   ```

2. **Test Build Locally**:
   ```bash
   cd backend
   npm install
   npm start
   ```

### Step 2: Deploy to Render

1. **Create New Web Service**:

   - Go to [render.com](https://render.com) and sign in
   - Click "New +" → "Web Service"
   - Connect your GitHub repository

2. **Configure Service**:

   - **Name**: `freecodeveda-backend`
   - **Root Directory**: `backend`
   - **Runtime**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: Choose appropriate plan (Free tier available)

3. **Environment Variables**:
   Add the following environment variables:

   ```
   NODE_ENV=production
   PORT=10000
   MONGODB_URI=your_mongodb_atlas_connection_string
   JWT_SECRET=your_jwt_secret_key
   CORS_ORIGIN=https://your-netlify-site.netlify.app
   ```

4. **Deploy**:
   - Click "Create Web Service"
   - Wait for the build and deployment to complete
   - Note the generated URL (e.g., `https://freecodeveda-backend.onrender.com`)

### Step 3: Update Frontend API URL

1. **Update Netlify Environment Variables**:
   - Go back to Netlify
   - Update `VITE_API_URL` with your Render backend URL
   - Trigger a new deployment

## MongoDB Atlas Setup

1. **Create Cluster**:

   - Go to [mongodb.com/cloud/atlas](https://mongodb.com/cloud/atlas)
   - Create a free cluster

2. **Database Access**:

   - Create a database user with read/write permissions
   - Note the username and password

3. **Network Access**:

   - Add `0.0.0.0/0` to allow connections from anywhere (for production)

4. **Connection String**:
   - Get your connection string from the cluster
   - Replace `<username>`, `<password>`, and `<dbname>` with actual values

## Post-Deployment Verification

### Frontend (Netlify)

1. Visit your Netlify site URL
2. Check if the app loads correctly
3. Test navigation and basic functionality
4. Verify API calls are working

### Backend (Render)

1. Test your API endpoints:
   ```bash
   curl https://your-backend-url.onrender.com/api/health
   ```
2. Check Render logs for any errors
3. Verify database connections

## Environment Variables Summary

### Frontend (.env.production)

```bash
VITE_API_URL=https://your-backend-url.onrender.com
VITE_APP_NAME=FreeCodeVeda
```

### Backend (.env.production)

```bash
NODE_ENV=production
PORT=10000
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/freecodeveda
JWT_SECRET=your_secure_jwt_secret
CORS_ORIGIN=https://your-netlify-site.netlify.app
```

## Troubleshooting

### Common Issues

1. **CORS Errors**:

   - Ensure `CORS_ORIGIN` in backend matches your Netlify domain exactly
   - Check for trailing slashes

2. **Build Failures**:

   - Verify Node.js version compatibility
   - Check for missing dependencies
   - Review build logs

3. **Database Connection Issues**:

   - Verify MongoDB Atlas connection string
   - Check network access settings
   - Ensure database user has correct permissions

4. **Environment Variables**:
   - Double-check all environment variables are set correctly
   - Restart services after updating environment variables

### Getting Help

- **Netlify**: Check [docs.netlify.com](https://docs.netlify.com)
- **Render**: Check [render.com/docs](https://render.com/docs)
- **MongoDB Atlas**: Check [docs.atlas.mongodb.com](https://docs.atlas.mongodb.com)

## Next Steps

After successful deployment:

1. **Set up monitoring** and logging
2. **Configure CI/CD** for automatic deployments
3. **Set up custom domains** for both services
4. **Implement SSL certificates** (handled automatically by both platforms)
5. **Set up backup strategies** for your database

## Security Considerations

1. **Environment Variables**: Never commit sensitive data to Git
2. **CORS**: Restrict CORS origins to only your frontend domain
3. **JWT Secrets**: Use strong, unique JWT secrets
4. **Database Access**: Use least-privilege access for database users
5. **HTTPS**: Both platforms provide HTTPS by default

---

**Note**: This guide assumes you're using the free tiers of both platforms. For production applications, consider upgrading to paid plans for better performance and features.
