const addition = require('./index');
const soustraction = require('./index');

test('addition de 2 et 3 doit donner 5', () => {
  expect(addition(2, 3)).toBe(5);
});

test('soustraction de 5 et 3 doit donner 2', () => {
  expect(soustraction(5, 3)).toBe(2);
});
