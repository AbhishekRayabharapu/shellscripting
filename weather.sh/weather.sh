#!/bin/bash


# this script shows the weather condition in a city 
# Author :Abhishek Rayabharapu
# Version : v0.0.1
#
# the script supports all the cities in india 
# it uses weather_api to process and show the data


API_KEY="add your api key here "
City=$1

# check whether a city name is provided 

if [ -z "$City" ]; then
	echo "please provide a city name"
	echo "Usage ./weather.sh <city_name>"
	exit 1
fi

# weather_api url
URL="http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$City"

#fetching data using curl from the api
 response=$(curl -s $URL)
 
#condition to check the api request is successful

if [[ "$response" == *"error"* ]]; then
	echo" city not found or api error.Please check and try again"
	exit 1
fi



#parsing the response form weather api if the above condition is cleared

Temperature=$(echo $response | jq '.current.temp_c')
Description=$(echo $response | jq -r '.current.condition.text')
Humidity=$(echo $response | jq '.current.humidity')
WindSpeed=$(echo $response | jq '.current.windkph')

echo "the temperature in city is $Temperature"
echo "the condition is $Description"
echo "the Humidity is $Humidity"
echo "the Windspeed is $WindSpeed"

