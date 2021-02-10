-- \i ./db/views/transaction_view.sql
CREATE VIEW transaction_view AS

SELECT t.id
     , t.amount
     , x.total_amount
     , COALESCE(t.amount = x.total_amount, false) AS balanced
FROM transactions AS t
         LEFT JOIN (
    SELECT cp.transaction_id
         , SUM(p.amount) AS total_amount

    FROM payments AS p
             INNER JOIN cleared_payments AS cp ON p.id = cp.payment_id

    GROUP BY cp.transaction_id
) x ON x.transaction_id = t.id
