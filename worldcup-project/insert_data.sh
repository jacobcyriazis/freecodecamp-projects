#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Script to parse games.csv information and separate it into proper tables/columns


# VARIABLES

# separate country information and remove duplicates
ALL_TEAMS=$(mawk -F ',' 'NR > 1 {print $3; print $4}' games.csv | sort -u)


#FUNCTIONS

# insert data into both tables at once
INSERT_DATA() {

  # read TEAMS data
  echo "$ALL_TEAMS" | while read TEAM
  do

  #insert TEAMS data into teams table
  INSERT_TEAM_RESULTS=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM')")

  done


  # read each column in games.csv
  tail -n +2 games.csv | while IFS=',' read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do

  # call winning team_id value from teams table in place of team name
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  # call opponent team_id value from teams table in place of team name
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

  # convert inputs to corresponding ids
  WINNER=$WINNER_ID
  OPPONENT=$OPPONENT_ID

  # insert relevant results into games table
  INSERT_GAME_RESULTS=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

  done
}

INSERT_DATA
