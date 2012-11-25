LiveForum.Views.Topics ||= {}

class LiveForum.Views.Topics.IndexView extends Backbone.View
  template: JST["backbone/templates/topics/index"]

  initialize: () ->
    @options.topics.bind('reset', @addAll)

  events:
    "click #new-topic-button" : "newTopic"

  addAll: () =>
    @options.topics.each(@addOne)

  addOne: (topic) =>
    view = new LiveForum.Views.Topics.TopicView({model : topic})
    @$("#topics-index-table").append(view.render().el)

  render: =>
    $(@el).html(@template(topics: @options.topics.toJSON() ))
    @addAll()
    return this

  newTopic: (e) ->
    e.preventDefault()
    @view = new LiveForum.Views.Topics.NewView(collection: @options.topics)
    $("#topics").append(@view.render().el)

