tic 
clc ;
clear all ;
parameters ;
for i=1:10
    A=i ;
    sim('activeSuspension') ;
    obj = obj.Data(end) ;
    disp(obj) ;
end

toc
