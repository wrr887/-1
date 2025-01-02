

function [iout, qout] = compconv(idata, qdata, filter)



iout = conv(idata,filter);
qout = conv(qdata,filter);
 
%******************** end of file ***************************