Session.setDefault("filter", "everything")
Session.setDefault("sort", "auto")

Template.todos.tasks = ->
  Tasks.find()

Template.lists.list = ->
  Lists.find()

Template.todos.events
  'click a.completeBox': (e) ->
    e.preventDefault()
    now = new Date()
    list = Lists.findOne
      name: @list

    if @completed
      Tasks.update this._id,
        $set:
          completed: not @completed
          dateCompleted: false
          modified: now
      Lists.update list._id,
        $inc:
          numTodos: 1
    else
      Tasks.update this._id,
        $set:
          completed: not @completed
          dateCompleted: now
          modified: now
      Lists.update list._id,
        $inc:
          numTodos: -1