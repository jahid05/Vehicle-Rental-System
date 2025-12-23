-- Query 1: JOIN
select
  b.booking_id,
  u.name as customer_name,
  v.name as vehicle_name,
  b.start_date,
  b.end_date,
  b.status
from
  bookings b
  inner join users u on b.user_id = u.user_id
  inner join vehicles v on b.vehicle_id = v.vehicle_id
  -- Query 2: EXISTS
select
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  v.rental_price,
  v.status
from
  vehicles v
where
  not exists (
    select
    from
      bookings b
    where
      b.vehicle_id = v.vehicle_id
  )
order by
  v.vehicle_id asc
  -- Query 3: WHERE
select
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  v.rental_price,
  v.status
from
  vehicles v
where
  v.type = 'Car'
  and status = 'Available'
  -- Query 4: GROUP BY and HAVING
select
  v.name as vehicle_name,
  count(b.booking_id) as total_bookings
from
  vehicles v
  inner join bookings b on v.vehicle_id = b.vehicle_id
group by
  v.vehicle_id,
  v.name,
  v.model
having
  count(b.booking_id) > 2
