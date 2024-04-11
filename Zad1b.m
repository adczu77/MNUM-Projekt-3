% Wynik zadania pierwszego:
f = @ (x) 2*sin(x)-exp(x)+5*x-1;
[xf1, ff1, iexe1, texe1] = newton(f, -5, 1e-8, 100);
[xf2, ff2, iexe2, texe2] = newton(f, 4, 1e-8, 100);
figure;
fplot(f, [-5,4]);
xlabel("x")
ylabel("y")
hold on;
r = [xf1, xf2];
p2 = [f(r(1)), f(r(2))];
scatter(r,p2,50,"filled");
disp(xf1);
disp(xf2);