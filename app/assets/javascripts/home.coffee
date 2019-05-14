# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
notificationsClick = 0
document.addEventListener 'DOMContentLoaded', ->
  M.AutoInit()
  elem = document.querySelector('.dropdown-trigger')
  instance = M.Dropdown.init(elem, {
    closeOnClick: false,
    coverTrigger: false,
    constrainWidth: false,
    alignment: 'right',
    onOpenEnd: ->
      if notificationsClick == 0
        $.ajax(url: '/notifications').done ->
          elem = document.querySelector('.dropdown-trigger')
          instance = M.Dropdown.getInstance(elem)
          instance.recalculateDimensions()
          notificationsClick = 1
          return
    ,
  })
  return
  