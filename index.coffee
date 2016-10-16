command: "cat ~/todo.txt"
refreshFrequency: 10000 # ms

style: """
  // Position the widget on your screen
  top 10px
  left 40%

  // Change the style of the widget
  color #fff
  font-family Helvetica Neue
  background rgba(#000, .35)
  padding 10px 10px 5px
  border-radius 5px

  .container
    position: relative
    clear: both

  .list
    padding-top: 3px
    width=100%

  .list-item
    font-size: 14px
    font-weight: 300
    color: rgba(#fff, .8)

  .widget-title
    font-size 12px
    font-weight bold
    color: rgba(#fff, .9)
"""

render: -> """
  <div class="container">
    <div class="widget-title">todo list
      <button>edit</button>
    </div>
    <div id="todos" class="list"></div>
  </div>
"""

afterRender: (domEl) ->
  $(domEl).find('button').on 'click', => @run("open ~/todo.txt")

update: (output, domElement) ->
  todos = output.split('\n')
  list = $(domElement).find('#todos').empty()

  addTodo = (todo) ->
    item = "<div class=\"list-item\">#{todo}</div>"
    list.append item

  if todos.length == 1
    addTodo "empty!"
  else
    for todo, i in todos
      addTodo todo
