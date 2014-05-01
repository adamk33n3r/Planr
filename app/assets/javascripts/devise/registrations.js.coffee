domains = [
  "hotmail.com"
  "gmail.com"
  "aol.com"
]
topLevelDomains = [
  "com"
  "net"
  "org"
]
#superStringDistance = (string1, string2) ->
  # a string distance algorithm of your choosing

$ ->
  $("#user_email").blur ->
    $(this).mailcheck
      domains: domains # optional
      topLevelDomains: topLevelDomains # optional
      #distanceFunction: superStringDistance # optional
      suggested: (element, suggestion) ->
        #alert("Did you mean " + suggestion.full + " ?")
        sug = $("<a href='#'>#{suggestion.full}</a>")
        sug.click (e) ->
          e.preventDefault()
          $("#user_email").val(suggestion.full)
          $("#suggestion").remove()
        $("#user_email").parent().append($("<i id='suggestion'>").text("Did you mean ").append(sug).append("?"))
      #empty: (element) ->
      #  alert "Invalid email!"