Feature: UI of input box on collage display page
The input box should have a dark gray outline with a white background and have “Enter Topic” as the prompt text inside in light gray. Pressing the enter button in the input box should act as the “build another collage” button and trigger the build collage process. The prompt text should also disappear when the user begins to type.
 
Background:
        	Given that I am on the Collage Display Page
 
Scenario: (10.1) Correct outline color of input box, Correct background of input box, Correct prompt text of input box, Correct prompt text inside input box
        	Then the outline color of the input box is dark gray
		Then the background color of the input box is white
		Then the color of the prompt text is very light gray
		Then the prompt text is "Enter Topic"
        	
