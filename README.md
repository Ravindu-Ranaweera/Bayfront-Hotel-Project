# Bayfront-Hotel-Project

# Owner
- Employee View and Refresh
- Employee Add
- Employee Edit
- Employee Delete
- Employee Search By Name
- Room all View and Refresh
- Room Search by Room number and Press Today(Current Date available room)  

# Receptionist
- Employee View and Refresh
- Employee Search By Name
- Room Today View and Refresh

# Room View Process
- View all Current Date available rooms
- if(check_in_date and check_out_date == NULL)
- if(check_out_date < current date)

# Special Query
- Search by room number and View Current Date Available Rooms 
- SELECT room.room_id, room.room_type_id, room.room_number, <br />
    reservation.check_in_date, reservation.check_out_date <br />
    FROM reservation <br />
    RIGHT OUTER JOIN room <br />
    ON room.room_id = reservation.room_id <br />
    WHERE room.room_number LIKE '%{$search}%' AND <br />
    (reservation.check_in_date != '{$current_date}' AND <br />
    reservation.check_in_date > '{$current_date}' OR reservation.check_out_date < '{$current_date}' <br />
    OR  reservation.check_in_date IS NULL) <br />
    ORDER BY room.room_id"; <br />

# Important Details
- Have to set timezone for Our Sri Lanka 