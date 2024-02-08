syms x y z
eqn1 = 2*x - 8 + z*(2*x - 2) == 0;
eqn2 = 2*y - 6 - z == 0;
eqn3 = x^2 -2*x +3 -y == 0;

[solx,soly,soll] = solve(eqn1, eqn2, eqn3, 'MaxDegree',3)

x = double(solx)
y = double(soly)