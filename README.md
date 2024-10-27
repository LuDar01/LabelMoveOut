# MoveOut Application

## Overview
MoveOut is a web application for organizing belongings using digital labels with QR codes. Users can choose from various label designs, add content (image, audio, or text), and generate printable QR codes that display the content when scanned. MoveOut supports email-based registration with optional email verification for Gmail users.

## Built With
- **Languages & Frameworks**: JavaScript, Node.js, Express, MySQL, EJS
- **Security & Storage**: BcryptJS for password hashing, AWS S3 for file storage
- **Utilities**: Multer for file uploads, Nodemailer for email functionality, Dotenv, QRCode

## Features

### User Accounts
- **Registration & Login**: Users can register with an email and password. Email verification is required for non-Gmail users.
- **Password Security**: Passwords are securely hashed with bcrypt for safe storage.

### Labels
- **Custom Labels**: Users create labels by selecting a design, adding a description, and uploading content (image, audio, or text).
- **QR Code Generation**: Each label has a QR code that can be printed. When scanned, it displays the label’s content.
- **Printing Labels**: Labels are printable, with a layout that includes the description, QR code, and selected icon.

### Content Management
- **File Uploads**: Content associated with labels is uploaded and securely stored in AWS S3.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/LuDa01/MoveOut.git

2. **Install Dependencies**:
   - Navigate to the MoveOut directory:
     ```bash
     cd MoveOut
     ```
   - Install the necessary dependencies:
     ```bash
     npm install
     ```

3. **Set Up Database**:
   - Create a MySQL database.
   - Import the `move.sql` file to set up required tables and initial data.

4. **Configure Environment Variables**:
   - Create a `.env` file with the following settings:
     - AWS S3 credentials:
       ```plaintext
       AWS_ACCESS_KEY=your_aws_access_key
       AWS_SECRET_KEY=your_aws_secret_key
       AWS_REGION=your_aws_region
       ```
     - Session secret:
       ```plaintext
       SESSION_SECRET=your_session_secret
       ```
     - Nodemailer credentials for email verification:
       ```plaintext
       EMAIL_USER=your_email@example.com
       EMAIL_PASS=your_email_password
       ```

5. **Run the Application**:
   - Start the application:
     ```bash
     node app.js
     ```
## Testing the Application

### Account Registration and Login
- Test registration and email verification (if required).
- Log in using the newly created credentials.

### Label Creation and QR Code Testing
- Create labels, upload content, and verify that QR codes generate and display content upon scanning.

### Printing Labels
- Test label printing to ensure descriptions, QR codes, and icons appear as expected.

### Database and Error Handling
- Test CRUD operations for labels and handle edge cases such as invalid login details.

## License

**MIT License**

© 2024 Samra Krembi

**Permissions**: You are free to use, copy, modify, merge, publish, distribute, sublicense, and sell copies of this application.

For full license details, see the [LICENSE](./LICENSE) file.
