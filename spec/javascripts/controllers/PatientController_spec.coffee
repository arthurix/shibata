describe "PatientController", ->
  scope        = null
  ctrl         = null
  routeParams  = null
  httpBackend  = null
  flash        = null
  patientId     = 1

  fakePatient =
    id: patientId
    name: "Raoni Boaventura"
    email: "raoni@gmail.com"
    sex: "Male"
    obs: "He's awesome"

  setupController =(patientExists=true)->
    inject(($location, $routeParams, $rootScope, $httpBackend, $controller, _flash_)->
      scope       = $rootScope.$new()
      location    = $location
      httpBackend = $httpBackend
      routeParams = $routeParams
      routeParams.patientId = patientId
      flash = _flash_

      request = new RegExp("\/patients/#{patientId}")
      results = if patientExists
        [200,fakePatient]
      else
        [404]

      httpBackend.expectGET(request).respond(results[0],results[1])

      ctrl = $controller('PatientController',
        $scope: scope)
    )

  beforeEach(module("shibata"))

  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()

  describe 'controller initialization', ->
  describe 'patient is found', ->
    beforeEach(setupController())
    it 'loads the given patient', ->
      httpBackend.flush()
      expect(scope.patient).toEqualData(fakePatient)
  describe 'patient is not found', ->
    beforeEach(setupController(false))
    it 'loads the given patient', ->
      httpBackend.flush()
      expect(scope.patient).toBe(null)
      expect(flash.error).toBe("Client not found")