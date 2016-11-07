% All these code are non-commercial use
% please assign a value for clvalue. clvalue=1 means SVM; 2 for C4.5; 3 for
% KNN; 4 for LDA; 5 for RF
% before run the code, pleae download and negative the direction (h:\JBI\data\*.csv) to your
% location files. And please modify the csvwrite direction as well.
clc;clear %  
clvalue=2;
p=0.4;
knnk=3;
file=dir('h:\JBI\data\*.csv');
file_name=cell(1,1);
csv_data=[];

for i=1:size(file,1)
    file_name=file(i).name
    AA=csvread(['h:\JBI\data\',file_name]);
    T1=[];T2=[];T3=[];T4=[];T5=[];T6=[];T7=[];T8=[];T9=[];T10=[];
    AAf=feature_selection(AA);
    counter=0;
    for j=1:50
        counter=counter+1
        [Train Test]=data_prepare(AA,p);
        [Yresult1]=none_holdout(Train,Test,AA,clvalue,knnk)
        T1=[T1 Yresult1];
        [Yresult2]=ros_sampling_holdout(Train,Test,AA,clvalue,knnk)
        T2=[T2 Yresult2];
        [Yresult3]=FS_sampling_holdout(Train,Test,AAf,clvalue,knnk)
        T3=[T3 Yresult3];
        
        [Yresult4]=MWMOTE_sampling_holdout(Train,Test,AA,clvalue,knnk)
        T4=[T4 Yresult4];
        [Yresult5]=WE_sampling_holdout(Train,Test,AA,clvalue,knnk)
        T5=[T5 Yresult5];
        
        [Yresult6]=rus_sampling_holdout(Train,Test,AA,clvalue,knnk)
        T6=[T6 Yresult6];
        [Yresult7]=CBUS_sampling_holdout(Train,Test,AA,clvalue,knnk)
        T7=[T7 Yresult7];
        [Yresult8]=CBOS_sampling_holdout(Train,Test,AA,clvalue,knnk)
        T8=[T8 Yresult8];
    end
    
    Y1=mean(T1,2);
    STDD1=std(T1')';
    R1=[T1 Y1 STDD1];
    
    Y2=mean(T2,2);
    STDD2=std(T2')';
    R2=[T2 Y2 STDD2];
    %
    Y3=mean(T3,2);
    STDD3=std(T3')';
    R3=[T3 Y3 STDD3];
    
    Y4=mean(T4,2);
    STDD4=std(T4')';
    R4=[T4 Y4 STDD4];
    
    Y5=mean(T5,2);
    STDD5=std(T5')';
    R5=[T5 Y5 STDD5];
    
    Y6=mean(T6,2);
    STDD6=std(T6')';
    R6=[T6 Y6 STDD6];
    
    Y7=mean(T7,2);
    STDD7=std(T7')';
    R7=[T7 Y7 STDD7];
    
    Y8=mean(T8,2);
    STDD8=std(T8')';
    R8=[T8 Y8 STDD8];
    
    csvwrite(['h:\JBI\Results\C4.5\ORI\',file_name],R1); %1
    csvwrite(['h:\JBI\Results\C4.5\ROS\',file_name],R2); %2
    csvwrite(['h:\JBI\Results\C4.5\FS\',file_name],R3); %3
    csvwrite(['h:\JBI\Results\C4.5\MWMOTE\',file_name],R4); %5
    csvwrite(['h:\JBI\Results\C4.5\WE\',file_name],R5); %6
    csvwrite(['h:\JBI\Results\C4.5\RUS\',file_name],R6); %8
    csvwrite(['h:\JBI\Results\C4.5\CBUS\',file_name],R7); %9
    csvwrite(['h:\JBI\Results\C4.5\CBOS\',file_name],R8); %10
    
end
