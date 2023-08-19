// import nodemailer from 'nodemailer';

export const sendEmail = async (options) => {
  // 1) Create a transporter
  const transporter = nodemailer.createTransport({
    // service: 'Gmail',
    host: process.env.EMAIL_HOST,
    port: process.env.EMAIL_POST,
    auth: {
      user: process.env.EMAIL_USERNAME,
      pass: process.env.EMAIL_PASSWORD,
    },
    // Activate in gmail "less secure app option"
  });

  // 2) Define email optiions
  const emailOptions = {
    from: "Money Keeper <moneykeeper@gmail.com>",
    to: options.email,
    subject: options.subject,
    text: options.message,
    //html:
  }

  // 3) Actually send the email
  await transporter.sendMail(emailOptions)
};