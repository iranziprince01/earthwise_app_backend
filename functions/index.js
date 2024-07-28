const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");
const cors = require("cors")({origin: true});

admin.initializeApp();

// Set up Nodemailer with your email service credentials
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "manziinnocent202@gmail.com",
    pass: "manzi101@",
  },
});

exports.sendEnrollmentEmail = functions.https.onRequest((req, res) => {
  cors(req, res, () => {
    const {email, courseName} = req.body;

    const mailOptions = {
      from: "manziinnocent202@gmail.com",
      to: email,
      subject: `Enrollment Confirmation: ${courseName}`,
      text: `You have successfully enrolled in the course: ${courseName}.`,
    };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        return res.status(500).send({status: "error", error: error.toString()});
      }
      return res.status(200).send({status: "success", info});
    });
  });
});
