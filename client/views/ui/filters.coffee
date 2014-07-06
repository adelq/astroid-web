Template.filters.events
  'click li': (e) ->
    e.preventDefault()
    Session.set('filter', e.target.text)

Template.filters.helpers
  'filter': -> Session.get('filter')