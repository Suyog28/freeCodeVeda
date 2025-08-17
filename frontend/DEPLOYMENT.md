# Complete Deployment Guide - Frontend + Backend

## 🚀 **Step 1: Deploy Backend First (Required)**

### Option A: Render (Recommended - Free)

1. **Sign up** at [render.com](https://render.com)
2. **Create New Web Service**
3. **Connect GitHub** or use manual deploy
4. **Configure**:
   - **Name**: `freecodeveda-backend`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: `Free`
5. **Set Environment Variables**:
   - `PORT`: `3000`
   - `CORS_ORIGIN`: `https://your-frontend-name.netlify.app` (update after frontend deploy)
6. **Deploy** and get your backend URL: `https://your-app-name.onrender.com`

### Option B: Railway (Alternative)

1. **Sign up** at [railway.app](https://railway.app)
2. **Create New Project**
3. **Deploy from GitHub**
4. **Set same environment variables**
5. **Get URL**: `https://your-app-name.railway.app`

**📖 Full backend guide**: See `../backend/DEPLOYMENT.md`

---

## 🌐 **Step 2: Deploy Frontend to Netlify**

### Option A: Drag & Drop (Recommended for first deployment)

1. **Build locally first**:
   ```bash
   cd client
   npm run build
   ```
2. Go to [netlify.com](https://netlify.com) and sign in
3. **Drag and drop** your `client/dist` folder to Netlify
4. Your site will be deployed automatically

### Option B: Git Integration

1. **Push your code** to GitHub/GitLab/Bitbucket
2. In Netlify, click **"New site from Git"**
3. **Connect your repository**
4. **Set build settings**:
   - **Build command**: `npm run build`
   - **Publish directory**: `dist`
   - **Node version**: `18`

---

## 🔧 **Step 3: Configure Environment Variables**

### In Netlify Dashboard:

1. Go to **Site settings** > **Environment variables**
2. **Add `VITE_API_URL`** with your backend URL:
   ```
   VITE_API_URL=https://your-backend-name.onrender.com
   ```

### Or create `.env.production` file:

```bash
# In client/.env.production
VITE_API_URL=https://your-backend-name.onrender.com
```

---

## ✅ **Step 4: Test Your Deployment**

1. **Visit your Netlify URL**
2. **Test all routes** and functionality
3. **Check browser console** for any errors
4. **Verify API calls** work to your backend

---

## 🚨 **Common Issues & Solutions**

### Frontend Build Fails

- Ensure Node.js version 18+ is used
- Check all dependencies are in `package.json`
- Verify the build command works locally

### Routes Don't Work

- The `_redirects` file and `netlify.toml` should handle this
- Ensure the redirects are properly configured

### API Calls Fail

- Verify `VITE_API_URL` is set correctly in Netlify
- Check that your backend is accessible from the internet
- Ensure CORS is configured on your backend

### CORS Errors

- Set `CORS_ORIGIN` in backend to your exact Netlify URL
- Include protocol (https://)
- Check for trailing slashes

---

## 🔗 **Complete Deployment Flow**

```
1. Deploy Backend → Get Backend URL
2. Update Frontend .env.production with Backend URL
3. Deploy Frontend to Netlify
4. Set VITE_API_URL in Netlify dashboard
5. Test complete application
```

---

## 💰 **Total Cost: $0/month**

- **Backend**: Render/Railway/Cyclic (Free)
- **Frontend**: Netlify (Free)
- **Database**: MongoDB Atlas (Free) or File Storage (Free)
- **Domain**: Custom domain (Optional, $10-15/year)

---

## 📁 **File Structure for Deployment**

```
project/
├── backend/
│   ├── DEPLOYMENT.md     # Backend deployment guide
│   ├── package.json      # Backend dependencies
│   └── server.js         # Backend server
└── client/
    ├── DEPLOYMENT.md     # This guide
    ├── netlify.toml      # Netlify configuration
    ├── public/_redirects # Routing support
    ├── package.json      # Frontend dependencies
    └── vite.config.js    # Build configuration
```

---

## 🆘 **Need Help?**

1. **Check the backend deployment guide**: `../backend/DEPLOYMENT.md`
2. **Verify environment variables** are set correctly
3. **Test locally** before deploying
4. **Check console errors** in browser
5. **Verify backend is accessible** from internet
