Feature: UI of previous collage picker on collage display page
The previous collage picker should show scaled down versions of previously created collages in the session. It will not show the collage currently displayed in the main collage space. When a collage in the previous collage picker is clicked, the full sized original image appears in the main collage space with its title. The collages should appear in a single horizontal row. If there isn’t enough space, a scroll bar is there allow the user to see the entire row.

Background:
	Given that I am on the Collage Display Page
	And that a collage for topic "dogs" has been generated
	And that a collage for topic "cats" has been generated
	And that a collage for topic "birds" has been generated and is currently being displayed

Scenario: (14.1) Previous collage picker correctly displays previously created collages in the session. And the current collage in the main collage space correctly shows in the previous collage picker.
	Then a scaled down version of "dogs" and "cats" collages should appear in the previous collage picker
	Then the collage for topic "birds" does not appear in the previous collage picker
	
