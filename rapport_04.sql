SELECT UPPER(c.last_name) || ' ' || c.first_name "Client",
       NVL2(c.pass_id, (CASE
                            WHEN c.pass_date > TO_DATE('14/05/2017', 'DD/MM/YYYY') THEN p.pass_name
                            ELSE 'Périmé'
                        END), 'Aucun') "Abonnement"
FROM t_customer c
LEFT OUTER JOIN t_pass p ON c.pass_id = p.pass_id /