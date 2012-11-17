LiveForum.Views.Topics ||= {}

class LiveForum.Views.Topics.IndexView extends Backbone.View
  template: JST["backbone/templates/topics/index"]

  initialize: () ->
    @options.topics.bind('reset', @addAll)

  addAll: () =>
    @options.topics.each(@addOne)

  addOne: (topic) =>
    view = new LiveForum.Views.Topics.TopicView({model : topic})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(topics: @options.topics.toJSON() ))
    @addAll()

    return this
