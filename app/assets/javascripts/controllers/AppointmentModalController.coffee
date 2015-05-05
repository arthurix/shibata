controllers = angular.module('controllers')
controllers.controller("AppointmentModalController", [ '$scope', '$routeParams', '$location', 'flash', 'appointmentsFactory', '$modalInstance'
  ($scope,$routeParams,$location,flash,appointmentsFactory,$modalInstance)->

    $scope.dismiss = () ->
      $modalInstance.dismiss()

    $scope.save = ->
      onError = (_httpResponse)-> flash.error = "Something went wrong"
      if $scope.appointment.id
        $scope.appointment.$save(
          ( ()-> $modalInstance.close($scope.appointment) ),
          onError)
      else
        appointmentsFactory.create($scope.appointment,
          ( (newAppointment)-> 
              $location.path("/appointments")
              $modalInstance.close()
          ),
          onError)

    $scope.appointmentId = $routeParams.appointmentId #THIS MUST BE CHANGED FOR EDIT

    if $routeParams.appointmentId
      appointmentsFactory.get({appointmentId: $routeParams.appointmentId},
        ( (appointment)-> $scope.appointment = appointment ),
        ( (httpResponse)->
          $scope.appointment = null
          flash.error   = "Client not found"
        )
      )
    else
      $scope.appointment =
        visit_type: "Evaluation"
        duration: 0
        date: new Date()
        time: new Date()

])