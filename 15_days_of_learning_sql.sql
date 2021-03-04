with sub1 as (SELECT s1.submission_date,
                s1.hacker_id,
                Count(DISTINCT s1.submission_id)                    AS
                   todays_submissions,
                1
                + Datediff(day, 'March 1,2016', s1.submission_date) AS
                contest_day,
                Count(DISTINCT s2.submission_date)                  AS
                submission_days
         FROM   submissions s1
                JOIN submissions s2
                  ON s1.hacker_id = s2.hacker_id
                     AND s1.submission_date > s2.submission_date
         GROUP  BY s1.submission_date,
                   s1.hacker_id)
-- select * from sub1 order by 1 ;
select * from submissions where submission_date = '2016-03-06' and hacker_id = 84307;
