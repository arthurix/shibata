describe "PatientsController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  resource     = null

  setupController =(keywords)->
    inject(($location, $routeParams, $rootScope, $resource, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      routeParams.keywords = keywords

      ctrl        = $controller('PatientsController',
                                $scope: scope
                                $location: location)
    )

  beforeEach(module("shibata"))
  beforeEach(setupController())

  it 'defaults to no patients', ->
    expect(scope.patients).toEqualData([])