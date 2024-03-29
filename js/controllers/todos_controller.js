// Generated by CoffeeScript 1.6.3
(function() {
  Todos.TodosController = Ember.ArrayController.extend({
    actions: {
      createTodo: function() {
        var title, todo, _title;
        title = void 0;
        todo = void 0;
        _title = this.get('newTitle');
        if (!((_title != null) || _title === "")) {
          return null;
        }
        todo = this.store.createRecord('todo', {
          title: _title,
          isCompleted: false
        });
        todo.save;
        return this.set('newTitle', '');
      },
      someAction: function() {
        return null;
      },
      clearCompleted: function() {
        var completed;
        completed = this.filterBy('isCompleted', true);
        completed.invoke('deleteRecord');
        return completed.invoke('save');
      }
    },
    remaining: (function() {
      return this.filterBy('isCompleted', false).get('length');
    }).property('@each.isCompleted'),
    completed: (function() {
      return this.filterBy('isCompleted', true).get('length');
    }).property('@each.isCompleted'),
    hasCompleted: (function() {
      return this.get('completed') > 0;
    }).property('@each.isCompleted'),
    allAreDone: (function(key, value) {
      if (value === void 0) {
        return this.everyBy('isCompleted', true) && this.get('length');
      }
      this.setEach('isCompleted', value);
      return this.invoke('save');
    }).property('@each.isCompleted')
  });

}).call(this);
