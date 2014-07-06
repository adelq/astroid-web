Template.sortBy.events
  'click li': (e) ->
    e.preventDefault()
    Session.set('sortby', e.target.text)

Template.sortBy.helpers
  'sortby': -> Session.get('sortby')