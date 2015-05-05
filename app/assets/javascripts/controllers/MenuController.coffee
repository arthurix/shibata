controllers = angular.module('controllers')
controllers.controller('MenuController', [ '$scope', '$http', '$timeout', '$window', 'flash'
  ($scope,$http,$timeout,$window,flash)->
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