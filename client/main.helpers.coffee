Handlebars.registerHelper 'formatDate', (date) ->
  moment(date).format('D MMM YYYY')

Handlebars.registerHelper 'overDue', (date, options) ->
  if moment(date).isBefore()
    options.fn this
  else
    options.inverse this
