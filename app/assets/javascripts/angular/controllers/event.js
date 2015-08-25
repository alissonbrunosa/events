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

  self.presence = function(event_id) {
    var event = self.events.findBy("id", event_id)
    if(event.confirmed)
      self.delete_presence(event_id);
    else
      self.create_presence(event_id);
  };

  self.create_presence = function(event_id){
    $http.post(event_id + '/presences',{}).success(function(data){
      var event = self.events.findBy("id", event_id)
      event.presences_count = data.presences_count;
      event.confirmed = true;
    }).error(function(fail){
      alert(fail.error);
    });
  };

  self.delete_presence = function(event_id){
    $http.delete(event_id + '/presences',{}).success(function(data){
      var event = self.events.findBy("id", event_id)
      event.presences_count = data.presences_count;
      event.confirmed = false;
    }).error(function(fail){
      alert(fail.error);
    });
  };

}]);