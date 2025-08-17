import mongoose from 'mongoose';

export async function connectToDatabase(uri) {
    const mongoUri = uri || process.env.MONGODB_URI || 'mongodb://127.0.0.1:27017/FreeCodeVeda';
    mongoose.set('strictQuery', true);
    await mongoose.connect(mongoUri, { dbName: 'FreeCodeVeda' });
    return mongoose.connection;
}

