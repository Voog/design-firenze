<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
{% unless page.keywords == nil or page.keywords == "" %}<meta name="keywords" content="{{ page.keywords }}">{% endunless %}
{% unless page.description == nil or page.keywords == "" %}<meta name="description" content="{{ page.description }}">{% endunless %}

<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}"> <!-- TODO: Add image location data tag -->{% endif %}

<script src="{{ javascripts_path }}/modernizr.js?4"></script>

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
{% stylesheet_link "main.css?4" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.css?4" %}<![endif]-->
<link rel="stylesheet" href="/assets/admin/tools/0.1.1/edicy-tools.css?4">

<title>{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}</title>

{% if site.data.fbadmin %}<meta property="fb:admins" content="{{ site.data.fbadmin }}"><!-- TODO: Add functionality -->{% endif %}
<meta property="og:type" content="website">
