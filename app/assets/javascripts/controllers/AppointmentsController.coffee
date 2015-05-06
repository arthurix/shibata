controllers = angular.module('controllers')
controllers.controller("AppointmentsController", ['$scope', '$routeParams', '$location', '$modal', 'appointmentsFactory'
  ($scope,$routeParams,$location,$modal,appointmentsFactory)->

    appointmentsFactory.query((results)-> $scope.appointments = results)

    $scope.openNew = (size) ->
      modalInstance = $modal.open(
        templateUrl: 'appointment_form.html'
        controller: 'AppointmentModalController'
        size: size
        resolve:
          appointmentId: ->
            return null
      )
      modalInstance.result.then ((updatedPatient) ->
        appointmentsFactory.query((results)-> $scope.appointments = results)
        return
      ), ->
        console.log 'Modal dismissed at: ' + new Date
        return
      return

    $scope.openEdit = (size, appointmentId) ->
      modalInstance = $modal.open(
        animation: $scope.animationsEnabled
        templateUrl: 'appointment_form.html'
        controller: 'AppointmentModalController'
        size: size
        resolve:
          appointmentId: ->
            return appointmentId
      )
      modalInstance.result.then ((updatedPatient) ->
        appointmentsFactory.query((results)-> $scope.appointments = results)
        return
      ), ->
        console.log 'Modal dismissed at: ' + new Date
        return
      return

])