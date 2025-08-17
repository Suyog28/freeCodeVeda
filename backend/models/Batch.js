import mongoose from 'mongoose';

const batchSchema = new mongoose.Schema({
    course: String,
    batchDate: String,
    mode: String,
    time: String,
    duration: String,
    branch: String
}, { timestamps: true });

export const Batch = mongoose.models.Batch || mongoose.model('Batch', batchSchema);

