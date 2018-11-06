function [PRF_results] = RunningTests(I_E,I_E_GD,L_th,H_th,sigma,naive='yes')
%RUNNINGTESTS Summary of this function goes here
%   Detailed explanation goes here


x=1;
PRF_results = zeros(size(L_th,2)*size(H_th,2)*size(sigma,2),3); %init a matrix (Num_Possibilits, 3)
%collecting results on all posibilities
for i=1:size(L_th,2)
    for j=1:size(H_th,2)
        for k=1:size(sigma,2)
            for t=1:3
                edges = canny(I_E(1), sigma(k) ,L_th(i), H_th(j));
                if (naive=='yes')
                    PRF_results(x) = evaluate_naive(edges,I_E_GD(t));
                else
                    PRF_results(x) = evaluate(edges,I_E_GD(t));
                end
                x=x+1;
            end
        end
    end
end

end

