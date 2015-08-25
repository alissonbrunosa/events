angular.module('events').controller('EventCtrl', ["$http", function($http){
  var self = this;

  self.page = 1;
  self.events = [];
  self.busy = false;
  self.upcoming = 0;
  self.recent = false;

  self.params = {};

  self.load = function() {
    self.busy = true;
    $http({
      method: 'GET',
      url: '/events.json',
      params: {
        page: self.page,
        upcoming: self.upcoming,
        recents: self.recent
      }
    }).success(function(events) {
      angular.forEach(events, function(event) {
        self.events.push(event);
      });
      self.busy = false;
    });
  };


  self.scroll = function() {
    self.params.page +1;
  };

  self.recents = function() {
    self.recent = true;
    self.load();
  }

}]);