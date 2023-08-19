import bcrypt from "bcryptjs";

export default async (password, storedPasswordHash) => {
    try {
      return await bcrypt.compare(password, storedPasswordHash);
    } catch (error) {
      return false;
    }
  };