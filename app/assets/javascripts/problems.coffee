# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ($) ->
  problemId = $('.solution').data('problem-id')
  solutionId = $('.solution').data('solution-id')

  getSolution = (callback) ->
    $.get "/problems/#{problemId}/solutions/#{solutionId}.json", (data) ->
      if data?.checked_at
        $('.solution .test_output').html(data?.test_output)
      else
        callback()

  pollSolution = (firstTime = true) ->
    setTimeout ->
      getSolution -> pollSolution(false)
    , firstTime ? 0 : 200

  pollSolution()
