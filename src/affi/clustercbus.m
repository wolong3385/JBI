
 function [revisedclass1 revisedclass2 revisedclass3]= clustercbus(data)

k=3;
% This function is used for cluster-based oversampling
% the last column of the data set should be label such as 0 1
[m n]=size(data);
label=data(:,n);
label0 = find(label==0);
label1 = find(label==1);
class0=data(label0,1:n-1); % label 0 class without lable
class0a=data(label0,:); % label 0 class with lable
class1=data(label1,1:n-1); % label 1 class without lable
class1a=data(label1,:); % label 1 class with lable

% oversampling for balancing majority class

indm=kmeans(class0,k);
none=isnan(indm);
no_none=find(none==0);
indm=indm(no_none);

lm1=find(indm==1);
lm2=find(indm==2);
lm3=find(indm==3);
% lm4=find(indm==4);
% lm5=find(indm==5);

m1=size(lm1,1);
m2=size(lm2,1);
m3=size(lm3,1);
% m4=size(lm4,1)
% m5=size(lm5,1);
% mm=max([m1,m2,m3,m4]) % manximum m from majority class

mjclass1=class0a(lm1,:);  % different class examples after cluster
mjclass2=class0a(lm2,:);
mjclass3=class0a(lm3,:);
% mjclass4=class0a(lm4,:);
% mjclass5=class0(lm5,:);

if m1>5
revisedclass1 = [mjclass1; class1a];
else
revisedclass1=[];
end

if m2>5
revisedclass2 = [mjclass2; class1a];
else
revisedclass2=[];
end

if m3>5
revisedclass3 = [mjclass3; class1a];
else
revisedclass3=[];
end

% if m4>5
% revisedclass4 = [mjclass4; class1a];
% else
% revisedclass4=[]
end


% CBOSsample=[revisedclass1; revisedclass2; revisedclass3;revisedclass4];

% csvwrite('k:\IDRoS\CBOS\clusterCM_1.csv',Traindata)


 