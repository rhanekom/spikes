/*jshint undef:false */

var calculator = new Calculator();

module("calculator");

test( "add adds two numbers", function() {
  equal(calculator.plus(2, 3), 5, "2 + 3 = 5");
});

test( "minus subtracts two numbers", function() {
  equal(calculator.minus(5, 1), 4, "5 - 1 = 4");
});


