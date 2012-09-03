/*jshint undef:false */

describe("Calculator", function() {

  var calculator;

  beforeEach(function() {
    calculator = new Calculator();
  });

  describe("Add", function() {
   it ("adds two numbers", function() {
     expect(calculator.plus(2, 3)).toEqual(5);
   });

  });

  describe("Minus", function() {
    it ("subtracts two numbers", function() {
      expect(calculator.minus(5, 1)).toEqual(4);
    });
  });
});

