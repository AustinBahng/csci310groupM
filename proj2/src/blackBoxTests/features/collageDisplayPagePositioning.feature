Feature: Positioning of elements on the collage display page
The main collage space appears underneath the title. The build another collage button appears under the collage and slightly to the right of center. The input box is located to the left of the build another collage button. The previous collage picker should be below the main collage space.

Background: 
	Given that I am on the Collage Display Page
	And that a collage for topic "dogs" has been generated
	And that a collage for topic "cats" has been generated

Scenario: (7.1) The title of collages is in the correct location, The build another collage button is in the correct location, The input box is in the correct location, The previous collage picker is in the correct location
	Then the main collage space is underneath the title
	Then the build another collage button is underneath the main collage space and slightly to the right of center
	Then the input box is on the left of the build another collage button
	Then the previous collage picker is below the main collage space
