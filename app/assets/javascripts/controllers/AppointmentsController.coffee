controllers = angular.module('controllers')
controllers.controller("AppointmentsController", ['$filter','$scope', '$routeParams', '$location', '$modal', 'appointmentsFactory'
  ($filter,$scope,$routeParams,$location,$modal,appointmentsFactory)->

    appointmentsFactory.query((results)-> $scope.appointments = results)

    $scope.searchTerm = ""
    
    $scope.openNew = (size) ->
      modalInstance = $modal.open(
        templateUrl: 'appointment_form.html'
        controller: 'AppointmentModalController'
        size: size
        resolve:
          appointmentId: ->
            return null
          patientId: ->
            return null
      )
      modalInstance.result.then ((updatedPatient) ->
        appointmentsFactory.query((results)-> $scope.appointments = results)
        return
      ), ->
        console.log 'Modal dismissed at: ' + new Date
        return
      return

    orderBy = $filter('orderBy');
    $scope.order = (predicate, reverse) ->
      $scope.appointments = orderBy($scope.appointments, predicate, reverse)
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
          patientId: ->
            return null
      )
      modalInstance.result.then ((updatedPatient) ->
        appointmentsFactory.query((results)-> $scope.appointments = results)
        return
      ), ->
        console.log 'Modal dismissed at: ' + new Date
        return
      return

])