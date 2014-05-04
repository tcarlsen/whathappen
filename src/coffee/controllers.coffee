controllers = angular.module 'controllers', []

controllers.controller 'homeCtrl', ($scope, $location) ->
  $scope.go = (path) ->
    $location.path(path)

controllers.controller 'questionCtrl', ($scope, $rootScope, $location, $http, $routeParams) ->
  $http.get('content.json').success (data) ->
    $rootScope.questions = data[$routeParams.topics]

  $scope.currentQuestion = 0

  $scope.next = (num) ->
    $rootScope.questions[$scope.currentQuestion].selected = num

    if $scope.currentQuestion isnt $scope.questions.length - 1
      $scope.currentQuestion++
    else
      $location.path('/resultat')

controllers.controller 'resultCtrl', ($scope, $rootScope, $location) ->
  i = 0
  $scope.correctAnswers = 0

  while i < $rootScope.questions.length
    $scope.correctAnswers++ if $rootScope.questions[i].selected is $rootScope.questions[i].correct
    i++

  setTimeout (->
    $(".scoreboard .chart").circliful()
    return
  ), 1

  $scope.done = ->
    $location.path('/')

  $scope.go = ->
    $location.path('/loser')

controllers.controller 'loserCtrl', ($scope, $location, $http) ->
  $scope.article = ''

  $scope.done = ->
    $location.path('/')

  $scope.open = (id) ->
    $http.jsonp('http://content.guardianapis.com/' + id + '?show-fields=body&api-key=mediahackdays2014&callback=JSON_CALLBACK').success (data) ->
      data = data.response.content

      $scope.article = data.fields.body

      $('.article').show()

  $scope.close = ->
    $('.article').hide()
