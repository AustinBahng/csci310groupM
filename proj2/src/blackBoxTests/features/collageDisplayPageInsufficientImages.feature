Feature: Insufficient collage appearance in the Collage Display Page
If less than 30 images were found, the message “insufficient number of images” is displayed in main collage space in black text and 18pt font.

Background: 
	Given that I am on the Collage Display Page
	And that a collage for topic "dasjdla;doasl;dkqp" has tried to be generated

Scenario: (17.1) Correct message returned, Correct font color of message, Correct font size of message
	Then "Insufficient number of images" message is displayed in the main collage space 
	Then "Insufficient number of images" message is in black font
	Then "Insufficient number of images" is in 18pt font
