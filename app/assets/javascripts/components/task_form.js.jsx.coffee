@TaskForm = React.createClass
  # taskInput = ''
  # getInitialState: ->
  taskSubmit: (e) ->
    e.preventDefault()
    params= {
      name: @refs.taskInput.value
    }
    @createTask(params)

  createTask: (params) ->
    $.ajax
      method: 'POST'
      url: '/api/v1/tasks.json'
      data: {task: params}
      success: (response) ->
        console.log response

  render: ->
    form = @
    `<form className="TaskForm" onSubmit={form.taskSubmit} >
      <input type="text" placeholder="Input Task" ref="taskInput"/>
     </form>`
