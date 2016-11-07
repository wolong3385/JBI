% wilson's editing  last row is the label
% eliminate patterns whose class label does not match the class for most of its k nearest neighbours
function revisedsample=we(T)
k=3;
[at in]=size(T);
sample=[];
NT=T(1:end-1,:);
s=[];

negtivesample=find(T(end,:)==0);
NT0=T(:,negtivesample);
[PN1 PN2]=size(NT0);

%%NTsample=find(T(end,:)==1); % label-vector which is the last row for most of the time
for i=find(T(end,:)==0)
        d=dist(NT(:,i)', NT);
        d(i)=Inf;
         [tmp,id]=sort(d);
         min_id=id(1:k);
         % for j=1:k
             pnofmin=T(end,min_id);
%%             valueofpnofmin1=find(pnofmin==1);
 %%            valueofpnofmin0=find(pnofmin==0)
             valueofpnofmin0=(pnofmin==0);
             
         %    sn=[sn pnofmin
%        sn=find(pnofmin==1)
%q=T(end,i);

        sumsn=sum( valueofpnofmin0);
            if (sumsn<2)
             s=[s i];
%             elseif (sumsn<2 & T(end,i)~=1)
%              s=[s i];
            else
                s=[s];
            end
end
T(:,s)=[];
revisedsample=T;

