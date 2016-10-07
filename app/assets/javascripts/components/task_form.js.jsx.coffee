@TaskForm = React.createClass
  # taskInput = ''
  getInitialState: ->
    {
      name: ''
      memo: ''
    }

  defaultState:
    name: ''

  taskSubmit: (e) ->
    e.preventDefault()
    form = @
    $.ajax
      method: 'POST'
      url: '/api/v1/tasks.json'
      data: {task: @state}
      success: (response) ->
        form.props.afterCreate(response.data)
        form.setState(form.getInitialState())
        # form.refs.taskForm.getDOMNode().reset();

  handleChange: ->
    @setState(
      name: @refs.name.value
      memo: @refs.memo.value
    )

  render: ->
    form = @
    `<form className="TaskForm" onSubmit={form.taskSubmit} ref="taskForm">
      <div>
        <input type="text" placeholder="Name" ref="name" value={form.state.name} onChange={form.handleChange}/>
      </div>
      <div>
        <textarea placeholder="Memo" ref="memo" value={form.state.memo} onChange={form.handleChange}></textarea>
      </div>
      <input type="submit" value="submit"/>
     </form>`
