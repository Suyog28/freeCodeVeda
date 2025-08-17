import mongoose from 'mongoose';

const courseSchema = new mongoose.Schema({
    title: { type: String, required: true },
    shortDescription: String,
    description: String,
    duration: String
}, { timestamps: true });

export const Course = mongoose.models.Course || mongoose.model('Course', courseSchema);

