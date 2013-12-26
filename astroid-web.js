Tasks = new Meteor.Collection("tasks");
Lists = new Meteor.Collection("lists");
Folders = new Meteor.Collection("folders");

if (Meteor.isClient) {
  Template.todos.tasks = function () {
    return Tasks.find();
  }

  Template.newTaskForm.events({
    'submit #new-task, click #addTaskButton': function(e) {
      e.preventDefault();
      var body = $('#new-task-text').val();
      $('#new-task-text').val("");
      var now = moment();
      var priority = 'low';
      var list = 'Home';
      Tasks.insert({
        body: body,
        date: now.format('D MMM YYYY'),
        dateDue: now,
        dateCreated: now,
        dateCompleted: false,
        modified: now,
        list: list,
        priority: priority,
        complete: false,
        repeating: false
      });
    }
  });
}

if (Meteor.isServer) {
  Meteor.startup(function () {
    // code to run on server at startup
  });
}
