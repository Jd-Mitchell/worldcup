#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# empty the database
echo $($PSQL "TRUNCATE teams, games")


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # get team_id from winners column
  TEAM_ID=$($PSQL "SELECT team_id from teams where name='$WINNER'")
  
  # if not found
  if [[ $WINNER != winner && opponent ]]
  then
    if [[ -z $TEAM_ID ]]
    then
    # insert team
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    # get new team_id
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted winner $WINNER"
      fi
    fi
  fi
# get team_id from oponents column
  TEAM_ID=$($PSQL "SELECT team_id from teams where name='$OPPONENT'")
  
  # if not found
  if [[ $OPPONENT != opponent ]]
  then
    if [[ -z $TEAM_ID ]]
    then
    # insert team
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    # get new team_id
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted opponent $OPPONENT"
      fi
    fi
    
  fi
  
  # get the numbers for the winner and opponent of each row


  # get new team_id

  # get game_id

done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  echo "Winner: $WINNER_ID"
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  echo "Opponent: $OPPONENT_ID"
  if [[ $WINNER_ID != winner ]]
  then
    GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values('$YEAR', '$ROUND', $WINNER_ID, $OPPONENT_ID,  $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ GAME_RESULT == 'INSERT 0 1' ]]
    then
      echo "added game"
    fi
  fi
done