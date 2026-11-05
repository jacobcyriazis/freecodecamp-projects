
# Reset databases for testing

PSQL="psql --username=freecodecamp --dbname=number_guesser -t --no-align -c"


RESET() {

  #start fresh each time
  RESET_TABLES=$($PSQL "TRUNCATE TABLE user_info RESTART IDENTITY")

}

RESET