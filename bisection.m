% Deklaracja funkcji znajdującej pierwiastki funkcji metodą bisekcji:
function r = bisection(func, a, b, eps)
% func - funkcja, której pierwiastki chcemy znaleźć
% a - punkt początkowy przedziału
% b - punkt końcowy przedziału
% eps - dokładność rozwiązania
% args - argumenty, po których będziemy iterować w celu sprawdzenia ile
% pierwiastków zawiera funkcja na wskazanym przez nas przedziale:
args = [a:1:b];
j = 1;
k = 1;
% Podział zadeklarowanego przedziału na podprzedziały tak, aby każdy
% zawierał tylko jeden pierwiastek:
for i=1:length(args)
    if (func(a)*func(args(i)) < 0)
        range(:,j) = [a; args(i)];
        j = j + 1;
        a = args(i);
    end
end
[w, ~] = size(range);
i = 1;
% w - ilość podprzedziałów
% subr - podprzedział, w którym aktualnie znajdujemy pierwiastek
% range - zbiór podprzedziałów
subr = range(:,i);
% Pętla główna - znajdowanie pierwiastków funkcji:
while(true)
    a = subr(1,:);
    b = subr(2,:);
    % c - środek przedziału [a,b]
    c = (sum(subr))/2;
    yc = func(c);
    % Sprawdzenie czy c jest pierwiastkiem funkcji:
    % Jeśli tak to jest on dodawany do wektora rozwiązań, i następuje
    % przejście do następnego podprzedziału.
    if (yc == 0 || abs(yc) < eps)
        r(i) = c;
        i = i + 1;
        disp(k);
        k = 0;
        if i == w + 1
            break;
        end
        subr = range(:,i);
    % Jeśli nie to sprawdzamy podprzedział [c,b], jeśli iloczyn wartości
    % funkcji w punktach c i b jest dodatni to podzakresem, który
    % sprawdzamy staje się przedział [a,c].
    elseif func(b) * func(c) > 0
        subr = [a; c];
    % Jeśli iloczyn wartości funkcji w punktach c i b jest ujemny
    % to podzakresem, który sprawdzamy staje się przedział [c,b].
    elseif func(b) * func(c) < 0
        subr = [c;b];
    end
    k = k + 1;
end
disp(k);