:root {
  /* VoogStyle
     "pathI18n": ["content"],
     "titleI18n": "padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 200,
     "step": 10,
     "unit": "px",
     "scope": "global"
  */
  --blog-article-margin: 70px;
  /* VoogStyle
    "pathI18n": ["content", "title"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --content-title-font-size: 46px;
  /* VoogStyle
     "pathI18n": ["content", "title"],
     "titleI18n": "line_height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --content-title-line-height: 1em;
  /* VoogStyle
    "pathI18n": ["content", "title"],
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
  --content-title-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "title"],
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
  --content-title-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "title"],
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
  --content-title-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "title"],
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
  --content-title-text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "title"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --content-title-color: #333;
  /* VoogStyle
    "pathI18n": ["content", "date"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --post-date-font-size: 20px;
  /* VoogStyle
     "pathI18n": ["content", "date"],
     "titleI18n": "line_height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --post-date-line-height: 1.6em;
  /* VoogStyle
    "pathI18n": ["content", "date"],
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
  --post-date-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "date"],
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
  --post-date-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "date"],
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
  --post-date-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "date"],
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
  --post-date-text-transform: uppercase;
  /* VoogStyle
    "pathI18n": ["content", "date"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --post-date-color: #c33;
  /* VoogStyle
    "pathI18n": ["content", "text"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true,
    "boundVariables": [
      "--form-field-text-font-size"
    ]
  */
  --content-font-size: 20px;
  /* VoogStyle
     "pathI18n": ["content", "text"],
     "titleI18n": "line_height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --content-line-height: 1.4;
  /* VoogStyle
    "pathI18n": ["content", "text"],
    "titleI18n": "color",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --content-color: #333;
  /* VoogStyle
      "pathI18n": ["content", "link", "normal"],
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
        "--content-links-hover-font-weight"
      ]
    */
  --content-links-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "link", "hover"],
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
  --content-links-hover-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "link", "normal"],
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
      "--content-links-hover-font-style"
    ]
  */
  --content-links-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "link", "hover"],
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
  --content-links-hover-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "link", "normal"],
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
      "--content-links-hover-text-decoration"
    ]
  */
  --content-links-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "link", "hover"],
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
  --content-links-hover-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "link", "normal"],
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
      "--content-links-hover-text-transform"
    ]
  */
  --content-links-text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "link", "hover"],
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
  --content-links-hover-text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "link", "normal"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --content-links-color: #919191;
 /* VoogStyle
  "pathI18n": ["content", "link", "hover"],
  "titleI18n": "color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global",
  "featured": true
*/
  --content-links-hover-color: #333;
}
