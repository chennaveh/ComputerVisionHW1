function [P,R,F] =evaluate(E,E_GT)

%Calculate the 3 measures: P - Precision, R - Recall and F that combin both
%P and R



P = sum(and(E,E_GT),'all')/sum(E,'all'); % How many selected items are relevent
R = sum(and(E,E_GT),'all')/sum(E_GT,'all'); % How many relevent items are selected
F =(2*P*R)/(P+R);


end

