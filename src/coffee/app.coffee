app = angular.module 'app', [
  'ngRoute',
  'ngSanitize',
  'controllers'
]

app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'partials/home.html',
      controller: 'homeCtrl'
    .when '/questions/:topics',
      templateUrl: 'partials/questions.html',
      controller: 'questionCtrl'
    .when '/resultat',
      templateUrl: 'partials/result.html',
      controller: 'resultCtrl'
    .when '/loser',
      templateUrl: 'partials/loser.html',
      controller: 'loserCtrl'
