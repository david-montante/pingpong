
/*global angular, $ */

angular.module('controller').controller('log', ['$scope', '$q', '$http',
  function($scope, $q, $http){

    $scope.init = function () {
      $scope.users = getUsers();
      $scope.date_played = new Date();
      $scope.error = false;
    };
    
    $scope.logGame = function(){
      $scope.error = $scope.date_played == null || $scope.selected_user == undefined ||
                     $scope.your_score == undefined || $scope.your_score == "" ||
                     $scope.their_score == undefined || $scope.their_score == "";
      if(!$scope.error) setGame();
    };
    
    $scope.clean = function(){
      $scope.date_played = new Date();
      $scope.selected_user = undefined;
      $scope.your_score = $scope.their_score = "";
    };
    
    $scope.init();

    function getUsers(){
      var xmlHttp = new XMLHttpRequest();
      xmlHttp.open("GET", "users.json", false);
      xmlHttp.send(null);
      var jsonObj = $.parseJSON(xmlHttp.responseText);
      return jsonObj;
    }
    
    function setGame(){
      $http({
        url: "/setGame",
        method: "GET",
        params: {
          date_played: $scope.date_played,
          opponent: $scope.selected_user.email,
          score: $scope.your_score,
          opponent_score: $scope.their_score
        },
      });
      $scope.date_played = new Date();
      $scope.selected_user = undefined;
      $scope.your_score = $scope.their_score = "";
    }
    
  }
]);
