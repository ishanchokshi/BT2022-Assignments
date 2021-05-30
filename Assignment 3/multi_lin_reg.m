function out = multi_lin_reg(ax, ay, alpha)
out = struct('alpha',alpha,'params',0,'tpvalues',0,'errDOF',0,'totDOF',0,'regDOF',0,'MSE',0,'nparam',0,'tstat',0,'covmat',0,'SE_params',0,'H0_params',0,'SST',0,'SSR',0,'SSE',0,'RMS_ERROR',0,'fcal',0,'H0_f',0,'fpvalue',0,'R_square',0,'R_square_adj',0,'error',0);
np = length(ax(1,:))+1;
xmat = zeros(length(ax(:,1)),np);
xmat(:,1) = 1; xmat(:,2:np) = ax;
betam = (inv(xmat'*xmat))*xmat'*ay;
out.params = betam;
yp = multipred(betam,xmat);
out.totDOF = length(ay(:,1))-1;
out.regDOF = np-1;
out.errDOF = out.totDOF-np+1;
out.nparam = np;
out.SSE = sum((ay-yp).^2);
out.SST = sum(ay.^2)-sum(ay)^2/length(ay(:,1));
out.SSR = out.SST-out.SSE;
out.MSE = out.SSE/out.errDOF;
out.RMS_ERROR = sqrt(out.MSE);
out.fcal = (out.SSR/out.regDOF)/out.MSE;
out.fpvalue = lfpval(out.fcal,out.regDOF,out.errDOF);
out.covmat = ((xmat'*xmat)^-1) * out.MSE;
out.SE_params = abs(tinv(alpha/2,out.errDOF))*sqrt(diag(out.covmat));
    if out.fpvalue < out.alpha
        out.H0_f = 1;
    else
        out.H0_f = 0;
    end 
out.tstat = betam.*(out.SE_params).^-1;
out.tpvalues = zeros(np,1);
    for i=1:length(out.tstat)
        out.tpvalues(i) = ltpval(out.tstat(i),out.errDOF);
    end
    out.H0_params = zeros(length(out.tpvalues),1);
    for i=1:length(out.tpvalues)
        if out.tpvalues(i) < alpha
            out.H0_params(i) = 1;
        else
            out.H0_params(i) = 0;
        end
    end
    out.R_square = 1 - out.SSE/out.SST;
    out.R_square_adj = 1 - (out.SSE/out.errDOF)/(out.SST/out.totDOF);
end


















% compute Y cap values
function ymat = multipred(bmat, xmat)
ymat = zeros(length(xmat(:,1)),1);
    for i=1:length(xmat(:,1))
        for w=1:length(xmat(1,:))
            ymat(i) = ymat(i) + bmat(w,1) * xmat(i,w);
        end
    end
end
%convert t-value to p-value
function pval = ltpval(t, v)
    pval = betainc(v/(v+t^2),v/2,0.5);
end
% convert F value to p-value
function pval = lfpval(f, adof, bdof)
    if f < 1
        pval = fcdf(f,adof,bdof);
    else
        pval = fcdf(1/f,bdof,adof);
    end
end