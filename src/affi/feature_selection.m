function newsample=feature_selection(A)
T=100;
% A=csvread('k:\new_sampling_experiment\DNA\colon.csv');
% A=csvread('k:\shigang_M_IM_data\DLBCLTumor.csv');
Asample=A(:,1:end-1);
[m n]=size(Asample);
Label=A(:,end);
% D=pdist(x,@nandistfun);
D=nandistfun(Asample);
Z=linkage(D,'average');
c = cluster(Z,'maxclust',T);


C1=[];
for i=1:T
    B=[];
    FSScol=find(c==i);
    FSS=A(:,FSScol);%Feature subspace
    [mFSS nFSS]=size(FSS); %size of festure subspace
    for j=1:nFSS
        FSS1=FSS(:,j); %each feature of subspace
        oneLabel=find(Label==1);
        zerosLabel=find(Label==0);
        onesample=FSS1(oneLabel,:);
        zerossample=FSS1(zerosLabel,:);
        [mu0 sigma0]=normfit(zerossample);
        [mu1 sigma1]=normfit(onesample);
        B(j)=abs(mu0-mu1)/(sigma0+sigma1);
    end
    [val pos]=sort(B);
    posi=pos(end);
    C=FSS(:,posi);
    
    if i == 1
       C1=C;
    else
       C1=[C1 C];
    end
end

newsample=[C1 Label];
labell=newsample(:,end)



