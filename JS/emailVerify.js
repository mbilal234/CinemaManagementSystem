const nodemailer = require('nodemailer');
      let transporter = nodemailer.createTransport({
             service: "gmail",
             auth: {
                 user: "cinema.ticketing.system117@gmail.com",
                 pass: "cdfbroywjzdqylhg"
             }
     })



// transporter.verify((error, success) => {
//     if (error){
//         console.log(error)
//     }else{
//         console.log("Ready for Messages");
//         console.log(success);
//     }
// })

function mailVerification(receiver){
    const verificationCode = Math.floor(100000 + Math.random() * 900000);
    message = {
        from: "cinema.ticketing.system117@gmail.com",
        to: receiver,
        subject: "Account Verification",
        text: `Your Verification Code is ${verificationCode}`
    }
    transporter.sendMail(message, function(err, info) {
        if (err) {
          console.log(err)
        } else {
          console.log(info);
        }
    });
    return verificationCode;
}

module.exports = mailVerification;

