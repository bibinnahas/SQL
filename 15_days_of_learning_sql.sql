 SELECT s.submission_date,
       Count(s.submission_date)
         OVER (
           partition BY s.submission_date) AS running_count,
       h.hacker_id,
       h.NAME,
       Row_number()
         OVER(
           ORDER BY s.submission_date)     [row_number]
FROM   submissions s
       LEFT JOIN hackers h
              ON h.hacker_id = s.hacker_id
WHERE  s.submission_date = '2016-03-01'
GROUP  BY s.submission_date,
          h.hacker_id,
          h.NAME
ORDER  BY 3  