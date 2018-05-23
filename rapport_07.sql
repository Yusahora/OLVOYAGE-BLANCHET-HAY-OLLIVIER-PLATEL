SELECT *
FROM
  (SELECT DISTINCT depart.city || ' - ' || arrive.city "Meilleurs trains",
                   COUNT(ticket_id)
   FROM t_train train
   JOIN t_wagon_train w ON train.train_id = w.train_id
   JOIN t_ticket ticket ON w.wag_tr_id = ticket.wag_tr_id
   JOIN t_station depart ON train.departure_station_id = depart.station_id
   JOIN t_station arrive ON train.arrival_station_id = arrive.station_id
   GROUP BY train.train_id,
            depart.city,
            arrive.city
   ORDER BY COUNT(ticket_id) DESC)
WHERE ROWNUM < 6 
/