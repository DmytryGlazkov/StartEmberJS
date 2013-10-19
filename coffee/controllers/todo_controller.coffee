Todos.TodoController = Ember.ObjectController.extend
  actions:
    deleteTodo: ->
      todo = @get 'model'
      todo.deleteRecord()
      todo.save()