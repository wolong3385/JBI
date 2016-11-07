function [results]=RUS_sampling_holdout(Train,Test,data_sample,clvalue,knnk);

xdata=data_sample(:,1:end-1);
group=data_sample(:,end);
TT=[];
% TrainingSample=xdata(Train,:);
% TrainingLabel=group(Train,1);
TestingSample=xdata(Test,:);
TestingLabel=group(Test,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%new test data
Train_data=data_sample(Train,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  ros_data=shigang_SMOTE_ENN(Train_data); % here IR=1, means 200% oversampling

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
%%%%%%%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$




TrainingSample=rus_data(:,1:end-1);
TrainingLabel=rus_data(:,end);


size(ros_data)
switch clvalue
    case 1
        options.MaxIter = 100000;
        svmStruct=svmtrain(TrainingSample, TrainingLabel, ...
            'showplot',false,'rbf_sigma',0.5,'Options', options);
        OutLabel=svmclassify(svmStruct,TestingSample);
    case 2
        tree=ClassificationTree.fit(TrainingSample, TrainingLabel);
        OutLabel=predict(tree,TestingSample);
        
    case 3
        knncl=ClassificationKNN.fit(TrainingSample, TrainingLabel,'NumNeighbors',knnk);
        OutLabel=predict(knncl,TestingSample);
    case 4
        discriminantcl=ClassificationDiscriminant.fit(TrainingSample, TrainingLabel,'DiscrimType', 'diagQuadratic');
        OutLabel=predict(discriminantcl,TestingSample);
        OutLabel=char(OutLabel);
    case 5
        discriminantcl=TreeBagger(50,TrainingSample, TrainingLabel);
        [Predict_label,Scores] = predict(discriminantcl,TestingSample);
        Predict_label=char(Predict_label);
        OutLabel=double(Predict_label);
        Q=OutLabel;
        minvalue=min([Q]);
        maxvalue=max([Q]);
        M=size(Q,1);
        for i=1:M
            if Q(i)>=maxvalue
                Q(i)=1;
            else
                Q(i)=0;
            end
        end
        predicted=sum(Q)
        Q(1)==1
        Q(1)==0
        OutLabel=Q;
        %
        
end
[Acc Pre Recall FM AUC]= resultanalysis(OutLabel,TestingLabel);
results=[Acc Pre Recall FM AUC]';

