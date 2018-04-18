Feature: Functionality of previous collage picker on collage display page
The previous collage picker should show scaled down versions of previously created collages in the session. It will not show the collage currently displayed in the main collage space. When a collage in the previous collage picker is clicked, the full sized original image appears in the main collage space with its title. The collages should appear in a single horizontal row. If there isn’t enough space, a scroll bar is there allow the user to see the entire row.

Background:
	Given that I am on the Collage Display Page
	And that a collage for topic "dogs" has been generated
	And that a collage for topic "cats" has been generated
	And that a collage for topic "birds" has been generated and is currently being displayed

Scenario: (15.1) Collage and title correctly shows in the main collage space when clicked from the previous collage picker.
	When the collage for topic "dogs" is clicked
	Then the collage for topic "dogs" appears in the main collage space
	Then the title "Collage for topic dogs" appears above main collage space
	Then a scaled down version of "cats" and "birds" collages should appear in the previous collage picker
	Then the collage for topic "dogs" does not appear in the previous collage picker


Scenario: (15.2) If there is not enough space for all of the collages, user is able to see all of the collages with a scroll bar
	When a collage for topic "lions" is generated
	And a collage for topic "giraffes" is generated
	And a collage for topic "lizards" is generated
	And a collage for topic "elephants" is generated
    And a collage for topic "pigs" is generated
    And a collage for topic "snakes" is generated
	And a collage for topic "cows" is generated
	And a collage for topic "chicken" is generated
    And a collage for topic "hamsters" is generated
    And a collage for topic "fish" is generated
	And a collage for topic "dolphins" is generated
	Then a scroll bar appears to see the entire row of collages 
