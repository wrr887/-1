

function [iout,qout] = comb (idata,qdata,attn)



iout = randn(1,length(idata)).*attn;
qout = randn(1,length(qdata)).*attn;
 
iout = iout+idata(1:length(idata));
qout = qout+qdata(1:length(qdata));

% ************************end of file***********************************
