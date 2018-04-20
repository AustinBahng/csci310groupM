Feature: When the Build Collage button is pressed an animated busy/thinking symbol should be
displayed until the collage is generated and returned

Background:
	Given that I am on the Collage Display Page
	
Scenario: Checking for busy symbol in collage generation
	When I try to create a collage for topic "dogs" and shape "t"
	Then a busy symbol appears

Scenario: Checking for no busy symbol after collage has been generated
	And build a collage for topic "cats" with shape "t"
	Then I should not see a busy symbol
