Feature: authentication smoke

  Scenario: Generating Token with a vaild user and pass
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    And path '/api/token'
    And request
      """
      {
        "username": "supervisor",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then status 200
    * def generatedToken = response.token
    And print generatedToken

  Scenario: Genearte Token with invalid user and valid pass
    Given url 'https://tek-insurance-api.azurewebsites.net/'
    And path '/api/token'
    And request
      """
      {
        "username": "supervisorWrong",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then status 404
    And print response
