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

Template.newTaskForm.events
  'submit #new-task, click #addTaskButton': (e) ->
    e.preventDefault()
    body = $('#new-task-text').val()
    $('#new-task-text').val("")
    now = new Date()
    priority = 'low'
    list = 'Adel'
    Tasks.insert
      body: body
      dateDue: moment(now).add('w', 1).toDate()
      dateCreated: now
      dateCompleted: false
      modified: now
      list: list
      priority: priority
      completed: false
      repeating: false
    list = Lists.findOne
      name: list
    Lists.update list._id,
      $inc:
        numTodos: 1

Template.addList.events
  'click #addListButton': (e) ->
    e.preventDefault()
    listName = $('#listName').val()
    $('#listName').val("")
    listDescription = $('#listDescription').val()
    $('#listDescription').val("")
    Lists.insert
      name: listName
      description: listDescription
      numTodos: 0
