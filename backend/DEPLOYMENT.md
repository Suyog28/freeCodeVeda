# Backend Deployment Guide - Free Hosting Options

## 🚀 **Recommended: Render (Most Generous Free Tier)**

### Step 1: Prepare Your Backend

1. **Test locally first**:

   ```bash
   cd backend
   npm install
   npm run dev
   ```

2. **Create environment file** (copy from `env.example`):
   ```bash
   cp env.example .env
   # Edit .env with your values
   ```

### Step 2: Deploy to Render

1. **Sign up** at [render.com](https://render.com)
2. **Create New Web Service**
3. **Connect your GitHub repository** (recommended) or use manual deploy
4. **Configure the service**:

   - **Name**: `freecodeveda-backend` (or your preferred name)
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: `Free`

5. **Set Environment Variables**:

   - `PORT`: `3000`
   - `MONGODB_URI`: Your MongoDB connection string (optional)
   - `ADMIN_TOKEN`: Your secret admin token (optional)
   - `CORS_ORIGIN`: Your frontend Netlify URL

6. **Deploy** and wait for build to complete

### Step 3: Get Your Backend URL

- Your backend will be available at: `https://your-app-name.onrender.com`
- Update your frontend `.env.production` with this URL

---

## 🔄 **Alternative: Railway**

### Step 1: Deploy to Railway

1. **Sign up** at [railway.app](https://railway.app)
2. **Create New Project**
3. **Deploy from GitHub** or use Railway CLI
4. **Set Environment Variables** (same as Render)
5. **Get your URL**: `https://your-app-name.railway.app`

---

## 🌐 **Alternative: Cyclic**

### Step 1: Deploy to Cyclic

1. **Sign up** at [cyclic.sh](https://cyclic.sh)
2. **Connect GitHub repository**
3. **Auto-deploy** on push
4. **Set Environment Variables**
5. **Get your URL**: `https://your-app-name.cyclic.app`

---

## 📊 **MongoDB Setup (Optional but Recommended)**

### Option A: MongoDB Atlas (Free Tier)

1. **Sign up** at [mongodb.com/atlas](https://mongodb.com/atlas)
2. **Create free cluster**
3. **Get connection string**:
   ```
   mongodb+srv://username:password@cluster.mongodb.net/FreeCodeVeda
   ```
4. **Set as `MONGODB_URI`** in your hosting platform

### Option B: Use File Storage (Default)

- Your app will automatically use JSON files if no MongoDB is configured
- Data persists between deployments

---

## 🔧 **Environment Variables Reference**

```bash
# Required
PORT=3000

# Optional (for MongoDB)
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/FreeCodeVeda

# Optional (for admin access)
ADMIN_TOKEN=your-secret-token

# Optional (for CORS)
CORS_ORIGIN=https://your-frontend.netlify.app
```

---

## ✅ **Deployment Checklist**

- [ ] Backend builds successfully locally
- [ ] Environment variables configured
- [ ] CORS origin set to your frontend URL
- [ ] MongoDB connection string (if using database)
- [ ] Admin token set (if using admin features)
- [ ] Backend URL obtained
- [ ] Frontend environment updated with backend URL
- [ ] Test API endpoints from frontend

---

## 🚨 **Common Issues & Solutions**

### Build Fails

- Ensure Node.js version 18+ in hosting platform
- Check all dependencies are in `package.json`
- Verify build command works locally

### CORS Errors

- Set `CORS_ORIGIN` to your exact frontend URL
- Include protocol (https://)
- Check for trailing slashes

### Database Connection Fails

- Verify MongoDB connection string
- Check network access in MongoDB Atlas
- Ensure database name is correct

### Environment Variables Not Working

- Restart service after setting variables
- Check variable names match exactly
- Verify no extra spaces or quotes

---

## 🔗 **Next Steps After Backend Deployment**

1. **Update Frontend Environment**:

   ```bash
   # In client/.env.production
   VITE_API_URL=https://your-backend-url.onrender.com
   ```

2. **Deploy Frontend to Netlify** (using the guide in client/DEPLOYMENT.md)

3. **Test Complete Application**:
   - Frontend loads from Netlify
   - Backend API calls work
   - All features function properly

---

## 💰 **Cost Breakdown (Free Tiers)**

- **Render**: 750 hours/month (enough for 24/7) - $0
- **Railway**: $5 credit/month (usually lasts 1-2 months) - $0
- **Cyclic**: 1000 hours/month - $0
- **MongoDB Atlas**: 512MB storage - $0

**Total cost: $0/month** 🎉
