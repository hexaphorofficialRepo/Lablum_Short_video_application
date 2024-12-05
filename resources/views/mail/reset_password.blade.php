<!DOCTYPE html>
<html>
<head>
    <title>Password Reset Request</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px 0;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <h2>Password Reset Request</h2>
    <p>Hello,</p>
    <p>Click the button below to reset your password:</p>
    <a href="{{ $resetLink }}" class="button">Reset Password</a>
    <p>Alternatively, you can copy and paste the link below into your browser:</p>
    <p><a href="{{ $resetLink }}">{{ $resetLink }}</a></p>
    <p>If you did not request this, please ignore this email.</p>
    <p>Thank you,<br>The Team</p>
</body>
</html>
