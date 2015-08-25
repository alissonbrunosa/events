String.prototype.trunc = function(n){
  return this.substr(0,n-1)+(this.length>n?' ...':'');
};

Array.prototype.first = function() {
	return this[0];
};

Array.prototype.last = function() {
  return this[this.length - 1];
};

Array.prototype.findBy = function(property, value) {
	return this.filter(function(element) {return element[property] == value}).first();
};
