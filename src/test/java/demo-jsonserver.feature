 Feature: Crear, editar y actualizar reservación

  Scenario:

  Crear una nueva reserva

    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Accept = 'application/json'
    And request {firstname:'HENRY',lastname:'HHH',totalprice:777,depositpaid:true,bookingdates:{checkin:'2018-01-01',checkout:'2019-01-01'},additionalneeds:'Breakfast'}
    When method post
    Then status 200


  Scenario:

  Consultar una reservación

    Given url 'https://restful-booker.herokuapp.com/booking/1'
    And header Accept = 'application/json'
    When method get
    Then status 200


  Scenario: Editar una reservación

    Given url 'https://restful-booker.herokuapp.com/auth'
    And request {username:"admin",password:"password123"}
    When method post
    Then status 200
    And def authResponse = response.token


    Given url 'https://restful-booker.herokuapp.com/booking/1'
    And header Accept = 'application/json'
    And header Cookie = 'token=(#authResponse)'
    And request {firstname:'Henry',lastname:'HHH',totalprice:777,depositpaid:true,bookingdates:{checkin:'2018-01-01',checkout:'2019-01-01'},additionalneeds:'Breakfast'}
    When method put
    Then status 200
    And print response


