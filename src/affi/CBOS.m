function CBOSsample= CBOS(data)

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

indm=kmeans(class0,k,'emptyaction','singleton');
lm1=find(indm==1);
lm2=find(indm==2);
lm3=find(indm==3);
% lm4=find(indm==4);
% lm5=find(indm==5);

m1=size(lm1,1);
m2=size(lm2,1);
m3=size(lm3,1);
% m4=size(lm4,1);
% m5=size(lm5,1);
mm=max([m1,m2,m3]); % manximum m from majority class

mjclass1=class0a(lm1,:);  % different class examples after cluster
mjclass2=class0a(lm2,:);
mjclass3=class0a(lm3,:);
% mjclass4=class0a(lm4,:);
% mjclass5=class0(lm5,:);


revisedm1= ransamCBOS(m1,mm);
if revisedm1~=0
revisedclass1 = mjclass1(revisedm1,:);
revisedclass1 = [mjclass1; revisedclass1];
else
    revisedclass1 = mjclass1;
end


revisedm2= ransamCBOS(m2,mm);
if revisedm2~=0
revisedclass2 = mjclass2(revisedm2,:);
revisedclass2 = [mjclass2; revisedclass2];
else
    revisedclass2 = mjclass2;
end


revisedm3= ransamCBOS(m3,mm);
if revisedm3~=0
revisedclass3 = mjclass3(revisedm3,:);
revisedclass3 = [mjclass3; revisedclass3];
else
    revisedclass3 = mjclass3;
end

% 
% revisedm4= ransamCBOS(m4,mm);
% if revisedm4~=0
% revisedclass4 = mjclass4(revisedm4,:);
% revisedclass4 = [mjclass4; revisedclass4];
% else
%     revisedclass4 = mjclass4;
% end
% revisedm5= ransamCBOS(m5,mm);
% revisedclass5 = mjclass5(revisedm5,:);


% oversampling for balancing minority class
indmi=kmeans(class1,k-1);
lmi1=find(indmi==1);
lmi2=find(indmi==2);
% lmi3=find(indmi==3);
% lmi4=find(indmi==4);
% lmi5=find(indmi==5);

mi1=size(lmi1,1);
mi2=size(lmi2,1);
% mi3=size(lmi3,1);
% mi4=size(lmi4,1);
% mi5=size(lmi5,1);
mmi=floor(k*mm/(k-1)); % manximum m from majority class

mijclass1=class1a(lmi1,:);  % different class examples after cluster
mijclass2=class1a(lmi2,:);
% mijclass3=class1a(lmi3,:);
% mijclass4=class1a(lmi4,:);
% mijclass5=class0(lmi5,:);

revisedmi1= ransamCBOS(mi1,mmi);
if revisedmi1~=0
revisedclassi1 = mijclass1(revisedmi1,:);
revisedclassi1 = [mijclass1; revisedclassi1];
else
    revisedclassi1 = mijclass1;
end


revisedmi2= ransamCBOS(mi2,mmi);
if revisedmi2~=0
revisedclassi2 = mijclass2(revisedmi2,:);
revisedclassi2 = [mijclass2; revisedclassi2];
else
    revisedclassi2 = mijclass2;
end


% revisedmi3= ransamCBOS(mi3,mmi);
% if revisedmi3~=0
% revisedclassi3 = mijclass3(revisedmi3,:);
% revisedclassi3 = [mijclass3; revisedclassi3];
% else
%     revisedclassi3 = mijclass3;
% end


% % revisedmi4= ransamCBOS(mi4,mmi);
% % if revisedmi4~=0
% % revisedclassi4 = mijclass4(revisedmi4,:);
% % revisedclassi4 = [mijclass4 revisedclassi4];
% % else
% %     revisedclassi4 = mijclass4;
% % end

% revisedmi5= ransamCBOS(mi5,mmi);
% revisedclassi5 = mijclass5(revisedmi5,:);

CBOSsample=[revisedclass1; revisedclass2; revisedclass3;revisedclassi1;revisedclassi2];

% csvwrite('k:\IDRoS\CBOS\clusterCM_1.csv',Traindata)

