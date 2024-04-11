% Wynik zadania pierwszego:
f = @ (x) 2*sin(x)-exp(x)+5*x-1;
r = bisection(f, -100, 100, 1e-8);
e = exp(1);
disp(r);
figure;
fplot(f, [-5,4]);
xlabel("x")
ylabel("y")
yr = fzero(f, -5);
hold on;
p2 = [f(r(1)), f(r(2))];
scatter(r,p2,50,"filled");
disp(f(-5));
disp(f(4));
