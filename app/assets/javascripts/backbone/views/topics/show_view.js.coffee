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
    'click button[id=new_post_submit]': 'on_new_post_submit'
  }

  on_new_post_submit: (e) ->
    e.preventDefault()
    new_post = new LiveForum.Models.Post({body: this.$("#new_post_body").val(), topic: this.model})

    that = @
    new_post.save {}
      success: ->
        that.model.get('posts').add new_post

  renderPost: (post) ->
    post_view = new LiveForum.Views.Posts.PostView({model: post})
    @$("#posts").append($(post_view.render().el))

  renderPosts: (posts) ->
    that = @
    posts.each(@renderPost)



