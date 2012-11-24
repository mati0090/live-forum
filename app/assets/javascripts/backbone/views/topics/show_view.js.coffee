LiveForum.Views.Topics ||= {}

class LiveForum.Views.Topics.ShowView extends Backbone.View
  template: JST["backbone/templates/topics/show"]

  initialize: ->
    _.bindAll(this, 'renderPost', 'on_new_post_submit');
    this.model.bind('add:posts', this.renderPost)

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @renderPosts(@model.get('posts'))
    return this

  events: {
    'click input[type=submit]': 'on_new_post_submit'
  }

  renderPost: (post) ->
    post_view = new LiveForum.Views.Posts.PostView({model: post})
    @$("tbody").append($(post_view.render().el))

  on_new_post_submit: (e) ->
    new_post = new LiveForum.Models.Post({body: this.$("#new_post_body").val(), topic: this.model})

    that = @
    new_post.save {}
      success: ->
        that.model.get('posts').add new_post

  renderPosts: (posts) ->
    @view = new LiveForum.Views.Posts.IndexView({posts: posts, el: @$("#posts")})
    @view.render()



