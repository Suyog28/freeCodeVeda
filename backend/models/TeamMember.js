import mongoose from 'mongoose';

const schema = new mongoose.Schema({ name: String, role: String, bio: String }, { timestamps: true });
export const TeamMember = mongoose.models.TeamMember || mongoose.model('TeamMember', schema);

