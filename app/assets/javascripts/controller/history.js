
/*global angular, $ */

angular.module('controller').controller('history', ['$scope', '$q', '$http',
  function($scope, $q, $http){

    $scope.init = function () {
      $scope.games = getGames();
    };
    
    $scope.init();

    function getGames(){
      var xmlHttp = new XMLHttpRequest();
      xmlHttp.open("GET", "history_games.json", false);
      xmlHttp.send(null);
      var jsonObj = $.parseJSON(xmlHttp.responseText);
      return jsonObj;
    }
  }
]);
