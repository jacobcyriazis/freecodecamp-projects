#!/bin/bash

# Salon appointment maker


# VARIABLES
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"


# FUNCTIONS
MAIN_MENU() {
  # display error message if there is one
  if [[ -n $1 ]]; then
    echo -e "\n$1\n"
  fi

  # display list of services
  SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES_LIST" | while IFS="|" read -r SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # read selection
  read SERVICE_ID_SELECTED


  # convert service selection to service name
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # if no match
  if [[ -z $SERVICE_NAME ]]; then
  MAIN_MENU "I could not find that service. What would you like today?"
  return
  fi

  echo -e "\nWhat's your phone number?"

  # read phone number
  read CUSTOMER_PHONE

  # check db for customer info
  CUSTOMER_ID_CHECK=$($PSQL "SELECT customer_id, name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # if not an existing customer
  if [[ -z $CUSTOMER_ID_CHECK ]]; then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # insert new customer into db
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"

  else
    # extract customer name from database
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"

  fi

  # create appointment
  read SERVICE_TIME
  
  # check if requested time is available
  APPOINTMENT_AVAILABILITY=$($PSQL "SELECT time FROM appointments WHERE time='$SERVICE_TIME'")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # schedule appointment
  SCHEDULE_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, '$SERVICE_ID_SELECTED')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

}


# MAIN SCRIPT

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU
