Feature: API status
	As an API consumer
	I want to be informed when I request status
	So I can learn the API availability

	Scenario: I should get a negative response when I request /calendar-type
		When I request an existing API resource /calendar-type
		Then response code should be 200

