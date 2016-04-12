# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ($) ->
  problemId = $('.solution').data('problem-id')
  solutionId = $('.solution').data('solution-id')

  changeSolution = (data) ->
    if data.test_status is 0
      $('.problem-unsolved').attr('class', 'problem-solved')
      console.log("Dont mind me just changing stuff")
    else
      console.log("Changed to unsolved")
      $('.problem-solved').attr('class', 'problem-unsolved')

  getSolution = (callback) ->
    $.get "/problems/#{problemId}/solutions/#{solutionId}.json", (data) ->
      if data?.checked_at
        $('.solution .test_output').html(data?.test_output)
        changeSolution(data)
      else
        callback()

  pollSolution = (firstTime = true) ->
    unless pollSolution.tries++ > pollSolution.maxTries
      setTimeout ->
        getSolution -> pollSolution(false)
      , firstTime ? 0 : 200

  pollSolution.tries = 0
  pollSolution.maxTries = 100

  pollSolution() if solutionId
