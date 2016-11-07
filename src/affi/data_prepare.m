function [Train Test]=data_prepare(data_sample,pp);
group=data_sample(:,end);
[Train,Test]= crossvalind('HoldOut',group, pp);



