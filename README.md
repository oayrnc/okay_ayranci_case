# Insider QA Automation Project

Hi ,this project covers UI automation for the Insider website and API testing for the Petstore.


# Getting started
pip install robotframework robotframework-seleniumlibrary robotframework-requests


# UI Tests
To run all UI tests on Chrome (default):
robot -d results tests/ui/
You can easily switch browsers from the command line like this:
robot -v browser:firefox -d results tests/ui/

# API Tests
To run the API CRUD tests:
robot -d results tests/api/

# Project structure (POM)
- resources/base/: Core stuff like config, master resource, and common keywords.
- resources/pages/: Page Object Model files. Each page has its own locators and keywords.
- resources/utils/: My custom Python library for things like highlighting elements and JS clicks.
- tests/: All the UI and API test cases are here.
- performance_test/: JMeter load test scenarios and results for n11.com.
