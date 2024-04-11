% Wynik zadania drugiego:
r = muller([-1,-7,7,3,9], 1e-8, -100, 0, 100);
a = [-1,-7,7,3,9];
disp(r);
f = @(x) a(1)*x.^4+a(2)*x.^3+a(3)*x.^2+a(4)*x+a(5);
figure;
fplot(f, [-20,20]);
ylim([-20,20]);
xlim([-20,20]);
ylabel("y");
xlabel("x");
grid on;
xr = roots(a);
yr = f(xr);
hold on;
re = real(r);
im = imag(r);
scatter(re,im,50,"filled");

