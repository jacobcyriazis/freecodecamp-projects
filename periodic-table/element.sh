#!/bin/bash



#   ~~~ PERIODIC TABLE INFO ~~~



# VARIABLES
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


# MAIN SCRIPT LOGIC

# if input is NULL
if [[ -z $1 ]]; then
    echo "Please provide an element as an argument."

# if input is NOT NULL
  else

  # is input a number
  if [[ $1 =~ ^([1-9]|10)$ ]]; then
    DB_INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number = $1")
    echo "$DB_INFO" | while IFS="|" read -r TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE; do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  # input is a string
  else

    # input is atomic symbol
    if [[ $1 == $($PSQL "SELECT symbol FROM elements WHERE symbol = '$1'") ]]; then
      DB_INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE symbol = '$1'")
      echo "$DB_INFO" | while IFS="|" read -r TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE; do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done

    # input is element name
    elif [[ $1 == $($PSQL "SELECT name FROM elements WHERE name = '$1'") ]]; then
      DB_INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE name = '$1'")
      echo "$DB_INFO" | while IFS="|" read -r TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE; do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done

    # input is not valid
    else
      echo "I could not find that element in the database."

    fi

  fi

fi
