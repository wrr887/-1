

%******************** Preparation part *************************************

sr=256000.0; 
ml=2;        
br=sr .* ml; 
nd = 1000;   
ebn0=3;      
IPOINT=8;    



irfn=21;                  
alfs=0.5;                 
[xh] = hrollfcoefqpsk(irfn,IPOINT,sr,alfs,1);   
[xh2] = hrollfcoefqpsk(irfn,IPOINT,sr,alfs,0);  

%******************** START CALCULATION *************************************

 

noe = 0;    
nod = 0;   

 
	
    data1=rand(1,nd*ml)>0.5;  
    

    [ich,qch]=m1(data1,1,nd,ml);
	[ich1,qch1]= comp1(ich,qch,length(ich),IPOINT); 
	[ich2,qch2]= compconv(ich1,qch1,xh); 
     

	
    spow=sum(ich2.*ich2+qch2.*qch2)/nd;  
	attn=0.5*spow*sr/br*10.^(-ebn0/10);
	attn=sqrt(attn);  
     


	
    [ich3,qch3]= comb(ich2,qch2,attn);
	[ich4,qch4]= compconv(ich3,qch3,xh2);

    syncpoint=irfn*IPOINT+1;
    ich5=ich4(syncpoint:IPOINT:length(ich4));
    qch5=qch4(syncpoint:IPOINT:length(qch4));
        


    [demodata]=m2(ich5,qch5,1,nd,ml);


    noe2=sum(abs(data1-demodata));  
	nod2=length(data1); 
	noe=noe+noe2;
	nod=nod+nod2;

	fprintf('%d\t%e\n',iii,noe2/nod2);  


%******************** end of file ***************************

