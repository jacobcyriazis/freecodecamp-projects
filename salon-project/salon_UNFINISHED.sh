#!/bin/bash

# Salon appointment maker


# Variables
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")


# Functions

# IN THE BENINGING
MAIN_MENU() {

  # display error message if there is one
  if [[ -n $1 ]]; then
    echo -e "\n$1\n"
  fi

    # SERVICE SELECTION
    # display list of services
    echo "$SERVICES_LIST" | while IFS="|" read -r ID NAME
    do
      echo "$ID) $NAME"
    done

    # read selection
    read SERVICE_SELECT

    # check if input is a valid integer before querying
    if [[ ! $SERVICE_SELECT =~ ^[0-9]+$ ]]; then
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
    fi


    # PHONE NUMBER
    echo -e "\nPlease enter your phone number (###-###-####):"

    # read phone number
    read CUSTOMER_PHONE

    # check if phone number is valid
    if  [[ ! $CUSTOMER_PHONE =~ ^[0-9][0-9][0-9]

    # if phone number invalid

    # send to request phone number

    # if not a customer

}


# Main script logic

# welcome message
echo -e "\n~~~~~ JACOB'S SALON ~~~~~"
echo -e "\nWelcome to Jacob's Salon, how may I help you?\n"

MAIN_MENU
