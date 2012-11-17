class LiveForum.Routers.TopicsRouter extends Backbone.Router
  initialize: (options) ->
    @topics = new LiveForum.Collections.TopicsCollection()
    @topics.reset options.topics

  routes:
    "new"      : "newTopic"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newTopic: ->
    @view = new LiveForum.Views.Topics.NewView(collection: @topics)
    $("#topics").html(@view.render().el)

  index: ->
    @view = new LiveForum.Views.Topics.IndexView(topics: @topics)
    $("#topics").html(@view.render().el)

  show: (id) ->
    topic = @topics.get(id)

    @view = new LiveForum.Views.Topics.ShowView(model: topic)
    $("#topics").html(@view.render().el)

  edit: (id) ->
    topic = @topics.get(id)

    @view = new LiveForum.Views.Topics.EditView(model: topic)
    $("#topics").html(@view.render().el)
