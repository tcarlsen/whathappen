controllers = angular.module 'controllers', []

controllers.controller 'homeCtrl', ($scope, $location) ->
  $scope.go = (path) ->
    $location.path(path)

controllers.controller 'questionCtrl', ($scope, $location) ->
  $scope.answer = (num) ->
    $location.path('/resultat')
