<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">
<meta name="author" content="{{ site.author }}">

<meta property="fb:admins" content="1227335529">
<meta property="og:title" content="{{ site.title }}">
<meta property="og:type" content="website">
<meta property="og:url" content="{{ site.url }}">
<meta property="og:image" content="{{ site.url }}/photos/tbw-esileht-th.jpg">
<meta property="og:site_name" content="{{ site.title }}">
<meta property="og:description" content="{{ description }}">
<!-- http://graph.facebook.com/kasparnaaber -->
<!-- https://developers.facebook.com/tools/debug -->
<!-- Debug tuleb teha ka iga kord pärast seda, kui vahetad meta tagides midagi välja – enne ei korja Facebook seda külge -->
<!-- Siit saad ka veidi abi http://davidwalsh.name/facebook-meta-tags -->

<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css'>
{% stylesheet_link "main.css" %}
<!--[if lt IE 9]><link rel="stylesheet" href="stylesheets/ie8.css" type="text/css"><![endif]-->
<script src="javascripts/modernizr.js"></script>

<title>{% if article %}{{ article.title }} | {{page.site_title}}{% else %}{{page.site_title}} | {{ page.title }}{% endif %}</title>