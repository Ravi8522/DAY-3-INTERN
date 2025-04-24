# SQL Data Analysis: Medical Appointment No-Shows

## Overview
This repository contains my submission for the Data Analyst Internship Task 3 on SQL for Data Analysis. I analyzed a medical appointments dataset to identify patterns and factors associated with patient no-shows.

## Objective
To demonstrate proficiency in SQL by analyzing appointment data and extracting meaningful insights about factors influencing patient attendance.

## Tools Used
- MySQL
- MySQL Workbench for query execution and visualization

## Dataset
I used a medical appointments dataset containing patient and appointment information. The dataset includes:
- Patient demographic information (gender, age)
- Appointment scheduling details (scheduled date, appointment date)
- Patient medical conditions (hypertension, diabetes, alcoholism)
- Geographic information (neighborhood)
- Communication factors (SMS reminder received)
- Attendance outcome (no-show status)

## Database Structure
Created a database called `RAVI` with an `appointments` table containing the following fields:
- `patientid`: Unique identifier for patients
- `appointmentid`: Primary key, unique identifier for appointments
- `gender`: Patient gender
- `scheduledday`: Date when the appointment was scheduled
- `appointmentday`: Date of the actual appointment
- `age`: Patient age
- `neighbourhood`: Patient's neighborhood
- `scholarship`: Whether the patient receives financial aid (0 or 1)
- `hipertension`: Whether the patient has hypertension (0 or 1)
- `diabetes`: Whether the patient has diabetes (0 or 1)
- `alcoholism`: Whether the patient has alcoholism issues (0 or 1)
- `handcap`: Whether the patient has disabilities (0 or 1)
- `sms_received`: Whether the patient received an SMS reminder (0 or 1)
- `no_show`: Whether the patient missed the appointment ('yes' or 'no')

## Tasks Completed

### Basic Analysis
- Calculated total appointments and no-show count
- Analyzed no-show rates by gender
- Explored relationship between age and no-show behavior

### Advanced Analysis
- Identified neighborhoods with highest no-show rates
- Evaluated the effectiveness of SMS reminders on attendance
- Created a view to track daily no-show patterns

### Optimization
- Created an index on appointment date to improve query performance
- Built views to simplify complex analytical queries

## Key Findings
1. **SMS Reminders Impact**: Analysis revealed that patients who received SMS reminders had a different no-show rate compared to those who didn't
2. **Geographic Variations**: Certain neighborhoods show significantly higher no-show rates than others
3. **Demographic Patterns**: Age and gender show correlations with appointment attendance behavior

## Files in this Repository
- `APPOINTMENT_DATA.RAVI.sql`: Contains all SQL queries used in the analysis
- `screenshots/`: Directory containing screenshots of query outputs
- `findings.md`: Detailed analysis and interpretation of results

## Learning Outcomes
Through this task, I developed skills in:
- Writing SQL queries to analyze healthcare data
- Creating and optimizing database structures
- Using SQL views for simplified reporting
- Extracting actionable insights that could improve patient attendance

## SQL Techniques Demonstrated

### Basic SQL
```sql
-- Example of basic counting and aggregation
SELECT
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) AS no_shows
FROM appointments;
```

### Group By Analysis
```sql
-- Example of gender-based analysis
SELECT
    gender,
    COUNT(*) AS total,
    SUM(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(AVG(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) * 100, 2) AS no_show_rate_pct
FROM appointments
GROUP BY gender;
```

### Views Creation
```sql
-- Creating a view for daily no-show analysis
CREATE VIEW daily_no_shows AS
SELECT
    appointmentday,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN no_show = 'yes' THEN 1 ELSE 0 END) AS no_shows
FROM appointments
GROUP BY appointmentday;
```

### Query Optimization
```sql
-- Adding an index to improve query performance
CREATE INDEX idx_appointment_day ON appointments(appointmentday);
```

## Interview Questions and Answers

1. **What is the difference between WHERE and HAVING?**
   - WHERE filters individual rows before aggregation
   - HAVING filters groups after aggregation with GROUP BY
   - In my analysis, I used WHERE to filter specific patient demographics and HAVING to filter neighborhood groups with high no-show rates

2. **What are the different types of joins?**
   - INNER JOIN: Returns matched records from both tables
   - LEFT JOIN: Returns all records from left table and matching from right
   - RIGHT JOIN: Returns all records from right table and matching from left
   - FULL JOIN: Returns all records when there's a match in either table
   - While my current analysis focused on a single table, joins would be useful to connect patient data with other databases like treatment outcomes

3. **How do you calculate average revenue per user in SQL?**
   ```sql
   -- In a healthcare context, this could be calculating average cost per patient
   SELECT patientid, AVG(procedure_cost) as avg_cost
   FROM procedures
   GROUP BY patientid;
   ```

4. **What are subqueries?**
   - Subqueries are nested queries within another query
   - In my analysis, I could have used subqueries to identify patients with multiple missed appointments:
   ```sql
   SELECT patientid, COUNT(*) as missed_appointments
   FROM appointments
   WHERE patientid IN (
       SELECT patientid 
       FROM appointments 
       WHERE no_show = 'yes'
   )
   GROUP BY patientid;
   ```

5. **How do you optimize a SQL query?**
   - I created an index on `appointmentday` to speed up date-based queries
   - Used specific column selection instead of SELECT *
   - Created views for frequently used complex queries
   - Used appropriate data types for columns to reduce storage requirements

6. **What is a view in SQL?**
   - A view is a virtual table based on a query result
   - I created the `daily_no_shows` view to easily track appointment attendance patterns by date without rewriting complex queries

7. **How would you handle null values in SQL?**
   - Used COALESCE() to substitute null values with defaults
   - Used IS NULL/IS NOT NULL in WHERE clauses when filtering data
   - Ensured aggregate functions properly account for nulls
   - In this dataset, I checked for nulls in critical fields like appointment dates and no_show status before analysis
