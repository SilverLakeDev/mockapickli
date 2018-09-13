# Apickli using an eval Apigee account and calling a API mock proxy

# How do I set it up on a Mac?

$mkdir calendar

$sudo git clone https://github.com/jachansen1978/mockapickli.git

$cd mockapickli

$sudo npm install

$./node_modules/.bin/cucumber-js test/integration/features/status.feature

The above command is using cucumber to start a test in test/integration/features/status.feature.
status.feature contains a test that uses BDD format to write a test. 

# What should I see when the test runs?

demo api: [jacobhansen-eval-test.apigee.net, /calendar-types]
Feature: API status

  As an API consumer
  I want to be informed when I request status
  So I can learn the API availability

  Scenario: I should get a negative response when I request /calendar-type
    When I request an existing API resource /calendar-type
    Then response code should be 200

1 scenario (1 passed)
2 steps (2 passed)
0m03.611s


# How does it work?

- status.feature is a test file. A per proxy test file with complete coverage is typical.

- apickli-gherkin.js is where it translates from the status.feature file given, when, then to javascript functions. For each statement in status.feature you will need the javascript function in apickli-gherkin.js. If it's missing the statement in status.feature will not work correctly, syntax has to match exactly.

- init.js is where it builds the call to test the proxy, it's building the URL based on the test-config.json

- test-config.json is just like it sounds a config file that could be built out to support multiple environments and base paths. It uses org-environment.apigee.net example: jacobhansen-eval-test.apigee.net. The basepath is the same in Apigee, in my case /calendar-types. The call we're trying to make is https://jacobhansen-eval-test.apigee.net/calendar-types

- base.js It's not critical, just some sample code. It's some duplicate code from init.js and a sample assertion that's commented out. By assertion it can confirm a response is correct.

- notfound.js It's not a critical component, more like sample code. If you call a resource that doesn't exist and it times out

- package.json If you aren't familiar with node it basically sets the dependencies and typically sits at the root of the directory. A dependency can set a version of the file, which is safer. Or it can use the latest, which could randomly break something later unexpected if your project isn't maintained.

- package-lock.json This file has the .tgz files for the dependencies sha integrity checks. It's pretty self evident. You may need to adjust it as the versions of the dependencies change.

- node_modules this is where it stores the dependencies that are downloaded. There is a hidden folder you should be aware of the .bin folder. I use it above to call cucumber. See in the "How do I set it up on a Mac" section ./node_modules/.bin/cucumber-js there is a global way of calling cucumber.js but it may not line up with this particular project, so I just run it from the .bin folder. This method should always work with the project.

tip: if you want to list hidden folders from the command line ls -al


