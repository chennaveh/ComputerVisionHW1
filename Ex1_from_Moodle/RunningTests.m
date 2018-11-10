function [PRF_results] = RunningTests(I,I_E_GD,L_th,H_th,sigma,Naive,EdgeDetectorAlgo)
%RUNNINGTESTS automate the edgedetector over all input params and
%display the image with the best configured params 
%return PRF_Results of all available options:
%(size(L_th,2)*size(H_th,2)*size(sigma,2) on  3 )



x=1;
y=1;
PRF_results = zeros(size(L_th,2)*size(H_th,2)*size(sigma,2),6); %init a matrix (Num_Possibilits, 3)
%collecting results on all posibilities
for t=1:size(I,2)
    maxF = 0;
    for i=1:size(L_th,2)
        y=1;
        for j=1:size(H_th,2)
            for k=1:size(sigma,2)
                if strcmpi(EdgeDetectorAlgo,'canny')
                    edges = canny(I{t}, sigma(k) ,L_th(i), H_th(j));
                else
                    edges = sobel(I{t},L_th(i));
                end 
                
                if strcmpi(Naive,'naive')                   
                    [P,R,F]= evaluate_naive(edges,squeeze(I_E_GD(t,:,:)));
                else
                    [P,R,F]= evaluate(edges,squeeze(I_E_GD(t,:,:))); 
                end
                PRF_results(x,:) = [P,R,F,L_th(i),H_th(j),sigma(k)];
                if F > maxF
                    maxF=F;
                    figure (100+t*9+double(Naive(1)) + double(EdgeDetectorAlgo(1)))
                    imshow(squeeze(edges), [])
                    if sigma(k)==-1
                        title(['lt = ' num2str(L_th(i)) ', P = ' num2str(P) ', R = ' num2str(R) ', F = ' num2str(F)])
                    else
                        if strcmpi(Naive,'naive') 
                            title(['lt = ' num2str(L_th(i)) ', ht = ' num2str(H_th(j)) ', \sigma = ' num2str(sigma(k)) ', P = ' num2str(P) ', R = ' num2str(R) ', F = ' num2str(F)])
                        else
                            title(['with imdilate:lt = ' num2str(L_th(i)) ', ht = ' num2str(H_th(j)) ', \sigma = ' num2str(sigma(k)) ', P = ' num2str(P) ', R = ' num2str(R) ', F = ' num2str(F)])
                        end
                        
                    end
                    
                end
                %uncomment this of you want to display all images
%                 figure (100+t+i)
%                 subplot(size(sigma,2), size(H_th,2), y);
%                 imshow(squeeze(edges), [])
%                 title(['lt = ' num2str(L_th(i)) ', ht = ' num2str(H_th(j)) ', \sigma = ' num2str(sigma(k))])
%                 
%                 y=y+1;
                  x=x+1;
            end
        end
    end
end

end

