.content-page .content-formatted h1, .content-formatted h1,
.front-page .light-background .content-formatted h1 {
  font-size: var(--h1-font-size);
  line-height: var(--h1-line-height);
  font-weight: var(--h1-font-weight);
  font-style: var(--h1-font-style);
  text-decoration: var(--h1-text-decoration);
  text-transform: var(--h1-text-transform);
  color: var(--h1-color);
}

.content-page .content-formatted h2, .content-formatted h2,
.front-page .light-background .content-formatted h2 {
  font-size: var(--h2-font-size);
  line-height: var(--h2-line-height);
  font-weight: var(--h2-font-weight);
  font-style: var(--h2-font-style);
  text-decoration: var(--h2-text-decoration);
  text-transform: var(--h2-text-transform);
  color: var(--h2-color);
}

.content-page .content-formatted h3, .content-formatted h3,
.front-page .light-background .content-formatted h3 {
  font-size: var(--h3-font-size);
  line-height: var(--h3-line-height);
  font-weight: var(--h3-font-weight);
  font-style: var(--h3-font-style);
  text-decoration: var(--h3-text-decoration);
  text-transform: var(--h3-text-transform);
  color: var(--h3-color);
}

.front-page .light-background .content-formatted h1,
.front-page .light-background .content-formatted h2,
.front-page .light-background .content-formatted h3 {
  color: var(--dark-primary);
}

.front-page .dark-background .content-formatted h1,
.front-page .dark-background .content-formatted h2,
.front-page .dark-background .content-formatted h3 {
  color: var(--light-primary);
}

.content-page .header-title,
.content-page .header-title a,
.content-page .header-title .header-link {
  font-size: var(--header-site-title-font-size);
  line-height: var(--header-site-title-line-height);
  font-weight: var(--header-site-title-font-weight);
  font-style: var(--header-site-title-font-style);
  text-decoration: var(--header-site-title-text-decoration);
  text-transform: var(--header-site-title-text-transform);
  color: var(--header-site-title-color);
}

.content-page .header-title .header-link:hover {
  color: var(--header-body-text-color);
  text-transform: var(--header-site-title-text-transform);
  font-style: var(--header-site-title-font-style);
}

.content-page .menu-main .menu .menu-item .menu-link {
  color: var(--header-mainmenu-color);
  text-transform: var(--header-mainmenu-text-transform);
  text-decoration: var(--header-mainmenu-text-decoration);
  font-style: var(--header-mainmenu-font-style);
  font-weight: var(--header-mainmenu-font-weight);
  line-height: var(--header-mainmenu-line-height);
  font-size: var(--header-mainmenu-font-size);
}

.content-page .menu-main .menu .menu-item .menu-link.active {
  color: var(--header-mainmenu-active-color);
  text-transform: var(--header-mainmenu-active-text-transform);
  text-decoration: var(--header-mainmenu-active-text-decoration);
  font-style: var(--header-mainmenu-active-font-style);
  font-weight: var(--header-mainmenu-active-font-weight);
}

.content-page .menu-main .menu .menu-item .menu-link:hover {
  color: var(--header-mainmenu-hover-color);
  text-transform: var(--header-mainmenu-hover-text-transform);
  text-decoration: var(--header-mainmenu-hover-text-decoration);
  font-style: var(--header-mainmenu-hover-font-style);
  font-weight: var(--header-mainmenu-hover-font-weight);
}

.front-page .menu-main .menu .menu-item .menu-link {
  text-transform: var(--header-mainmenu-text-transform);
  text-decoration: var(--header-mainmenu-text-decoration);
  font-style: var(--header-mainmenu-font-style);
  font-weight: var(--header-mainmenu-font-weight);
  line-height: var(--header-mainmenu-line-height);
  font-size: var(--header-mainmenu-font-size);
}

.front-page .dark-background .content-page .menu-main .menu .menu-item .menu-link,
.front-page .dark-background .content-page .menu-main .menu .menu-item .menu-link:hover {
  color: var(--font-one);
}

.front-page .light-background .content-page .menu-main .menu .menu-item .menu-link
.front-page .light-background .content-page .menu-main .menu .menu-item .menu-link:hover {
  color: var(--font-two);
}

.menu-sub .menu .menu-item {
  font-size: var(--content-submenu-font-size);
  line-height: var(--content-submenu-line-height);
}

.menu-sub .menu .menu-item .menu-link {
  font-weight: var(--content-submenu-font-weight);
  font-style: var(--content-submenu-font-style);
  text-decoration: var(--content-submenu-text-decoration);
  text-transform: var(--content-submenu-text-transform);
  color: var(--content-submenu-color);
}

.topbar .menu-main .menu .menu-item .menu-link.active,
.topbar .menu-main .menu .menu-item .menu-link.active:hover {
  color: #fff;
}

.menu-sub .menu .menu-item .menu-link:hover {
  font-weight: var(--content-submenu-hover-font-weight);
  font-style: var(--content-submenu-hover-font-style);
  text-decoration: var(--content-submenu-hover-text-decoration);
  text-transform: var(--content-submenu-hover-text-transform);
  color: var(--content-submenu-hover-color);
}

.menu-sub .menu .menu-item .menu-link.active {
  font-weight: var(--content-submenu-active-font-weight);
  font-style: var(--content-submenu-active-font-style);
  text-decoration: var(--content-submenu-active-text-decoration);
  text-transform: var(--content-submenu-active-text-transform);
  color: var(--content-submenu-active-color);
}

.content-formatted, .post-excerpt .content-formatted {
  font-size: var(--content-font-size);
  line-height: var(--content-line-height);
  color: var(--content-color);
}

.content-formatted a:not(.custom-btn) {
  font-weight: var(--content-links-font-weight);
  font-style: var(--content-links-font-style);
  text-decoration: var(--content-links-text-decoration);
  text-transform: var(--content-links-text-transform);
  color: var(--content-links-color);
}

.content-formatted a:not(.custom-btn):hover {
  font-weight: var(--content-links-hover-font-weight);
  font-style: var(--content-links-hover-font-style);
  text-decoration: var(--content-links-hover-text-decoration);
  text-transform: var(--content-links-hover-text-transform);
}

.footer .voog-reference a {
  color: var(--footer-color);
}

.content-formatted .custom-btn,
.content-formatted .form_submit input {
  background-color: var(--button-background-color);
  padding: calc(var(--button-padding) - 3px) var(--button-padding);
  font-size: var(--button-font-size);
  color: var(--button-color);
}
.content-formatted .custom-btn:hover,
.content-formatted .form_submit input:hover {
  opacity: .8;
  background-color: var(--button-background-color);
  color: #fff;
}

.content-formatted .form_submit input:hover
.front-page .dark-background .content-formatted a,
.front-page .dark-background .content-formatted .custom-btn,
.front-page .dark-background .content-formatted .form_submit input,
.front-page .dark-background .content-formatted .form_submit input:hover {
  color: var(--font-one);
  background-color: #06b;
}

.front-page .light-background .content-formatted .custom-btn,
.front-page .light-background .content-formatted .form_submit input,
.front-page .light-background .content-formatted .form_submit input:hover {
  color: var(--font-two);
  background-color: #06b;
}

.content-formatted table td {
  border-bottom-style: var(--table-border-style);
  border-top-style: var(--table-border-style);
  padding: var(--table-cell-padding);
  border-bottom-color: var(--table-border-color);
  border-top-color: var(--table-border-color);
}

.content-formatted .form_field_textfield,
.content-formatted .form_field_textarea,
.svg .content-formatted .form_field_checkbox + .form_control_indicator,
.svg .content-formatted .form_field_radio + .form_control_indicator,
.svg .content-formatted .form_field_select {
  background-color: var(--form-field-background-color);
}

.form_field_file,
.form_field .edy-fe-label {
  text-decoration: var(--form-field-text-text-decoration);
}

.form_field_file,
.form_field .edy-fe-label,
.content-formatted .form_field {
  color: var(--form-field-text-color);
  font-style: var(--form-field-text-font-style);
  text-transform: var(--form-field-text-text-transform);
}

.content-formatted .form_field label {
  text-decoration: none;
}

.content-formatted .form_field .form_field_label {
  font-weight: var(--form-field-text-font-weight);
}

.post-title {
  font-size: var(--blog-list-title-font-size);
  line-height: var(--blog-list-title-line-height);
  font-weight: var(--blog-list-title-font-weight);
  font-style: var(--blog-list-title-font-style);
  text-decoration: var(--blog-list-title-text-decoration);
  text-transform: var(--blog-list-title-text-transform);
  color: var(--blog-list-title-color);
  display: inline-block !important;
}

.post-title a {
  font-size: var(--blog-list-title-font-size);
  line-height: var(--blog-list-title-line-height);
  font-style: var(--blog-list-title-font-style);
  text-decoration: var(--blog-list-title-text-decoration);
  text-transform: var(--blog-list-title-text-transform);
  color: var(--blog-list-title-color);
}

.post-title a:hover {
  opacity: 0.8;
  color: var(--blog-list-title-color);
}

.post-date {
  font-size: var(--blog-list-date-font-size);
  line-height: var(--blog-list-date-line-height);
  font-weight: var(--blog-list-date-font-weight);
  font-style: var(--blog-list-date-font-style);
  text-decoration: var(--blog-list-date-text-decoration);
  text-transform: var(--blog-list-date-text-transform);
  color: var(--blog-list-date-color);
}

.content-page .container .wrap {
  max-width: var(--site-width);
  background-color: var(--color-bg);
}

@media screen and (min-width: 1400px) {
  .content-page .container .wrap {
    max-width: calc(var(--site-width) * 1.5);
  }
}
body {
  font-family: var(--font-one);
}

.light-background .content-formatted,
.light-background .header-title,
.light-background .header-title a,
.light-background .menu-main .menu .menu-item .menu-link,
.light-background .menu-main .menu .menu-item .menu-link.active,
.light-background .menu-main .menu .menu-item .menu-link:hover {
  color: var(--dark-primary);
}

.light-background .content-formatted table td {
  color: var(--dark-primary);
  border-top: 1px solid var(--dark-primary);
  border-bottom: 1px solid var(--dark-primary);
}

.dark-background .content-formatted,
.dark-background .header-title,
.dark-background .header-title a,
.dark-background .menu-main .menu .menu-item .menu-link,
.dark-background .menu-main .menu .menu-item .menu-link.active,
.dark-background .menu-main .menu .menu-item .menu-link:hover {
  color: var(--light-primary);
}

.dark-background .content-formatted table td {
  color: var(--light-primary);
  border-top: 1px solid var(--light-primary);
  border-bottom: 1px solid var(--light-primary);
}

.front-page .dark-background .header-top-inner {
  border-bottom: 3px solid var(--light-primary);
}

.front-page .light-background .content .content-formatted {
  border-top-color: var(--dark-primary);
}

.front-page .menu-main .menu .menu-item .menu-link.active,
.front-page .menu-main .menu .menu-item .menu-link:hover {
  opacity: .8;
}

.comments .comments-title, .content-formatted h1,
.header-title, .menu-main, .post-date, .post-title,
.post-title a, .tags-btn, .voog-search-modal-results h3 {
  font-family: var(--font-two);
}

.footer .content-formatted {
  font-size: var(--footer-font-size);
  line-height: var(--footer-line-height);
  color: #fff;
  color: rgba(255, 255, 255, 0.33);
}

/* "widescreen mode" rules, where area elements are 1.4 times bigger  */
@media screen and (min-width: 1400px) {
  body {
    font-size: calc(var(--content-font-size) * 1.4);
  }

  .content-formatted {
    font-size: calc(var(--content-font-size) * 1.4);
  }

  .content-formatted h1 {
    font-size: calc(var(--h1-font-size) * 1.4);
  }

  .content-page .content-formatted h1 {
    font-size: calc(var(--h1-font-size) * 1.4);
  }

  .content-formatted h2 {
    font-size: calc(var(--h2-font-size) * 1.4);
  }

  .content-page .content-formatted h2 {
    font-size: calc(var(--h2-font-size) * 1.4);
  }

  .content-formatted h3 {
    font-size: calc(var(--h3-font-size) * 1.4);
  }

  .content-page .content-formatted h3 {
    font-size: calc(var(--h3-font-size) * 1.4);
  }

  .front-page .menu-main .menu .menu-item .menu-link {
    font-size: calc(var(--header-mainmenu-font-size) * 1.4);
  }

  .footer .content-formatted {
    font-size: calc(var(--footer-font-size) * 1.4);
  }

  .content-page .menu-main .menu .menu-item .menu-link {
    font-size: calc(var(--header-mainmenu-font-size) * 1.4);
  }

  .content-page .header-title, .content-page .header-title a, .content-page .header-title .header-link {
    font-size: calc(var(--header-site-title-font-size) * 1.4);
  }

  .menu-sub .menu .menu-item, .menu-sub .menu .menu-item .menu-link {
    font-size: calc(var(--content-submenu-font-size) * 1.3);
  }

  .post-title, .post-title a {
    font-size: calc(var(--blog-list-title-font-size) * 1.4);
  }

  .post-date {
    font-size: calc(var(--blog-list-date-font-size) * 1.4);
  }

  .content-formatted .form_submit input {
    font-size: calc(var(--button-font-size) * 1.4);
  }
}
