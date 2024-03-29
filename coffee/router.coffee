Todos.Router.map ->
  @resource('todos', { path: '/' }, ->
    @route('active')
    @route('completed')
  )

Todos.TodosRoute = Ember.Route.extend
  model: ->
    @store.find('todo');

Todos.TodosIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('todos')

Todos.TodosActiveRoute = Ember.Route.extend
  model: ->
    @store.filter('todo', (todo) ->
      !todo.get('isCompleted')
    )
  renderTemplate: (controller) ->
    @render 'todos/index', controller: controller

Todos.TodosCompletedRoute = Ember.Route.extend
  model: ->
    @store.filter('todo', (todo) ->
      todo.get('isCompleted'))
  renderTemplate: (controller) ->
    @render('todos/index', controller:controller)