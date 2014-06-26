UI.registerHelper 'formatDate', (date) ->
  moment(date).format('D MMM YYYY')

UI.registerHelper 'overDue', (date) ->
  moment(date).isBefore()
