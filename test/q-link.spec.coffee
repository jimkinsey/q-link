qLink = require '../src/q-link'

describe 'Q Link', ->
  
  describe 'functions', ->
  
    it 'invoke the named method on the receiving object', ->
      greet = qLink 'greet'
      greeter = 
        greet: -> "Hello!"
      expect(greet()(greeter)).toBe 'Hello!'
    
    it 'invoke the named method with the provided arguments', ->
      greet = qLink 'greet'
      greeter = 
        greet: (name) -> "Hello #{name}!"
      expect(greet('Jane')(greeter)).toBe 'Hello Jane!'
    
    it 'invoke the named method in the correct scope', ->
      greet = qLink 'greet'
      greeter =
        prefix: 'Good morning'
        greet: (name) -> "#{@prefix} #{name}!"
      expect(greet('Tim')(greeter)).toBe 'Good morning Tim!'
  