###
    jquery.datashot.js

    Copyright 2012, Acatl Pacheco
    Licensed under the MIT License.
###

do ($ = jQuery, namespace = "ds") ->
    namespace = namespace or "ds"
    parse = (obj, path) ->
        path = path.split(/[\[\]\.]+/)
        path.pop()  if path[path.length - 1] is ""
        while path.length and (obj = obj[path.shift()])
            ;
        obj

    inject =  (target, data, handle) ->
        nodes = $("[data-#{namespace}]", target)
        nodes.each -> 
            $this = $(@)
            path = $this.data namespace
            tokens = path.split(/[\:]+/)
            tokens.unshift("text") if tokens.length is 1 
            value = parse data, tokens[1]
            value = handle($this, tokens[1], value) if typeof handle is "function"
            $this[tokens[0]] value
            
    $.fn.datashot = (data, handle) -> 
        @each ->
            inject(@, data, handle)