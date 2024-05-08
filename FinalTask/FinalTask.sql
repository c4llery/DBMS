--8(a)
--Считал для каждого человека
--select users.user_id, (select count(*) from log where datetime(log.time) <= (select datetime((min(log.time))) from log where log.user_id = users.user_id AND log.bet != 0) and log.user_id = users.user_id) as TimesToCome
--from users
--group by user_id


--8(b)
--Выигрыш считал как прибыль
--select ((sum(log.win) - sum(log.bet) + 0.0) / sum(log.bet) * 100) from log

--8(c)
--Баланс - это разность выигрыша и ставки
--select log.user_id, (sum(log.win) - sum(log.bet)) as Balance
--from log
--group by user_id


--8(d)
--Брал выгоду для пользователя
--select users.geo, (sum(log.win) + 0.0) / sum(log.bet) * 100 as stonks from log join users on users.user_id = log.user_id
--where users.geo != ''
--group by users.GEO 
--order by -stonks

--8(e)
--Откинул пользователей, которые не указали город
--select users.geo, max(log.bet) as MaxStake from log join users on users.user_id = log.user_id where users.geo != ''
--group by users.geo
--order by -sum(log.bet)


--8(f)
--select avg(difference) as AverageTimeTillTry from
--(select users.user_id, ((select julianday(datetime((min(log.time)))) from log where user_id = users.user_id AND log.bet != 0) - (select julianday(datetime((min(log.time)))) from log where user_id = users.user_id)) as difference from users
--group by user_id)




