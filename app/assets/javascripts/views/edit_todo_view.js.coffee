Todos.EditTodoView = Ember.TextField.extend(
  classNames: ['edit']

  insertNewline: ->
    @get('controller').acceptChanges()
    return

  focusOut: ->
    @get('controller').acceptChanges()
    return

  didInsertElement: ->
    @$().focus()
    return
)