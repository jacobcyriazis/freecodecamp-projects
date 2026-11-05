#!/bin/bash



# ~~~~~ NUMBER GUESSING GAME ~~~~~



# VARIABLES
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# create secret number
SECRET_NUMBER=( $(( (RANDOM % 1000) + 1 )) )



# FUNCTIONS
USERNAME_CHECK() {


  # greeting
  echo -e "\nEnter your username:\n"


  # read username
  read USERNAME
  declare -g USERNAME=$USERNAME


  # check database for existing user

  # if existing
  if [[ $USERNAME == $($PSQL "SELECT username FROM user_info WHERE username = '$USERNAME'") ]]; then

    # welcome back message + while loop to define variables
    USER_INFO=$($PSQL "SELECT * FROM user_info WHERE username = '$USERNAME'")

    echo "$USER_INFO" | while IFS="|" read -r USER_ID USERNAME GAMES_PLAYED BEST_GAME; do

      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
      FIRST_TIME=FALSE
    
    done


  # if not existing
  else

    # enter user info into database
    ENTER_USERNAME=$($PSQL "INSERT INTO user_info (username) VALUES ('$USERNAME')")

    # first time welcome message
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

    FIRST_TIME=TRUE

  fi

}



GUESSING_GAME() {

  # guessing game starts
  echo -e "\nGuess the secret number between 1 and 1000:\n"

    # read first guess
    read GUESS

    # increment tries
    TRIES=1

      # until loop until guess is CORRECT
      until [[ $GUESS == $SECRET_NUMBER ]]; do

        # if not valid INT
        if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
          echo "That is not an integer, guess again:"

        # if guess too low
        elif (( $GUESS < $SECRET_NUMBER )); then
          ((TRIES++))
          echo "It's higher than that, guess again:"
          
        # if guess too high
        elif (( $GUESS > $SECRET_NUMBER )); then
          ((TRIES++))
          echo "It's lower than that, guess again:"

        fi

        read GUESS

      done


  # correct guess confirmation message
  echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"

  # check if first time playing
  if [[ "$FIRST_TIME" == "TRUE" ]]; then

    # set games played to 1 and insert current guess as best guess
    NEW_INFO=$($PSQL "UPDATE user_info SET games_played = 1, best_game = $TRIES WHERE username = '$USERNAME'")

  else 

    # increment games played by 1
    UPDATE_GAMES=$($PSQL "UPDATE user_info SET games_played = games_played + 1 WHERE username = '$USERNAME'")

    # if current guesses is lower than best
    BEST_GAME=$($PSQL "SELECT best_game FROM user_info WHERE username = '$USERNAME'")
    if ! [[ $BEST_GAME < $TRIES ]]; then

      # replace best with current
      UPDATE_BEST=$($PSQL "UPDATE user_info SET best_game = $TRIES WHERE username = '$USERNAME'")

    fi

  fi

}


# MAIN SCRIPT LOGIC
USERNAME_CHECK

GUESSING_GAME
