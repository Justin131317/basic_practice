CREATE TABLE job_applied (
    job_id INT,
    application_sent_date date,
    custom_resume boolean,
    resume_file_name varchar(255),
    cover_letter_sent boolean,
    cover_letter_file_name varchar(255),
    status varchar(50)
);