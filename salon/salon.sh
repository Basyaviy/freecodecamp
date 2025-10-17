#!/bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"

PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"


READ_SERVICES(){
  if [[ $1 ]]
  then 
	echo -e "\n$1"
  else
	echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi

	AVAILABLE_SERVICES=$($PSQL "select service_id, name from services order by service_id;")
	echo "$AVAILABLE_SERVICES" | while IFS="|"  read SERVICE_ID SERVICE_NAME
	do
	  echo "$SERVICE_ID) $SERVICE_NAME"
	done

	read SERVICE_ID_SELECTED

	CURRENT_SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")

	HAS_SERVICE=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED");
	if [[ -z $HAS_SERVICE ]]
	then 
		READ_SERVICES "I could not find that service. What would you like today?"
	else
		echo -e "\nWhat's your phone number?"
		read CUSTOMER_PHONE
		# Find user
		CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'");
		
		# If not finded, register him	
		if [[ -z $CUSTOMER_ID ]]
		then
			echo -e "\nI don't have a record for that phone number, what's your name?"

			read CUSTOMER_NAME
			INSERT_CUSTOMER_ID=$($PSQL "insert into customers(phone, name) values ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');");
			CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'");
		else
			CUSTOMER_NAME=$($PSQL "select name from customers where customer_id=$CUSTOMER_ID")
		fi

		echo -e "\nWhat time would you like your $CURRENT_SERVICE_NAME, $CUSTOMER_NAME?"
		read SERVICE_TIME

		echo -e "\nI have put you down for a $CURRENT_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
		INSERT_APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) values ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
	fi
}


READ_SERVICES
