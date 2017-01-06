use ReportServer
go
with cte as (
select DATEDIFF(s, timestart, timeend) as seconds, itempath from dbo.executionLog3
)
select a.*
from cte a
inner join (
select itempath, MAX(seconds) as mseconds
from cte
group by itempath
) s on s.itempath = a.itempath and s.mseconds = a.seconds
order by a.seconds desc
go