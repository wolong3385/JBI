function [Acc Pre Recall FM AUC] = resultanalysis(predicted,actual)

Ma=size(actual,1);
Mp=size(predicted,1);
M=min(Ma,Mp);
predicted=[predicted];
actual=[actual];
TP=0;
TN=0;
FN=0;
FP=0;
beta=1;
Q=predicted;
Q=double(Q);

minvalue=min([Q]);
maxvalue=max([Q]);

 for i=1:M
   if Q(i)>=maxvalue
Q(i)=1;
   else 
Q(i)=0;
   end
 end
predicted=Q;

for i=1:M
    if (predicted(i)==0 & actual(i)==0)
        TN=TN+1;
    elseif (predicted(i)==0 & actual(i)==1)
            FN=FN+1;
    elseif (predicted(i)==1 & actual(i)==1)
                TP=TP+1;
            else
                FP=FP+1;
%             end
%         end
     end
end

Acc=(TP+TN)/(TP+TN+FP+FN);
Pre=TP/(TP+FP);
Recall=TP/(TP+FN);
FM=((1+beta*beta)*Recall*Pre)/(beta*beta*(Recall+Pre));
mol=TP*TN-FP*FN;
den=sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN));
% GM=sqrt(Recall*Pre);
TPR=Recall;
FPR=FP/(FP+TN);
AUC=(1+TPR-FPR)/2;
q1=(TP+FN)/(TP+TN+FP+FN);
q2=(TP+FP)/(TP+TN+FP+FN);
qq=q1*q2+(1-q1)*(1-q2);
% Kappa=(Acc-qq)/(1-qq);
% MS=abs(TPR-FPR);
% MCC=mol/den;
% ER = sum(actual ~= predicted)/M;

[Acc Pre Recall FM AUC];