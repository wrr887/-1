


function [iout,qout] = comp1( idata, qdata , nsymb , sample) 



iout=zeros(1,nsymb*sample);
qout=zeros(1,nsymb*sample);
iout(1:sample:1+sample*(nsymb-1))=idata;
qout(1:sample:1+sample*(nsymb-1))=qdata;

%******************** end of file ***************************
