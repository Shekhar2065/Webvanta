# Webvanta Website — Setup Guide

## Project Structure

```
webvanta/
├── index.html          ← Main website (HTML + Tailwind + JS)
├── database.sql        ← Run this first in phpMyAdmin
├── includes/
│   └── db.php          ← Database config (edit credentials here)
├── api/
│   ├── projects.php    ← GET projects from DB
│   ├── reviews.php     ← GET approved reviews from DB
│   └── contact.php     ← POST contact form submissions
└── admin/
    └── index.php       ← Admin dashboard (PHP)
```

## Setup Steps

### 1. Requirements
- PHP 7.4+
- MySQL 5.7+
- Apache or Nginx (XAMPP / WAMP / Laragon works great)

### 2. Create the Database
- Open phpMyAdmin → go to SQL tab
- Paste the contents of `database.sql` and run it
- This creates the database, tables, and sample data

### 3. Configure DB Connection
Open `includes/db.php` and update:
```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');       // your MySQL username
define('DB_PASS', '');           // your MySQL password
define('DB_NAME', 'webvanta_db');
```

### 4. Place Files on Server
- Copy the entire `webvanta/` folder to `htdocs/` (XAMPP) or `www/` (WAMP)
- Visit: http://localhost/webvanta/

### 5. Admin Panel
- Visit: http://localhost/webvanta/admin/
- Default password: `webvanta2025`
- **Change the password** in `admin/index.php` line: `define('ADMIN_PASS', 'webvanta2025');`

## Adding Your Own Projects

### Option A — Via Admin Panel
1. Go to `/admin/`
2. Click "Projects" tab
3. Fill in the form and click "Add Project"

### Option B — Via database.sql
Add a row to the `projects` table:
```sql
INSERT INTO projects (title, description, category, tech_stack, image_url, live_url, is_featured)
VALUES ('My Project', 'Description here', 'E-Commerce', 'React, PHP', 'https://image-url.jpg', 'https://client-site.com', 1);
```

## Showing Client Websites
Yes! You can link to client websites. In the projects table:
- Set `live_url` to the client's website URL
- Visitors will see a "Visit Site" button on the project card
- For private/NDA projects, leave `live_url` empty and it shows "Private Project"

## Contact Form
All submissions are saved to the `contacts` table in MySQL.
You can view and reply to them in the admin panel.

To also receive email notifications, uncomment this line in `api/contact.php`:
```php
// mail('your@email.com', 'New Contact from ' . $name, $message, 'From: ' . $email);
```

## Customization
- Colors: Edit Tailwind config in `index.html` (`<script>tailwind.config = ...`)
- Company info: Search for "webvanta.com" and "Kathmandu" in `index.html`
- Phone/email: Update in the Contact section of `index.html`
