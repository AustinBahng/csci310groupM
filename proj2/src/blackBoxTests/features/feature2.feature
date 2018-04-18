Feature: When a collage is displayed there should be an export button that allows for download of the collage 
 
Background:
        Given that I am on the Main web page
        And that a collage for topic "cats" and shape "t" has been generated
  
Scenario: Check export button exists
        Then there there is an export button

Scenario: Check export with PNG
        When I select png as the option
        When I press the export collage button
        Then the downloaded image should be a png

Scenario: Check export with PDF
        When I select pdf as the option
        When I press the export collage button
        Then the downloaded image should be a pdf