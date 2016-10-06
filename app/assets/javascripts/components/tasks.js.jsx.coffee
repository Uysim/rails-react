@Tasks = React.createClass
  getInitialState: ->
    {
      tasks: []
    }

  componentDidMount: ->
    component = @
    url = '/api/v1/tasks.json'    
    fetch(url).then((response) -> 
      response.json()
    ).then((json) -> 
      component.setState(
        tasks: json.data
      )
    )

  _tasks: ->
    @state.tasks.map((task, index)->
      `<Task name={task.name} key={index}/>`
    )
  
  render: ->
    component = @
    `<div>{component._tasks()}</div>`
    

    