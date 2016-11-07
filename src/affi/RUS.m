function rus_data=RUS(original_sample)

% random undersampling
dataRUS=Train_data;
RUS=0.5;

[rows cols]=size(dataRUS);
us0=find(dataRUS(:,cols)==0);
A0=dataRUS(us0,:);

us1=find(dataRUS(:,cols)==1);
A1=dataRUS(us1,:);

[m1 n1]=size(A1);
[m0 n0]=size(A0);
k=RUS*m0;
k=floor(k);
v=randperm(m0) ;

s05=v(1:k);
A0(s05,:)=[];
new_da=[A1; A0];
edata=new_da;
rus_data=edata;
