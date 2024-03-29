class LiveForum.Routers.TopicsRouter extends Backbone.Router
  initialize: (options) ->
    @topics = new LiveForum.Collections.TopicsCollection()
    @topics.reset options.topics

  routes:
    "topics/new"      : "newTopic"
    "topics/index"    : "index"
    "topics/:id"      : "show"
    ".*"              : "index"

  index: ->
    @view = new LiveForum.Views.Topics.IndexView(topics: @topics)
    $("#topics").html(@view.render().el)

  show: (id) ->
    topic = @topics.get(id)

    @view = new LiveForum.Views.Topics.ShowView(model: topic)
    $("#topics").html(@view.render().el)

