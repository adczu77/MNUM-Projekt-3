% Deflacja wielomianu czynnikiem liniowym wykorzystująca prosty schemat
% Hornera:
function v = deflation(a, alfa)
v = [];
for i=1:length(a)
    if i == 1
        v(i) = a(i);
    else
        v(i) = alfa*v(i-1) + a(i);
    end
end