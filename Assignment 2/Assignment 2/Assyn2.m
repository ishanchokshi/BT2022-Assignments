clc; format long g;
sheets = sheetnames("data.xlsx");
%Reading data from sheets
for ind=1:length(sheets)
    num(:,1,ind) = xlsread("data.xlsx",sheets(ind),'A2:A11');
    num(:,2,ind) = xlsread("data.xlsx",sheets(ind),'B2:B11');
end

alphastar = 0.05;alpha = 0.01;mk=[];tvalues=[];
%Alpha = alphastar/5 as there are 5 pairs of conditions for genes
fstatvalues = [];
for i =1:5 
    out = general_ttest(num(:,1,i),num(:,2,i),alpha);
    tvalues(i,1) = out.tcal;
    mk(i,1) = out.tpval;
    fstatvalues(end+1)=out.nh_F;
end
disp("Using General Functions taken from general_ttest.m :");
disp("Hypothesis Values(Ftest/Varcomparison) for genes are :");disp(fstatvalues);
disp("T statistics Values :");disp(tvalues);
[F,I]= sort(mk);     A=[F,I];
disp("Ordered P values with Rank of genes(Increasing order of p values) :");
disp(A);    P(:)=(A(:,1)<alpha);
diffgene = []; highestgene = 0;

for i =1:5
    if P(i) == 1
        highestp = A(i,1);
        highestgene = A(i,2);
        diffgene(end+1) = A(i,2);
    end
end

disp("Gene whose cutoff p value just passes bonneferoni condition :"+highestgene);
disp("Highest Cutoff P value  : " + highestp);
disp("Genes that are differentially expressed :")
disp(diffgene);
disp("Number of Differentially Expressing genes :" +length(diffgene) );
% 
% %Using Inbuilt functions:
disp(" ");
disp("Using Inbuilt Functions : ");
tvalues=[];fstatvalues = [];
for i =1:5 
      out = mgeneral_ttest(num(:,1,i),num(:,2,i),alpha);
      mk(i,1) = out.tpval;
      tvalues(i,1) = out.tcal;
      fstatvalues(end+1)=out.nh_F;
end
disp("Hypothesis Values(Ftest/Varcomparison) for genes are :");disp(fstatvalues);
 disp("T statistics Values :");disp(tvalues);
[F,I]= sort(mk);     A=[F,I];
disp("Ordered P values with Rank of genes(Increasing order of p values) :");
disp(A);    P(:)=(A(:,1)<alpha);
diffgene = [];

for i =1:5
    if P(i) == 1
        highestp = A(i,1);
        highestgene = A(i,2);
        diffgene(end+1) = A(i,2);
    end
end

disp("Gene whose cutoff p value just passes bonneferoni condition :"+highestgene);
disp("Highest Cutoff P value  : " + highestp);
disp("Genes that are differentially expressed :")
disp(diffgene);
disp("Number of Differentially Expressing genes :" +length(diffgene) );

