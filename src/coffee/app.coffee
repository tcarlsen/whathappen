app = angular.module 'app', [
  'ngRoute',
  'controllers'
]

app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'partials/home.html',
      controller: 'homeCtrl'
    .when '/questions/:topics/:num',
      templateUrl: 'partials/questions.html',
      controller: 'questionCtrl'
    .when '/resultat',
      templateUrl: 'partials/result.html',
      controller: 'resultCtrl'
