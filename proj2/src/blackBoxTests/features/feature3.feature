Feature: When the Build Collage button is pressed, a collage shall be generated that fills the shape of the letters specified in the shape input with the photos that correspond to the topic input
 
Background:
        Given that I am on the Main web page

Scenario: Building with no Filter
        When I select no filter
        And build a collage for topic "cats" with shape "t"
        Then I should see the collage for topic "cats" generated
  
Scenario: Building with Sepia Filter
        When I select the sepia filter
        And build a collage for topic "cats" with shape "t"
        Then I should see the collage for topic "cats" generated

Scenario: Building with BW Filter
        When I select the bw filter
        And build a collage for topic "cats" with shape "t"
        Then I should see the collage for topic "cats" generated

Scenario: Building with Greyscale Filter Filter
        When I select the greyscale filter
        And build a collage for topic "cats" with shape "t"
        Then I should see the collage for topic "cats" generated

Scenario: Building with Rotations
        When I select the rotations checkbox
        And build a collage for topic "cats" with shape "t"
        Then I should see the collage for topic "cats" generated

Scenario: Building with Borders
		When I select the borders checkbox
        And build a collage for topic "cats" with shape "t"
        Then I should see the collage for topic "cats" generated

Scenario: Building with custom size
		When I set height to "300"
		When I set width to "400"
        And build a collage for topic "cats" with shape "t"
        Then I should see the collage for topic "cats" generated