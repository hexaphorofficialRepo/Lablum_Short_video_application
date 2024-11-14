<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lablum Entertainment</title>
    <style>
        body {
            background: #f3f3f3;
        }

        #registration-form {
            font-family: 'Open Sans Condensed', sans-serif;
            width: 80%;
            min-width: 250px;
            margin: 20px auto;
            position: relative;
        }

        #registration-form .fieldset {
            background-color: #d5d5d5;
            border-radius: 3px;
        }

        #registration-form legend {
            text-align: center;
            background: #ca6ed6;
            width: 100%;
            padding: 30px 0;
            border-radius: 3px 3px 0 0;
            color: white;
            font-size: 2em;
        }

        .fieldset form {
            border: 1px solid #2f2f2f;
            margin: 0 auto;
            display: block;
            width: 100%;
            padding: 30px 20px;
            box-sizing: border-box;
            border-radius: 0 0 3px 3px;
        }

        .placeholder #registration-form label {
            display: none;
        }

        .no-placeholder #registration-form label {
            margin-left: 5px;
            position: relative;
            display: block;
            color: grey;
            text-shadow: 0 1px white;
            font-weight: bold;
        }

        ::-webkit-input-placeholder {
            text-shadow: 1px 1px 1px white;
            font-weight: bold;
        }

        ::-moz-placeholder {
            text-shadow: 0 1px 1px white;
            font-weight: bold;
        }

        :-ms-input-placeholder {
            text-shadow: 0 1px 1px white;
            font-weight: bold;
        }

        #registration-form input[type=text], #registration-form select {
            padding: 15px 20px;
            border-radius: 1px;
            margin: 5px auto;
            background-color: #f7f7f7;
            border: 1px solid silver;
            -webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.2);
            box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.2), 0 1px rgba(255, 255, 255, .8);
            width: 100%;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-transition: background-color .5s ease;
            -moz-transition: background-color .5s ease;
            -o-transition: background-color .5s ease;
            -ms-transition: background-color .5s ease;
            transition: background-color .5s ease;
        }

        .no-placeholder #registration-form input[type=text] {
            padding: 10px 20px;
        }

        #registration-form input[type=text]:active, .placeholder #registration-form input[type=text]:focus, 
        #registration-form select:focus {
            outline: none;
            border-color: silver;
            background-color: white;
        }

        #registration-form input[type=submit] {
            font-family: 'Open Sans Condensed', sans-serif;
            text-transform: uppercase;
            outline: none;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            width: 100%;
            background-color: #5C8CA7;
            padding: 10px;
            color: white;
            border: 1px solid #3498db;
            border-radius: 3px;
            font-size: 1.5em;
            font-weight: bold;
            margin-top: 5px;
            cursor: pointer;
            position: relative;
            top: 0;
        }

        #registration-form input[type=submit]:hover {
            background-color: #2980b9;
        }

        #registration-form input[type=submit]:active {
            background: #5C8CA7;
        }

        .parsley-error-list {
            background-color: #C34343;
            padding: 5px 11px;
            margin: 0;
            list-style: none;
            border-radius: 0 0 3px 3px;
            margin-top: -5px;
            margin-bottom: 5px;
            color: white;
            border: 1px solid #870d0d;
            border-top: none;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            position: relative;
            top: -1px;
            text-shadow: 0px 1px 1px #460909;
            font-weight: 700;
            font-size: 12px;
        }

        .parsley-error {
            border-color: #870d0d !important;
            border-bottom: none;
        }

        #registration-form select {
            width: 100%;
            padding: 5px;
        }

        .col-6 {
            width: 48%;
            display: inline-block;
        }

        .col-12 {
            width: 100%;
            display: block;
        }

        ::-moz-focus-inner {
            border: 0;
        }
    </style>
</head>
<body>
    <div id="registration-form">
        <div class='fieldset'>
            <legend>Delete Your Account!!</legend>
            <form action="#" method="post" data-validate="parsley">
                <div class="row">
                    
                    <div class='col-6'>
                        <label for='fname'>First Name</label>
                        <input type="text" placeholder="First Name" name='fname' id='fname' data-required="true" data-error-message="Your First Name is required">
                    </div>
                    <div class='col-6'>
                        <label for='lname'>Last Name</label>
                        <input type="text" placeholder="Last Name" name='lname' id='lname' data-required="true" data-error-message="Your Last Name is required">
                    </div>
                    <div class='col-6'>
                      <label for='username'>User Name</label>
                      <input type="text" placeholder="User Name" name='username' id='username' data-required="true" data-error-message="Your User Name is required">
                  </div>
                    <div class='col-6'>
                        <label for='mobile'>Mobile Number</label>
                        <input type="text" placeholder="Mobile Number" name='mobile' id='mobile' data-required="true" data-error-message="Your Mobile Number is required">
                    </div>
                    <div class='col-8'>
                        <label for="email">E-mail</label>
                        <input type="text" placeholder="E-mail" name='email' id='email' data-required="true" data-type="email" data-error-message="Your E-mail is required">
                    </div>
                    <div class='col-12'>
                        <label for="reason">Reason To Delete Account</label>
                        <select id="reason" name="reason" data-required="true" data-error-message="Please select a reason">
                            <option value="">Select a reason</option>
                            <option value="privacy">Privacy concerns</option>
                            <option value="not_useful">Not useful</option>
                            <option value="prefer_another">Prefer another service</option>
                            <option value="too_expensive">Too expensive</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <div class='col-12' id="otherReasonDiv" style="display: none;">
                        <label for="otherReason">Please specify your reason</label>
                        <input type="text" placeholder="Your reason" name='otherReason' id='otherReason'>
                    </div>
                </div>
                <input type="submit" value="Delete Account">
            </form>
        </div>
    </div>

    <script>
        function placeholderIsSupported() {
            test = document.createElement('input');
            return ('placeholder' in test);
        }

        document.addEventListener('DOMContentLoaded', function () {
            placeholderSupport = placeholderIsSupported() ? 'placeholder' : 'no-placeholder';
            document.querySelector('html').classList.add(placeholderSupport);

            document.getElementById('reason').addEventListener('change', function () {
                var otherReasonDiv = document.getElementById('otherReasonDiv');
                if (this.value === 'other') {
                    otherReasonDiv.style.display = 'block';
                } else {
                    otherReasonDiv.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>
