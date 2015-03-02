# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# use mustache template
# wire up remove button
# setup edit

$ ->
  tasks = $('.tasks');
  name = $('.name');
  project = $('.project')

  taskTemplate = "<li class='list-group-item'> {{name}} - {{project}} </li>"

  addTask = (task) ->
    tasks.append(Mustache.render(taskTemplate, task))

  $.ajax
    type: 'GET'
    url: '/tasks.json'
    success: (tasks) ->
      $.each tasks, (i, task) ->
        addTask(task)

  $('.js-add-task').on 'click', ->

    task_data =
      name: name.val()
      project: project.val()

    $.ajax
      type: 'POST'
      url: '/tasks.json'
      data: { task: task_data }
      success: (newTask)->
        addTask(newTask)

