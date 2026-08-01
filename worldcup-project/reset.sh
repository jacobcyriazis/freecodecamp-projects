#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi


RESET() {

  #start fresh each time
  RESET_TABLES=$($PSQL "TRUNCATE TABLE teams, games")
  RESET_TEAM_IDS=$($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1;")
  RESET_GAME_IDS=$($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1;")

}

RESET
