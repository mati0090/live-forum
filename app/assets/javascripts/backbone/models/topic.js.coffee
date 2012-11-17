class LiveForum.Models.Topic extends Backbone.Model
  paramRoot: 'topic'

  defaults:
    title: null
    body: null

class LiveForum.Collections.TopicsCollection extends Backbone.Collection
  model: LiveForum.Models.Topic
  url: '/topics'
