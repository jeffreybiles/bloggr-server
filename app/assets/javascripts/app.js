//= require handlebars
//= require ember
//= require ember-data
//= require showdown
//= require moment
//= require_self
//= require bloggr_server

App = Ember.Application.create()

App.ApplicationAdapter = DS.RESTAdapter.extend({
  // host: 'http://localhost:3000',
  namespace: 'api/v1',
})


App.Post = DS.Model.extend({
  title: DS.attr(),
  videoUrl: DS.attr(),
  author: DS.attr(),
  date: DS.attr(),
  body: DS.attr(),

  deckedOutVideoUrl: function(){
    return this.get('videoUrl') + '?modestbranding=1&rel=0'
  }.property('videoUrl')
})

App.Router.map(function() {
  this.resource('about');
  this.resource('posts', function() {
    this.resource('post', { path: ':post_id' });
  });
});

App.PostsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('post');
  }
});

App.PostRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('post', params.post_id);
  }
});

App.PostController = Ember.ObjectController.extend({
  isEditing: false,

  edit: function() {
    this.set('isEditing', true);
  },

  doneEditing: function() {
    this.set('isEditing', false);
    this.get('model').save()
  }
});

var showdown = new Showdown.converter();

Ember.Handlebars.helper('format-markdown', function(input) {
  if(input){
    return new Handlebars.SafeString(showdown.makeHtml(input));
  }
});

Ember.Handlebars.helper('format-date', function(date) {
  if(date) {
    return moment(date).fromNow();
  }
});