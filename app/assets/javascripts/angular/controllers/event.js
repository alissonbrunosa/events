angular.module('events').controller('EventCtrl', ["$http", function($http){
  var self = this;

  self.page = 1;
  self.events = [];
  self.busy = false;
  self.upcoming = 0;
  self.recent = false;

  self.params = {};

  self.load = function(reset) {
    if (reset == true)
      self.events = [];
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
    self.load(true);
  }

  self.confirm = function(event_id) {
    self.details(event_id, 1).success(function(detail){
      var el = self.events.findBy("id", event_id);
      el.status = detail.status;
      el.confirm_count = detail.confirm_count;
      el.unconfirm_count = detail.unconfirm_count;
    }).error(function(error){
      alert(error.error);
    });
  };

  self.unconfirm = function(event_id) {
    self.details(event_id, 2).success(function(detail){
      var el = self.events.findBy("id", event_id);
      el.status = detail.status;
      el.confirm_count = detail.confirm_count;
      el.unconfirm_count = detail.unconfirm_count;
    }).error(function(error){
      alert(error.error);
    });
  };

  self.details = function(event_id, status) {
    return $http.post("/events/" + event_id + "/event_details.json", {status: status});
  };

}]);