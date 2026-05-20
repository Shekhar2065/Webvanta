-- ============================================
-- Webvanta Database Setup
-- Run this file once in phpMyAdmin or MySQL CLI
-- ============================================

CREATE DATABASE IF NOT EXISTS webvanta_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE webvanta_db;

-- Projects table
CREATE TABLE IF NOT EXISTS projects (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(150)  NOT NULL,
    description TEXT          NOT NULL,
    category    VARCHAR(80)   NOT NULL,
    tech_stack  VARCHAR(255)  NOT NULL,
    image_url   VARCHAR(255)  DEFAULT '',
    live_url    VARCHAR(255)  DEFAULT '',
    is_featured TINYINT(1)   DEFAULT 0,
    sort_order  INT           DEFAULT 0,
    created_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

-- Reviews / testimonials table
CREATE TABLE IF NOT EXISTS reviews (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    client_role VARCHAR(100) NOT NULL,
    company     VARCHAR(100) NOT NULL,
    avatar_url  VARCHAR(255) DEFAULT '',
    rating      TINYINT      DEFAULT 5,
    review_text TEXT         NOT NULL,
    is_approved TINYINT(1)  DEFAULT 0,
    created_at  TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);

-- Contact form submissions
CREATE TABLE IF NOT EXISTS contacts (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    email      VARCHAR(150) NOT NULL,
    company    VARCHAR(100) DEFAULT '',
    budget     VARCHAR(80)  DEFAULT '',
    message    TEXT         NOT NULL,
    is_read    TINYINT(1)  DEFAULT 0,
    created_at TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Sample Data
-- ============================================

INSERT INTO projects (title, description, category, tech_stack, image_url, live_url, is_featured, sort_order) VALUES
('EcomBoost Store', 'A full-featured e-commerce platform with AI-powered product recommendations, real-time inventory, and Stripe payments. Achieved 40% conversion rate increase for the client.', 'E-Commerce', 'React, Node.js, MySQL, Stripe, AI/ML', 'https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=800&q=80', 'https://example.com', 1, 1),
('HealthTrack Dashboard', 'Patient management system with AI-driven analytics, appointment scheduling, and HIPAA-compliant data handling for a chain of 12 clinics.', 'Healthcare SaaS', 'Vue.js, PHP, MySQL, Chart.js', 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800&q=80', 'https://example.com', 1, 2),
('RealEstate Pro', 'Property listing platform with AI valuation tool, virtual tour integration, and advanced map search. 300% increase in qualified leads.', 'Real Estate', 'Next.js, PHP, MySQL, Google Maps API', 'https://images.unsplash.com/photo-1560518883-ce09059eeffa?w=800&q=80', 'https://example.com', 1, 3),
('LogiTrack Freight', 'Real-time freight and logistics management system with route optimization AI, live GPS tracking, and automated invoicing.', 'Logistics', 'React, PHP, MySQL, WebSockets', 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=800&q=80', 'https://example.com', 0, 4),
('EduLearn LMS', 'Full learning management system with video streaming, quizzes, certifications, and AI-generated study paths for 5,000+ students.', 'Education', 'PHP, MySQL, JavaScript, FFmpeg', 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800&q=80', 'https://example.com', 0, 5),
('FoodDash App', 'Restaurant ordering platform with real-time kitchen dashboard, delivery tracking, and loyalty rewards system. Onboarded 80+ restaurants in 3 months.', 'Food & Delivery', 'React Native, PHP, MySQL, Firebase', 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800&q=80', 'https://example.com', 0, 6);

INSERT INTO reviews (client_name, client_role, company, rating, review_text, is_approved) VALUES
('Sara Mitchell', 'CEO', 'EcomBoost Ltd', 5, 'Webvanta completely transformed our online store. The AI-powered recommendations alone increased our revenue by 40% in the first quarter. The team was professional, fast, and genuinely understood our business goals.', 1),
('Dr. James Oluwa', 'CTO', 'HealthTrack Clinics', 5, 'We needed a HIPAA-compliant system fast. Webvanta delivered a full patient dashboard in just 6 weeks. Their use of AI for analytics gave us insights we never had before. Exceptional work.', 1),
('Lena Hoffmann', 'Founder', 'RealEstate Pro', 5, 'Our property platform went from a basic listing site to an AI-powered sales machine. The AI valuation tool alone pays for itself every month. I recommend Webvanta to every startup founder I know.', 1),
('Ahmed Al-Rashid', 'Operations Director', 'LogiTrack Freight', 5, 'The route optimization AI they built saved us 22% in fuel costs in the first month. Webvanta doesn\'t just build websites — they build business tools that actually work.', 1),
('Priya Nair', 'Head of Digital', 'EduLearn Platform', 4, 'Great experience from start to finish. The LMS they built handles 5,000 concurrent students without a hiccup. Clean code, great documentation, and fast support whenever we needed it.', 1),
('Carlos Mendez', 'Co-Founder', 'FoodDash', 5, 'Webvanta built our entire platform in 10 weeks. The real-time kitchen dashboard is a game-changer. Our restaurant partners love it. Worth every penny.', 1);
