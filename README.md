# freeCodeVeda (Educational)

A lightweight full-stack clone of `https://freecodeveda.com/` for educational purposes. MERN stack (Express API + React client with Vite). File-based JSON storage by default; MongoDB optional.

## Run locally

1. Install Node 18+
2. Install dependencies:

```bash
npm install && cd client && npm install && cd ..
```

3. Start both servers (concurrently):

```bash
npm run dev
```

- Client: `http://localhost:5173`
- API: `http://localhost:3000`

If port 3000 is busy on Windows:

```bat
for /f "tokens=5" %a in ('netstat -ano ^| findstr :3000') do taskkill /F /PID %a
```

## API

- GET `/api/courses`
- GET `/api/batches`
- GET `/api/blogs`
- GET `/api/blogs/:id`
- GET `/api/team`
- POST `/api/enquire` { name, mobile, email?, course, branch }
- POST `/api/register` { name, mobile, email?, course, branch }

Data is persisted to `data/*.json` files, or MongoDB if `MONGODB_URI` is set.

## Folder structure

- `backend/`: Express API, models, data
- `frontend/`: React app (Vite)
- `postman_collection.json`: ready-to-import API collection

## Production

```bash
npm run build
npm start
```

Express serves `client/dist` if present.

## Notes

- This is a simplified educational clone and not affiliated with Skillio. Content used for demo only.
- Optional env vars: `PORT`, `MONGODB_URI`
"# freeCodeVeda" 
