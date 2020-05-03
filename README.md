# TelstraPOC
This is a POC app for iOS which renders the URL response from a Rest API on a tableview. 

JSON content received from the API is decoded using swift's JSONDecoder class.

URL Session class is used for the API call

The Table View dispays image along with a title and a description in each of its cell, as the view is scrolled down
(Image is downloaded asynchronously and displayed using the main thread)

Unit Test cases have been written and tested on model(data received from json) 
