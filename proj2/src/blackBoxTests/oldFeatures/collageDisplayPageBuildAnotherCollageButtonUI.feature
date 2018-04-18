Feature: UI of build another collage button on collage display page
The button should be dark gray and say “Build Another Collage” in white test. If a topic is entered in the input box, when the button is pressed, the build collage process should be triggered.
 
Background:
        	Given that I am on the Collage Display Page
 
Scenario: (8.1) Correct color of the build another collage button, Correct color of build another collage button text label, Correct label of build another collage button
        	Then the color of the build another collage button is grey
		Then the color of the build another collage text is white
		Then the label of the build another collage button is "Build Another Collage"
