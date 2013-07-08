# For more information see: http://emberjs.com/guides/routing/

Todos.Router.map ->
  @resource "todos",
    path: "/"
  , ->
    # additional child routes
    @route "active"
    @route "completed"


Todos.TodosRoute = Ember.Route.extend(
  model: ->
    Todos.Todo.find()
)

Todos.TodosIndexRoute = Ember.Route.extend(
  model: ->
    Todos.Todo.find()
)

Todos.TodosActiveRoute = Ember.Route.extend(
  model: ->
    Todos.Todo.filter (todo) ->
      true unless todo.get('isCompleted')
  renderTemplate: (controller) ->
    @render "todos/index",
      controller: controller
)

Todos.TodosCompletedRoute = Ember.Route.extend(
  model: ->
    Todos.Todo.filter (todo) ->
      true if todo.get('isCompleted')
  renderTemplate: (controller) ->
    @render "todos/index",
      controller: controller
)