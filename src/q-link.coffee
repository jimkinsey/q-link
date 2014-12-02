module.exports = (names...) -> 
  buildFn = (name) -> (args...) -> (obj) -> obj[name].apply obj, args
  if names.length > 1
    names.map buildFn
  else
    buildFn names[0]