const addition = require('./index');

test('addition de 2 et 3 doit donner 5', () => {
  expect(addition(2, 3)).toBe(5);
});
