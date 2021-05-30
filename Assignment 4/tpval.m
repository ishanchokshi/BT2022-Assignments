function pval = tpval(t, v)
pval = betainc(v/(v+t^2),v/2,0.5);
end