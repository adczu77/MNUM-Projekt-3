% Deklaracja funkcji znajdującej pierwiastki wielomianu metodą Mullera MM1:
function r = muller(w, eps, x0, x1, x2)
% w - wektor współczynników
% eps - dokładność rozwiązania
% x0 - dowolny punkt pierwszy
% x1 - dowolny punkt drugi
% x2 - dowolny punkt trzeci
% Punkty początkowe skryptu służące do tego, aby po podzieleniu wielomianu
% powrócić do tych punktów jako punktów wybranych:
x0p = x0;
x1p = x1;
x2p = x2;
p = w;
r = zeros(0);
j = 1;
k = 1;
% Główna pętla programu wraz z implementacją metody Mullera MM1:
while(j<=length(w)-1)
   x = [x0, x1, x2];
% Obliczenie różnic:
   z1 = x1-x0;
   z2 = x2-x1;
% Rozwiązanie układu równań tak, aby wyznaczyć współczynniki a,b,c:
   % Policzenie zmiennych pomocniczych do wyliczenia współczynników a i b:
   d1 = (polyval(p,x0)-polyval(p,x1))/z1;
   d2 = (polyval(p,x2)-polyval(p,x1))/z2;
   % Wyliczenie współczynnika a:
   a = (d2 - d1)/(z2+z1);
   % Wyliczenie współczynnika b:
   b = a * z2 + d2;
   % Wyliczenie współczynnika c:
   c = polyval(p,x2);
% Wyliczenie pierwiastków paraboli (zp - plus, zm - minus):
   zp = (-2*c/(b+sqrt(b^2-4*a*c)));
   zm = (-2*c/(b-sqrt(b^2-4*a*c)));
% Rozstrzygnięcie, który pierwiastek paraboli ma mniejszy moduł:
   if (abs(b+sqrt(b^2-4*a*c)) >= abs(b-sqrt(b^2-4*a*c)))
       zmin = zp;
   else
       zmin = zm;
   end
% Oblicznie przybliżonego rozwiązania:
   x3 = x2 + zmin;
% Usunięcie punktu położonego najdalej od przybliżonego rozwiązania: 
   v = [abs(x0-x3); abs(x1-x3); abs(x2-x3)];
   i = find(max(v));
   x(i) = [];
   x(end+1) = x3;
   % Ustalenie nowych punktów:
   x0 = x(1);
   x1 = x(2);
   x2 = x(3);
   % Gdy pierwiastek osiągnie zamierzoną dokładność wektor pierwiastków
   % wielomianu jest rozszerzany o ten pierwiastek, wielomian jest
   % dzielony przez (x-"wartość pierwiastka") a punkty wybrane przyjmują
   % wartości punktów początkowych:
   if(abs(polyval(p,x3))<eps)
       r(end+1) = x3;
       j = j+1;
       p = deflation(p, x3);
       p = p(1:length(p)-1);
       x0 = x0p;
       x1 = x1p;
       x2 = x2p;
       disp(k);
       k = 0;
   end
   k = k+1;
end
% Transpozycja wektora z poziomego na pionowy:
r = r';