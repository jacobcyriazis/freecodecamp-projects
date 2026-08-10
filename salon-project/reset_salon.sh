
# Reset databases for testing

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"


RESET() {

  #start fresh each time
  RESET_TABLES=$($PSQL "TRUNCATE TABLE appointments, customers")
  RESET_APPOINTMENT_IDS=$($PSQL "ALTER SEQUENCE appointments_appointment_id_seq RESTART WITH 1;")
  RESET_CUSTOMER_IDS=$($PSQL "ALTER SEQUENCE customers_customer_id_seq RESTART WITH 1;")

}

RESET