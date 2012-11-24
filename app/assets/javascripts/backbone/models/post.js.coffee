class LiveForum.Models.Post extends Backbone.RelationalModel
  url: ->
    '/topics/' + this.get('topic').id + '/posts'

  paramRoot: 'post'
  idAttribute: 'id'

  toJSON: ->
    {
      body: @get('body')
      topic_id: @get('topic_id')
    }

  defaults:
    body: null

class LiveForum.Collections.PostsCollection extends Backbone.Collection
  model: LiveForum.Models.Post
  url: -> '/posts'
