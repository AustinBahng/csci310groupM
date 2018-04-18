Feature: UI of the build collage button on the initial page
The build collage button is dark gray with the label, “Build Collage” in white. The build collage button cannot be pressed unless the user has entered text into the input box and if text has been entered, the collage building process is triggered. The button is located to the right of the input box. 

Background:
	Given that I am on the Initial Page

Scenario: (4.1) Correct color of the build another collage button, Correct color of build another collage button text label, Correct label of build another collage button, Correct location of the build collage button
        Then the color of the build another collage button is grey
	Then the color of the build another collage text is white
	Then the label of the build another collage button is "Build Collage"
	Then the button is on the right of the input box


