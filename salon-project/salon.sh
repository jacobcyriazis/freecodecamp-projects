#!/bin/bash

# Salon appointment maker


# VARIABLES
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
PHONE_REGEX="^[0-9]{3}[ -.]?[0-9]{3}[ -.]?[0-9]{4}$"


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
  read SERVICE_SELECT

  # check if input is a valid integer
  if [[ ! $SERVICE_SELECT =~ ^[0-9]$ ]]; then
    MAIN_MENU "Please enter a valid number."
    return
  fi

  # convert service selection to service name
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_SELECT;")

  # if no match, send to main menu
  if [[ -z $SERVICE_NAME ]]; then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    echo "You have selected $SERVICE_NAME"
    echo -e "\nPlease enter your phone number:"
  fi

  # read phone number
  read PHONE_NUMBER

  # check if number is valid
  until [[ $PHONE_NUMBER =~ $PHONE_REGEX ]]; do
    echo "$PHONE_NUMBER is not valid, please try again."
    read PHONE_NUMBER
  done

  # convert raw input to usable data
  CUSTOMER_PHONE="${PHONE_NUMBER//[!0-9]/}"

  # check db for customer info
  CUSTOMER_ID_CHECK=$($PSQL "SELECT customer_id, name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # if not an existing customer
  if [[ -z $CUSTOMER_ID_CHECK ]]; then
    echo -e "\nI did not find you in our records. What is your first name?"
    read CUSTOMER_NAME
  
    # loop until name matches valid pattern
    until [[ $CUSTOMER_NAME =~ ^[a-zA-Z]{1,30}$ ]]; do
      echo -e "\nThat is not a valid name, please try again. Hint: Between 1 and 30 letters, no special characters."
      read CUSTOMER_NAME
    done

    # insert new customer into db
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    echo -e "\nNice to meet you, $CUSTOMER_NAME! What time would you like your $SERVICE_NAME?"

  else
    # extract customer name from database
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"

  fi

  # create appointment
  read APPOINTMENT_TIME
  
  # check if requested time is available
  APPOINTMENT_AVAILABILITY=$($PSQL "SELECT time FROM appointments WHERE time='$APPOINTMENT_TIME'")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $APPOINTMENT_AVAILABILITY ]]; then
    # if available
    SCHEDULE_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$APPOINTMENT_TIME', $CUSTOMER_ID, '$SERVICE_SELECT')")
    echo -e "\nI have put you in for a $SERVICE_NAME at $APPOINTMENT_TIME, $CUSTOMER_NAME."

  else
    # if taken
    until [[ -z $APPOINTMENT_AVAILABILITY ]]; do
      echo -e "I'm sorry, that timeslot is unavailable! Please select another."
      read APPOINTMENT_TIME
      APPOINTMENT_AVAILABILITY=$($PSQL "SELECT time FROM appointments WHERE time='$APPOINTMENT_TIME'")
    done
    SCHEDULE_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$APPOINTMENT_TIME', $CUSTOMER_ID, '$SERVICE_SELECT')")
    echo -e "\nI have put you in for a $SERVICE_NAME at $APPOINTMENT_TIME, $CUSTOMER_NAME."
  fi

}


# MAIN SCRIPT

echo -e "\n~~~~~ JACOB'S SALON ~~~~~"
echo -e "\nWelcome to Jacob's Salon, how may I help you?\n"

MAIN_MENU
