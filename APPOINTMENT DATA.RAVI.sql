CREATE DATABASE RAVI;
CREATE TABLE appointments (
    patientid BIGINT,
    appointmentid BIGINT PRIMARY KEY,
    gender VARCHAR(10),
    scheduledday DATE,
    appointmentday DATE,
    age INT,
    neighbourhood VARCHAR(100),
    scholarship TINYINT,
    hipertension TINYINT,
    diabetes TINYINT,
    alcoholism TINYINT,
    handcap TINYINT,
    sms_received TINYINT,
    no_show VARCHAR(5)
);

SELECT
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) AS no_shows
FROM appointments;

SELECT
    gender,
    COUNT(*) AS total,
    SUM(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(AVG(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) * 100, 2) AS no_show_rate_pct
FROM appointments
GROUP BY gender;


SELECT
    no_show,
    AVG(age) AS avg_age
FROM appointments
GROUP BY no_show;

SELECT
    neighbourhood,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(SUM(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS no_show_rate_pct
FROM appointments
GROUP BY neighbourhood
ORDER BY no_show_rate_pct DESC;

SELECT
    sms_received,
    COUNT(*) AS total,
    SUM(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(AVG(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) * 100, 2) AS no_show_rate_pct
FROM appointments
GROUP BY sms_received;

CREATE VIEW daily_no_shows AS
SELECT
    appointmentday,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) AS no_shows
FROM appointments
GROUP BY appointmentday;

CREATE INDEX idx_appointment_day ON appointments(appointmentday);

