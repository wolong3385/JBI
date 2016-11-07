function [results]=CBUS_sampling_holdout(Train,Test,data_sample,clvalue,knnk);

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

 ros_data=CBUS(Train_data); % here IR=1, means 200% oversampling
TrainingSample=ros_data(:,1:end-1);
TrainingLabel=ros_data(:,end);


size(ros_data)
switch clvalue
    case 1
        options.MaxIter = 10000;
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
        RF=TreeBagger(50,TrainingSample, TrainingLabel);
        [Predict_label,Scores] = predict(RF,TestingSample);
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

