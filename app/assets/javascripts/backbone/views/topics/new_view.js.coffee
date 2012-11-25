LiveForum.Views.Topics ||= {}

class LiveForum.Views.Topics.NewView extends Backbone.View
  template: JST["backbone/templates/topics/new"]

  events:
    "click #save-topic-button": "save"
    "click .close-modal"      : "closeModal"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (topic) =>
        @model = topic
        @closeModal()
        window.location.hash = "/topics/#{@model.id}"

      error: (topic, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  closeModal: (e) ->
    e.preventDefault() if e
    @$(".modal").modal('hide')

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @$(".modal").modal()

    @$("form").backboneLink(@model)

    return this
