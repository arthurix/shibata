controllers = angular.module('controllers')
controllers.controller("AppointmentsController", ['$scope', '$routeParams', '$location', '$modal', 'appointmentsFactory'
  ($scope,$routeParams,$location,$modal,appointmentsFactory)->

    appointmentsFactory.query((results)-> $scope.appointments = results)

    $scope.openNew = (size) ->
      modalInstance = $modal.open(
        templateUrl: 'appointment_form.html'
        controller: 'AppointmentModalController'
        size: size
      )
      modalInstance.result.then ((updatedPatient) ->
        return
      ), ->
        console.log 'Modal dismissed at: ' + new Date
        return
      return

])