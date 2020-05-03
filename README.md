# TelstraPOC
This is a POC app for iOS which renders the URL response from a Rest API on a tableview. 

JSON content received from the API is decoded using swift's JSONDecoder class.

URL Session data task is made use to receieve the URL response

The Table View dispays image along with a tile and a desscription in each of its cell, as the view is scrolled down
(Image is downloaded asynchronously and displayed using the main thread)

Unit Test cases have been written and tested on model(data received from json) 
