controllers = angular.module('controllers')
controllers.controller('MenuController', [ '$scope', '$location', '$timeout', '$window', 'flash'
  ($scope,$location,$timeout,$window,flash)->

    $scope.getPage = (path) ->
      if $location.path().substr(0, path.length) == path
        'active'
      else
        ''

    $scope.toSchedule = () ->
      $location.path("/appointments")

    $scope.toClients = () ->
      $location.path("/patients")

    $scope.alertShow = true
    $scope.logout = ->
      $http(
        method: 'DELETE'
        url: '/users/sign_out.json'
        data: {}).success(->
        $window.location.reload();
        return
      ).error ->
        flash.error   = "Problem on logout."
        return

    hideAlert = () ->
      $scope.alertShow = false

    $timeout(hideAlert, 2000)
])