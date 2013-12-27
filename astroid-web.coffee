Tasks = new Meteor.Collection("tasks")
Lists = new Meteor.Collection("lists")
Folders = new Meteor.Collection("folders")

if Meteor.isClient
  Template.todos.tasks = ->
    Tasks.find()

  Template.todos.events
    'click a.completeBox': (e) ->
      now = new Date()
      Tasks.update this._id,
        $set:
          completed: not @completed
          dateCompleted: now
          modified: now

  Template.newTaskForm.events
    'submit #new-task, click #addTaskButton': (e) ->
      e.preventDefault()
      body = $('#new-task-text').val()
      $('#new-task-text').val("")
      now = new Date()
      priority = 'low'
      list = 'Home'
      Tasks.insert
        body: body
        dateDue: now
        dateCreated: now
        dateCompleted: false
        modified: now
        list: list
        priority: priority
        completed: false
        repeating: false

  Handlebars.registerHelper 'formatDate', (date) ->
      moment(date).format('D MMM YYYY')
