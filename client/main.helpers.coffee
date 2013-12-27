Handlebars.registerHelper 'formatDate', (date) ->
    moment(date).format('D MMM YYYY')
