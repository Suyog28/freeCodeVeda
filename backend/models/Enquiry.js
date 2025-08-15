import mongoose from 'mongoose';

const schema = new mongoose.Schema({ name: String, mobile: String, email: String, course: String, branch: String }, { timestamps: true });
export const Enquiry = mongoose.models.Enquiry || mongoose.model('Enquiry', schema);

