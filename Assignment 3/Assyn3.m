clear All;clc; format long g;
num = xlsread("Q3_Data.xlsx");
disp("LinReg Model Estimate using fitlm function of Matlab:");
%Creating array to store Z1,Z2,Z3,Z4 values
haug1 = [num(:,1) num(:,1).*num(:,2).^2 num(:,3).*num(:,2).^2 num(:,1).*num(:,3).*num(:,4) ];

disp("Param Values Calculated using multi_lin_reg function hardcoded by prof:");
out = multi_lin_reg(haug1,num(:,5),0.0145);
disp(" ");
disp("Estimates using multi_lin_reg function :");
disp(out.params);
disp("Standard Error in multi_lin_reg function :");
disp(out.SE_params);