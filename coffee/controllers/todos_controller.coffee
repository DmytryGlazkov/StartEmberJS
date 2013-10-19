Todos.TodosController = Ember.ArrayController.extend
  actions:
    createTodo: ->
      title = undefined
      todo = undefined
      _title = @get('newTitle')
      return null unless _title? or _title is ""
      todo = @store.createRecord('todo',
        title: _title
        isCompleted: false
      )
      todo.save
      @set 'newTitle', ''

    someAction: ->
      null

    clearCompleted: ->
      completed = @filterBy('isCompleted', true)
      completed.invoke 'deleteRecord'
      completed.invoke 'save'

  remaining: (->
    @filterBy('isCompleted', false).get 'length'
  ).property '@each.isCompleted'

  completed: (->
    @filterBy('isCompleted', true).get 'length'
  ).property '@each.isCompleted'

  hasCompleted: ( ->
    @get('completed') > 0
  ).property '@each.isCompleted'

  allAreDone: ((key, value) ->
    return @everyBy('isCompleted', true) && @get 'length' if value ==undefined
    @setEach('isCompleted', value)
    @invoke 'save'
  ).property('@each.isCompleted')