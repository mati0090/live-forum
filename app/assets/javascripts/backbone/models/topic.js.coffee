class LiveForum.Models.Topic extends Backbone.RelationalModel
  relations:
    [
      {
        type: Backbone.HasMany,
        key: 'posts',
        relatedModel: 'LiveForum.Models.Post',
        collectionType: 'LiveForum.Collections.PostsCollection',
        includeInJSON: 'id'
        reverseRelation: {key: 'post', includeInJSON: 'id'}
      }
    ]
  paramRoot: 'topic'

  idAttribute: 'id'

  toJSON: ->
    {
      id:         @get('id')
      title:      @get('title')
      body:       @get('body')
      created_at: @get('created_at')
    }

  defaults:
    title: null
    body: null

class LiveForum.Collections.TopicsCollection extends Backbone.Collection
  model: LiveForum.Models.Topic
  url: '/topics'
