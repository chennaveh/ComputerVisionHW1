function [P,R,F] = evaluate_naive(E,E_GT)
%Calculate the 3 measures: P - Precision, R - Recall and F that combin both
%P and R

P = sum(and(E,E_GT),'all')/sum(E); % How many selected items are relevent
R = sum(and(E,E_GT),'all')/sum(GT); % How many relevent items are selected
F =(2*P*R)/(P*R);

%TODO - answer the question from the PDF!!!!

end

