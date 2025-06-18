<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Shopee</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        margin-top: 50px;
    }

    h1 {
        color: #333;
    }

    a {
        color: #007bff;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
    </style>
</head>

<body class="antialiased">
    <h1>Welcome to Shopee</h1>
    <p>This is the homepage of your Shopee application.</p>
    <form action="/post" method="post">
        @csrf
        <button type="submit">Submit</button>
    </form>
</body>

</html>