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
- `screenshots of query output/`: Directory containing screenshots of query outputs
- `findings-readme (1).md`: Detailed analysis and interpretation of results

## Learning Outcomes
Through this task, I developed skills in:
- Writing SQL queries to analyze healthcare data
- Creating and optimizing database structures
- Using SQL views for simplified reporting
- Extracting actionable insights that could improve patient attendance
