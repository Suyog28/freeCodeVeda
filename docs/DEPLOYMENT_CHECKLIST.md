# 🚀 Complete Deployment Checklist

## ✅ **Pre-Deployment (Local Testing)**

- [ ] **Frontend builds successfully**: `cd client && npm run build`
- [ ] **Backend runs locally**: `cd backend && npm run dev`
- [ ] **API calls work** from frontend to backend
- [ ] **All routes function** properly
- [ ] **No console errors** in browser

---

## 🖥️ **Step 1: Deploy Backend**

### Choose Platform:

- [ ] **Render** (Recommended - 750 free hours/month)
- [ ] **Railway** (Alternative - $5 credit/month)
- [ ] **Cyclic** (Alternative - 1000 free hours/month)

### Backend Configuration:

- [ ] **Sign up** and create account
- [ ] **Create new web service**
- [ ] **Connect GitHub** repository (recommended)
- [ ] **Set build settings**:
  - Build Command: `npm install`
  - Start Command: `npm start`
  - Plan: Free
- [ ] **Set environment variables**:
  - `PORT`: `3000`
  - `CORS_ORIGIN`: `https://your-frontend-name.netlify.app` (update after frontend deploy)
- [ ] **Deploy** and wait for completion
- [ ] **Get backend URL**: `https://your-app-name.onrender.com`
- [ ] **Test backend endpoints** (e.g., `/api/courses`)

---

## 🌐 **Step 2: Deploy Frontend**

### Frontend Configuration:

- [ ] **Update environment**: Create `client/.env.production`
- [ ] **Set backend URL**: `VITE_API_URL=https://your-backend-url.com`
- [ ] **Build locally**: `cd client && npm run build`
- [ ] **Verify dist folder** contains built files

### Deploy to Netlify:

- [ ] **Sign up** at [netlify.com](https://netlify.com)
- [ ] **Choose deployment method**:
  - [ ] **Drag & Drop**: Upload `client/dist` folder
  - [ ] **Git Integration**: Connect repository
- [ ] **Set build settings** (if using Git):
  - Build Command: `npm run build`
  - Publish Directory: `dist`
  - Node Version: `18`
- [ ] **Get frontend URL**: `https://your-site-name.netlify.app`

---

## 🔧 **Step 3: Configure Environment Variables**

### In Netlify Dashboard:

- [ ] **Go to Site settings** > **Environment variables**
- [ ] **Add `VITE_API_URL`** with your backend URL
- [ ] **Redeploy** if needed

### In Backend Platform:

- [ ] **Update `CORS_ORIGIN`** with your exact Netlify URL
- [ ] **Restart service** after changes

---

## 🧪 **Step 4: Testing & Verification**

### Frontend Testing:

- [ ] **Homepage loads** without errors
- [ ] **All navigation routes** work
- [ ] **API calls succeed** (check Network tab)
- [ ] **No console errors** in browser
- [ ] **Forms submit** successfully
- [ ] **Admin features** work (if applicable)

### Backend Testing:

- [ ] **API endpoints respond** correctly
- [ ] **CORS errors resolved**
- [ ] **Database operations** work (if using MongoDB)
- [ ] **File storage** works (if using JSON files)

---

## 🚨 **Common Issues & Quick Fixes**

### Frontend Issues:

- [ ] **Build fails**: Check Node.js version (18+)
- [ ] **Routes don't work**: Verify `_redirects` file
- [ ] **API calls fail**: Check `VITE_API_URL` environment variable

### Backend Issues:

- [ ] **CORS errors**: Set `CORS_ORIGIN` to exact frontend URL
- [ ] **Build fails**: Ensure `package.json` has all dependencies
- [ ] **Database connection**: Verify MongoDB URI or use file storage

---

## 🔗 **Final Configuration**

### Environment Variables Summary:

```bash
# Frontend (.env.production or Netlify dashboard)
VITE_API_URL=https://your-backend-url.onrender.com

# Backend (hosting platform dashboard)
PORT=3000
CORS_ORIGIN=https://your-frontend-name.netlify.app
MONGODB_URI=mongodb+srv://... (optional)
ADMIN_TOKEN=your-secret-token (optional)
```

### URLs to Save:

- **Frontend**: `https://your-site-name.netlify.app`
- **Backend**: `https://your-app-name.onrender.com`
- **Admin Panel**: `https://your-site-name.netlify.app/admin`

---

## 🎉 **Deployment Complete!**

Your full-stack application is now live with:

- ✅ **Frontend**: Hosted on Netlify (Free)
- ✅ **Backend**: Hosted on Render/Railway/Cyclic (Free)
- ✅ **Database**: MongoDB Atlas (Free) or File Storage (Free)
- ✅ **Total Cost**: $0/month

---

## 📚 **Need Help?**

1. **Backend issues**: Check `backend/DEPLOYMENT.md`
2. **Frontend issues**: Check `client/DEPLOYMENT.md`
3. **Environment variables**: Verify all are set correctly
4. **Console errors**: Check browser developer tools
5. **API testing**: Use Postman or browser Network tab
