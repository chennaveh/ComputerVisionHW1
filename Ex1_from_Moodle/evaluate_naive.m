function [P,R,F] = evaluate_naive(E,E_GT)
%Calculate the 3 measures: P - Precision, R - Recall and F that combin both
%P and R to the F measurment

E=logical(E); %turn the matrix to a logical matrix
numerator = sum(and(E,E_GT),'all');
P = numerator/sum(E,'all'); % How many selected items are relevent
R = numerator/sum(E_GT,'all'); % How many relevent items are selected
F =(2*P*R)/(P+R);

end

