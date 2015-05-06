controllers = angular.module('controllers')
controllers.controller("AppointmentModalController", [ '$scope', '$routeParams', '$location', 'flash', 'appointmentsFactory', 'patientsFactory', '$modalInstance', 'appointmentId', 'patientId'
  ($scope,$routeParams,$location,flash,appointmentsFactory,patientsFactory,$modalInstance,appointmentId,patientId)->

    $scope.today = new Date()

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

    $scope.appointmentId = appointmentId

    if appointmentId
      appointmentsFactory.get({appointmentId: $scope.appointmentId},
        ( (appointment)-> $scope.appointment = appointment ),
        ( (httpResponse)->
          $scope.appointment = null
          flash.error   = "Appointment not found"
        )
      )
    else
      $scope.appointment =
        visit_type: "Evaluation"
        duration: 0
        date: new Date()
        time: "2000-01-01T12:00:00.000Z"
      if patientId
        $scope.appointment.patient_id = patientId

    patientsFactory.query((results)-> $scope.patients = results)
])