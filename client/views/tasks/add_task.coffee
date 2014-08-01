Template.newTaskForm.events
  'submit #new-task, click #addTaskButton': (e) ->
    e.preventDefault()
    body = $('#new-task-text').val()
    $('#new-task-text').val("")

    if body
      addEvent body
      $('#addTaskInput').removeClass('has-warning')
    else
      $('#addTaskInput').addClass('has-warning')
      $('#new-task-text').focus()

addEvent = (taskTitle) ->
  now = new Date()
  priority = 'low'
  list = 'Home'
  Tasks.insert
    body: taskTitle
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
