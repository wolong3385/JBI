function ROS_data=ROS(original_sample)
% k=[0 0.2 0.5 0.7 0.9];
% k=[2 5 7 9 10];
% k=[0.3 0.5 0.7 0.9];
data=original_sample;
positivesample=find(data(:,end)==1);
negtivesample=find(data(:,end)==0);
PT=data(positivesample,:);
NT=data(negtivesample,:);
[PT1 PT2]=size(PT);
[PN1 PN2]=size(NT);
m=PT1;
% [m0 n0]=size(k);

% switch IR
%         case 1
k=2;
%         for u=1:2
t=k*PT1; % number of duplicated instances
t=fix(t);
a=rand(1,t);
b=a*m+1;
c=floor(b);
S=PT(c,:);
%                 data=[data;S];
new_data=[data;S];
%         end

%         case 2
%         k=1;
% %         for u=1:2
%         t=k*PT1; % number of duplicated instances
%                 t=fix(t);
%                 a=rand(1,t);
%                 b=a*m+1;
%                 c=floor(b);
%                 S=PT(c,:);
%                 data=[data;S];
%                 new_data=data;
% %         end
%
%         case 3
%
% %         for u=1:2
%         t=PN1-PT1; % number of duplicated instances
%                 t=fix(t);
%                 a=rand(1,t);
%                 b=a*PT1+1;
%                 c=floor(b);
%                 S=PT(c,:);
%                 data=[data;S];
%                 new_data=data;
% %         end
%
%         case 4
%         k=0.9;
% %         for u=1:2
%         t=k*PT1; % number of duplicated instances
%                 t=fix(t);
%                 a=rand(1,t);
%                 b=a*m+1;
%                 c=floor(b);
%                 S=PT(c,:);
%                 data=[data;S];
%                 new_data=data;
% %         end
%         case 5
%             for i=1:n0
%                 %     if i==1
%                 %         t=PN1-PT1;
%                 %         a=rand(1,t);
%                 %         b=a*m+1;
%                 %         c=floor(b);
%                 %         S=PT(c,:);
%                 %         data1=[data;S];
%                 %         new_data{i}=data1;
%                 %     else
%                 t=k(i)*PT1; % number of duplicated instances
%                 t=fix(t);
%                 a=rand(1,t);
%                 b=a*m+1;
%                 c=floor(b);
%                 S=PT(c,:);
%                 data=[data;S];
%                 new_data{i}=data;
%             end
% end
ROS_data=new_data;
