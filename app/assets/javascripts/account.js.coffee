$ ->
  $("#account-form").on "submit", (event) ->
    event.preventDefault()

    $("input[name='commit']").attr({
      "value": "Arbejder..."
      "disabled": "disabled"
    })

    data = $(@).serializeArray().filter (element) ->
      return element.value != ""

    $.ajax
      type: "POST"
      url: $(@).attr("action"),
      data: $(@).serialize()
      dataType: "json"
      success: (data) ->
        window.location.href = data.url
        true
    , "script"

    false
