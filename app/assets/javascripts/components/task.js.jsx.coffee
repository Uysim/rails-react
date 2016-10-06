@Task = React.createClass
  getInitialState: ->
    {
      name: @props.name
    }

  render: ->
    state = @state
    `<h1>{state.name}</h1>`