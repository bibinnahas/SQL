select
   c.contest_id,
   c.hacker_id,
   c.name,
   vvs.tv,
   vvs.tuv,
   sss.ts,
   sss.tas 
from
   contests c 
   left join
      (
         select
            co.contest_id,
            sum(total_views) as tv,
            sum(total_unique_views) as tuv 
         from
            view_stats vs 
            left join
               challenges ch 
               on vs.challenge_id = ch.challenge_id 
            left join
               colleges co 
               on co.college_id = ch.college_id 
         group by
            co.contest_id
      )
      vvs 
      on vvs.contest_id = c.contest_id 
   left join
      (
         select
            co.contest_id,
            sum(total_submissions) as ts,
            sum(total_accepted_submissions) as tas 
         from
            submission_stats ss 
            left join
               challenges ch 
               on vs.challenge_id = ch.challenge_id 
            left join
               colleges co 
               on co.college_id = ch.college_id 
         group by
            co.contest_id
      )
      sss 
      on vvs.contest_id = sss.contest_id
