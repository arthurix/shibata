controllers = angular.module('controllers')
controllers.controller("AppointmentsController", ['$scope', '$routeParams', '$location', '$modal', 'appointmentsFactory'
  ($scope,$routeParams,$location,$modal,appointmentsFactory)->

    $scope.keywords = $routeParams.keywords ? ""

    if $routeParams.keywords
      #gonna do something
    else
      appointmentsFactory.query((results)-> $scope.appointments = results)
])