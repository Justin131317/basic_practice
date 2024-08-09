INSERT INTO job_applied
            (job_id,
            application_sent_date,
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status)
values      (1,
            '2024-02-01',
            true,
            'resume_01.pdf',
            true,
            'cover_letter_01.pdf',
            'sumbmitted'),
             (2,
            '2024-02-02',
            false,
            'resume_02.pdf',
            false,
            NULL,
            'interview scheduled'),
             (3,
            '2024-02-03',
            true,
            'resume_03.pdf',
            true,
            'cover_letter_03.pdf',
            'ghosted'),
             (4,
            '2024-02-04',
            true,
            'resume_04.pdf',
            false,
            NULL,
            'sumbmitted'),
             (5,
            '2024-02-05',
            false,
            'resume_05.pdf',
            true,
            'cover_letter_05.pdf',
            'rejected');     


SELECT *
FROM job_applied