 SELECT a.submission_date,
       a.running_count,
       a.hacker_id,
       a.NAME
FROM   (SELECT s.submission_date,
               Count(s.submission_date)
                 OVER (
                   partition BY s.submission_date) AS running_count,
               h.hacker_id,
               h.NAME,
               Row_number()
                 OVER(
                   partition BY s.submission_date
                   ORDER BY s.submission_date)     AS row_numb
        FROM   submissions s
               LEFT JOIN hackers h
                      ON h.hacker_id = s.hacker_id
        WHERE  s.submission_date = '2016-03-01'
                OR s.submission_date = '2016-03-02'
        GROUP  BY s.submission_date,
                  h.hacker_id,
                  h.NAME)a
WHERE  a.row_numb = 1
ORDER  BY 1,
          2,
          3  
