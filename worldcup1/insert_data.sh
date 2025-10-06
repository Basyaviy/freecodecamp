#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo $PSQL

echo $($PSQL "TRUNCATE teams, games;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    # Убрать первую строку в CSV-файле
    if [[ $YEAR != year ]]
    then 
        TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
        if [[ -z $TEAM_ID ]]
        then
            # insert team
            INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values ('$WINNER')")
            if [[  $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
            then
                echo "Inserted into teams from winner, $WINNER"
            fi
        fi

        TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
        if [[ -z $TEAM_ID ]]
            then
            TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
            echo $TEAM_ID
            # insert team
            INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values ('$OPPONENT')")
            if [[  $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
            then
                echo "Inserted into teams from opponents, $OPPONENT"
            fi
        fi
    fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
# Убрать первую строку в CSV-файле
if [[ $YEAR != year ]]
then 
    # уникальное поле по year+round+winner+opponent
    # get unique
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    GAME_ID=$($PSQL "select game_id from games where year='$YEAR' and round='$ROUND' and winner_id='$WINNER_ID' and opponent_id='$OPPONENT_ID'")
    if [[ -z $TEAM_ID ]]
    then
        # insert student
        INSERT_GAME_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ('$YEAR', '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
        if [[  $INSERT_GAME_RESULT == "INSERT 0 1" ]]
        then
            echo "Inserted into students, $YEAR $ROUND $WINNER $OPPONENT"
        fi
    fi
fi
done

# Do not change code above this line. Use the PSQL variable above to query your database.
