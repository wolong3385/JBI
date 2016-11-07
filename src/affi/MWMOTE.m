function MWMOTE_data=MWMOTE(original_sample);
file_data=original_sample;
A=file_data;
[rows cols]=size(A);
us0=find(A(:,cols)==0);
A0=A(us0,:);
[A01 A02]=size(A0);
us1=find(A(:,cols)==1);
A1=A(us1,:);
[m n]=size(A1);
% R=[0 0.2 0.5 0.7 0.9];
% R=[0.3 0.5 0.7 0.9];
% [m0 n0]=size(R);

% switch IR
%     case 1        
        R1=2;
        k=R1*m;
        k=floor(k);
        G2=MWMOTE(A,k);
        data=G2;

%         
%         case 2
%         R1=0.5 ;
%         k=R1*m;
%         k=floor(k);
%         G2=MWMOTE(A,k);
%         data=G2;
%         
%         case 3
%         R1=0.7;
%         k=R1*m;
%         k=floor(k);
%         G2=MWMOTE(A,k);
%         data=G2;
% 
%         
%         case 4
%         R1=0.9;
%         k=R1*m;
%         k=floor(k);
%         G2=MWMOTE(A,k);
%         data=G2;

        
%       case 5  
%           for i=1:n0
%               %     if  i==1
%               %         k=A01-m;
%               %         k=floor(k);
%               %         B1=zeros(rows+k,cols);
%               %         B1(1:rows,:)=A;
%               %         B1(rows+1:rows+k,:)=NaN;
%               %         B1(rows+1:rows+k,cols)=1;
%               %         [ins att]=size(B1);
%               %         b=randperm(ins);
%               %         B1=B1(b,:);
%               %         r1=B1(:,end); % find out label
%               %         r1=find(r1==1);
%               %         C=B1(r1,:);
%               %         G1=shigang_coefficient_IDIM_recovery(C);
%               %         G1=[A; G1];
%               %         G1=shigang_coefficient_IDIM_recovery(G1);
%               %         data{i}=G1;
%               %     else
%               k=R(i)*m;
%                 k=floor(k);
%                 G2=MWMOTE(A,k);
%                 data{i}=G2;
%           end
end
MWMOTE_data=data;