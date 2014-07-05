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
    $('#addListModal').modal('toggle')
