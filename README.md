Q-Link
======
Reduce boiler-plate in Q `then` calls by creating functions to invoke methods on objects.

e.g.

    getNames().then(function (names) {
      return names.join(', ');
    });
    
with q-link can be rewritten as:

    join = qLink('join');
    
    getNames().then(join(', '));
    

The join function returns a function which takes arguments which in turn returns a function which takes an object and applies the join method with the provided arguments.

This is useful with Q as the `then` and `fail` methods take functions which operate on the result of the promise

Installation
------------

   npm install q-link --save

Usage
-----

Q-link is a single function which takes names of methods and returns functions to apply those methods:

    filter = qLink('filter');
    
The q-linking of multiple methods is more useful in CoffeeScript or ECMAScript 6 where it can be used with destructuring assignment:

    [filter, map, join] = qLink 'filter', 'map', 'join'
  
Non-Q usage
-----------

While this module was created to reduce boiler-plate while working with Q, there is nothing Q-specific about it and it may be used anywhere where a function is used to invoke a method on a passed object - for example operating on elements in an array or providing a callback (when the callback takes a single success argument).

    split = qLink('split');
    
    fullNames.map(split(' '));
