:root {
  /* VoogStyle
    "pathI18n": ["header", "title"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --header-site-title-font-size: 30px;
  /* VoogStyle
     "pathI18n": ["header", "title"],
     "titleI18n": "line_height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "",
     "scope": "global"
  */
  --header-site-title-line-height: 1;
  /* VoogStyle
    "pathI18n": ["header", "title"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --header-site-title-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["header", "title"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --header-site-title-font-style: normal;
  /* VoogStyle
    "pathI18n": ["header", "title"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --header-site-title-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["header", "title"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --header-site-title-text-transform: none;
  /* VoogStyle
    "pathI18n": ["header", "title"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --header-site-title-color: #444;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "normal"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --header-mainmenu-font-size: 14px;
  /* VoogStyle
     "pathI18n": ["header", "main_menu", "normal"],
     "titleI18n": "line_height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "",
     "scope": "global"
  */
  --header-mainmenu-line-height: 1.4;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "normal"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-hover-font-weight",
      "--header-mainmenu-active-font-weight"
    ]
  */
  --header-mainmenu-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "hover"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-active-font-weight"
    ]
  */
  --header-mainmenu-hover-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "active"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-hover-font-style",
      "--header-mainmenu-active-font-style"
    ]
  */
  --header-mainmenu-active-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "normal"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-hover-font-style",
      "--header-mainmenu-active-font-style"
    ]
  */
  --header-mainmenu-font-style: normal;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "hover"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-active-font-style"
    ]
  */
  --header-mainmenu-hover-font-style: normal;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "active"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --header-mainmenu-active-font-style: normal;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "normal"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-hover-text-decoration",
      "--header-mainmenu-active-text-decoration"
    ]
  */
  --header-mainmenu-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "hover"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-active-text-decoration"
    ]
  */
  --header-mainmenu-hover-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "active"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --header-mainmenu-active-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "normal"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-hover-text-transform",
      "--header-mainmenu-active-text-transform"
    ]
  */
  --header-mainmenu-text-transform: uppercase;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "hover"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --header-mainmenu-hover-text-transform: uppercase;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "active"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --header-mainmenu-active-text-transform: uppercase;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "normal"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true,
    "boundVariables": [
      "--header-mainmenu-hover-color",
      "--header-mainmenu-active-color"
    ]
  */
  --header-mainmenu-color: #888;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "hover"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-active-color"
    ]
  */
  --header-mainmenu-hover-color: #444;
  /* VoogStyle
    "pathI18n": ["header", "main_menu", "active"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global"
  */
  --header-mainmenu-active-color: #444;
}