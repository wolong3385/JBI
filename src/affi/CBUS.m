function CBUS_data=CBUS(original_sample)

data=original_sample;
    
[A B C] =clustercbus(data);

[m1 n1]=size(A);
[m2 n2]=size(B);
[m3 n3]=size(C);
m=[m1 m2 m3];
[q1 q2]=sort(m);

value= q2(3);
% % % if ~isempty(A)
% % %     q51=51
% % %  csvwrite(['k:\new_experiment_no_missing\CBUS\CBUS_three_cluster\original\training',file_name],A);
% % % end 
% % % 
% % % if ~isempty(B)
% % %     q52=52
% % % csvwrite(['k:\new_experiment_no_missing\CBUS\CBUS_three_cluster\original\training',file_name],B); 
% % % end 
% % % 
% % % if ~isempty(C)
% % %     q53=53
% % % csvwrite(['k:\new_experiment_no_missing\CBUS\CBUS_three_cluster\original\training',file_name],C);
% % % end 

switch value
    case 1
        D=A; 
    case 2
        D=B; 
    otherwise
        D=C;
end

CBUS_data=D;