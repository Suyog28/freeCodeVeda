import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import cors from 'cors';
import morgan from 'morgan';
import fs from 'fs';
import dotenv from 'dotenv';
import { connectToDatabase } from './db.js';
import { Course } from './models/Course.js';
import { Batch } from './models/Batch.js';
import { TeamMember } from './models/TeamMember.js';
import { Enquiry } from './models/Enquiry.js';
import { Registration } from './models/Registration.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config();
const app = express();
const PORT = process.env.PORT || 3000;

// CORS configuration for production
const corsOptions = {
    origin: process.env.CORS_ORIGIN || ['http://localhost:5173', 'http://localhost:3000'],
    credentials: true,
    optionsSuccessStatus: 200
};

app.use(cors(corsOptions));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(morgan('dev'));

const dataDir = path.join(__dirname, 'data');
if (!fs.existsSync(dataDir)) fs.mkdirSync(dataDir);

const readJson = (fileName, fallback = []) => {
    const p = path.join(dataDir, fileName);
    try {
        if (!fs.existsSync(p)) return fallback;
        const raw = fs.readFileSync(p, 'utf-8');
        return JSON.parse(raw || '[]');
    } catch {
        return fallback;
    }
};
const writeJson = (fileName, data) => {
    const p = path.join(dataDir, fileName);
    fs.writeFileSync(p, JSON.stringify(data, null, 2), 'utf-8');
};

for (const f of ['courses.json', 'batches.json', 'blogs.json', 'team.json', 'enquiries.json', 'registrations.json']) {
    const p = path.join(dataDir, f);
    if (!fs.existsSync(p)) fs.writeFileSync(p, JSON.stringify([], null, 2));
}

let dbReady = false;
connectToDatabase(process.env.MONGODB_URI)
    .then(() => { dbReady = true; console.log('MongoDB connected'); })
    .catch(err => console.warn('MongoDB not connected. Using file-based storage. Reason:', err?.message));

function adminAuth(req, res, next) {
    const required = process.env.ADMIN_TOKEN;
    if (!required) return next();
    const provided = req.header('x-admin-token') || req.query.token;
    if (provided === required) return next();
    return res.status(401).json({ error: 'Unauthorized' });
}

app.get('/api/courses', async (req, res) => {
    if (dbReady) return res.json(await Course.find().sort({ createdAt: -1 }).lean());
    return res.json(readJson('courses.json'));
});

app.get('/api/batches', async (req, res) => {
    if (dbReady) return res.json(await Batch.find().sort({ createdAt: -1 }).lean());
    return res.json(readJson('batches.json'));
});

app.get('/api/blogs', (req, res) => {
    res.json(readJson('blogs.json'));
});
app.get('/api/blogs/:id', (req, res) => {
    const blogs = readJson('blogs.json');
    const blog = blogs.find(b => String(b.id) === String(req.params.id));
    if (!blog) return res.status(404).json({ error: 'Not found' });
    res.json(blog);
});

app.get('/api/team', async (req, res) => {
    if (dbReady) return res.json(await TeamMember.find().sort({ createdAt: -1 }).lean());
    return res.json(readJson('team.json'));
});

app.post('/api/enquire', async (req, res) => {
    if (dbReady) {
        const created = await Enquiry.create(req.body);
        return res.status(201).json({ success: true, id: String(created._id) });
    }
    const list = readJson('enquiries.json');
    const now = new Date().toISOString();
    const entry = { id: Date.now().toString(), createdAt: now, ...req.body };
    list.push(entry);
    writeJson('enquiries.json', list);
    return res.status(201).json({ success: true, id: entry.id });
});

app.post('/api/register', async (req, res) => {
    if (dbReady) {
        const created = await Registration.create(req.body);
        return res.status(201).json({ success: true, id: String(created._id) });
    }
    const list = readJson('registrations.json');
    const now = new Date().toISOString();
    const entry = { id: Date.now().toString(), createdAt: now, ...req.body };
    list.push(entry);
    writeJson('registrations.json', list);
    return res.status(201).json({ success: true, id: entry.id });
});

app.get('/api/enquiries', adminAuth, async (req, res) => {
    if (dbReady) return res.json(await Enquiry.find().sort({ createdAt: -1 }).lean());
    return res.json(readJson('enquiries.json'));
});
app.get('/api/registrations', adminAuth, async (req, res) => {
    if (dbReady) return res.json(await Registration.find().sort({ createdAt: -1 }).lean());
    return res.json(readJson('registrations.json'));
});

app.get('/api/health', (req, res) => res.json({ ok: true, db: dbReady }));

app.listen(PORT, () => console.log(`API on http://localhost:${PORT}`));


