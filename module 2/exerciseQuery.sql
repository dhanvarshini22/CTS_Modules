--user upcoming events

SELECT u.full_name, e.title, e.city, e.start_date
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming' AND u.city = e.city
ORDER BY e.start_date;

--top rated events

SELECT e.title, AVG(f.rating) AS avg_rating, COUNT(*) AS feedback_count
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC;

--Inactive Users (last 90 days)

SELECT u.*
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id AND r.registration_date >= CURDATE() - INTERVAL 90 DAY
WHERE r.registration_id IS NULL;

-- Peak Session Hours (10 AM to 12 PM)

SELECT e.title, COUNT(*) AS session_count
FROM Sessions s
JOIN Events e ON s.event_id = e.event_id
WHERE TIME(s.start_time) BETWEEN '10:00:00' AND '11:59:59'
GROUP BY s.event_id;

-- Most Active Cities

SELECT u.city, COUNT(DISTINCT r.user_id) AS user_count
FROM Registrations r
JOIN Users u ON r.user_id = u.user_id
GROUP BY u.city
ORDER BY user_count DESC
LIMIT 5;

--Event Resource Summary

SELECT e.title,
       SUM(resource_type = 'pdf') AS pdf_count,
       SUM(resource_type = 'image') AS image_count,
       SUM(resource_type = 'link') AS link_count
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
GROUP BY e.event_id;

--Low Feedback Alerts

SELECT u.full_name, e.title AS event_title, f.rating, f.comments
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating < 3;

--Sessions per Upcoming Event

SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
GROUP BY e.event_id;

--Organizer Event Summary

SELECT u.full_name, e.status, COUNT(*) AS total_events
FROM Events e
JOIN Users u ON e.organizer_id = u.user_id
GROUP BY e.organizer_id, e.status;

--Feedback Gap

SELECT DISTINCT e.title
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON r.event_id = f.event_id
WHERE f.feedback_id IS NULL;

--Daily New User Count (last 7 days)

SELECT registration_date, COUNT(*) AS new_users
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date;

--Event with Maximum Sessions

SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id
ORDER BY session_count DESC
LIMIT 1;

-- Average Rating per City

SELECT e.city, AVG(f.rating) AS avg_rating
FROM Feedback f
JOIN Events e ON f.event_id = e.event_id
GROUP BY e.city;

--Most Registered Events

SELECT e.title, COUNT(*) AS total_registrations
FROM Registrations r
JOIN Events e ON r.event_id = e.event_id
GROUP BY e.event_id
ORDER BY total_registrations DESC
LIMIT 3;

--Event Session Time Conflict

SELECT s1.event_id, s1.title AS session1, s2.title AS session2
FROM Sessions s1
JOIN Sessions s2 ON s1.event_id = s2.event_id
AND s1.session_id < s2.session_id
WHERE s1.end_time > s2.start_time AND s1.start_time < s2.end_time;

--Unregistered Active Users (last 30 days)

SELECT u.*
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
WHERE u.registration_date >= CURDATE() - INTERVAL 30 DAY
AND r.registration_id IS NULL;

-- Multi-Session Speakers

SELECT speaker_name, COUNT(*) AS session_count
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*) > 1;

--Resource Availability Check

SELECT e.title
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
WHERE r.resource_id IS NULL;

--Completed Events with Feedback Summary

SELECT e.title,
       COUNT(DISTINCT r.user_id) AS total_registrations,
       AVG(f.rating) AS avg_rating
FROM Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id;

--User Engagement Index

SELECT u.full_name,
       COUNT(DISTINCT r.event_id) AS events_attended,
       COUNT(DISTINCT f.feedback_id) AS feedbacks_given
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
LEFT JOIN Feedback f ON u.user_id = f.user_id
GROUP BY u.user_id;

--Top Feedback Providers

SELECT u.full_name, COUNT(*) AS feedback_count
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
GROUP BY f.user_id
ORDER BY feedback_count DESC
LIMIT 5;

--Duplicate Registrations Check

SELECT user_id, event_id, COUNT(*) AS reg_count
FROM Registrations
GROUP BY user_id, event_id
HAVING COUNT(*) > 1;

-- Registration Trends (last 12 months)

SELECT DATE_FORMAT(registration_date, '%Y-%m') AS month, COUNT(*) AS reg_count
FROM Registrations
WHERE registration_date >= CURDATE() - INTERVAL 12 MONTH
GROUP BY month
ORDER BY month;

--Average Session Duration per Event

SELECT e.title,
       ROUND(AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time))) AS avg_duration_mins
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id;

--Events Without Sessions

SELECT e.title
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE s.session_id IS NULL;

