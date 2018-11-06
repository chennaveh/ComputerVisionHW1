function [PRF_results] = RunningTests(I,I_E_GD,L_th,H_th,sigma,Naive)
%RUNNINGTESTS Summary of this function goes here
%   Detailed explanation goes here


x=1;
PRF_results = zeros(size(L_th,2)*size(H_th,2)*size(sigma,2),3); %init a matrix (Num_Possibilits, 3)
%collecting results on all posibilities
for t=1:size(I,2)
    for i=1:size(L_th,2)
        for j=1:size(H_th,2)
            for k=1:size(sigma,2)
                edges = canny(I{t}, sigma(k) ,L_th(i), H_th(j));
                if strcmpi(Naive,'naive')                   
                    [P,R,F]= evaluate_naive(edges,squeeze(I_E_GD(t,:,:)));
                else
                    [P,R,F]= evaluate(edges,squeeze(I_E_GD(t,:,:))); 
                end
                PRF_results(x,:) = [P,R,F];
                x=x+1;
            end
        end
    end
end

end

