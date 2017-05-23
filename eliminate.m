function A = eliminate(str,bob,count);  
    B=zeros(1,count);
    A=zeros(1,count);
    for i = 1:count
        k=bob{i};
        k=strrep(k,str,'');
        B(i)=str2num(k);
    end
    A=B;
end