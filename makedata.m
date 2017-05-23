clear;
hyderabad;
lel=clock;
N = 3600*24*1 ;
Steps = 144;
desired_times = 0:N/Steps:(N-N/Steps) ;
times = desired_times ;
% times=times/3600;
[~,~,~,~,GPSW,~,~,~,~]=gpsdate(lel(1),lel(2),lel(3),lel(4),lel(5),lel(6));
st=['week:                        ' num2str(mod(GPSW,1024))];


t0=172800;
t=0:(6*24)-1;
t=t*600;
t=t+t0;
clear t0;
out={};
i=1;
count=0;


fid = fopen('t235.alm');
if(fid==-1)
    disp('error bro');
else    
    current_line=fgetl(fid);
    while ischar(current_line) 
        out{i}=current_line;
        if(strcmp(current_line,st))
            count=count+1;
        end
        current_line=fgetl(fid);
        i=i+1;
    end
    fclose(fid);
    health=cell(1,count);
    ecc=cell(1,count);
    time=cell(1,count);
    orb_inc=cell(1,count);
    right_ascens_rate=cell(1,count);
    peri=cell(1,count);
    mean_anomaly=cell(1,count);
    af0=cell(1,count);
    af1=cell(1,count);
    right_asc=cell(1,count);
    semi=cell(1,count);

    for k=1:count
        health{k}=out{3+(k-1)*15};
        ecc{k}=out{4+(k-1)*15};
        time{k}=out{5+(k-1)*15};
        orb_inc{k}=out{6+(k-1)*15};
        right_ascens_rate{k}=out{7+(k-1)*15};
        peri{k}=out{10+(k-1)*15};
        mean_anomaly{k}=out{11+(k-1)*15};
        af0{k}=out{12+(k-1)*15};
        af1{k}=out{13+(k-1)*15};
        semi{k}=out{8+(k-1)*15};
        right_asc{k}=out{9+(k-1)*15};
    end

    health1= eliminate('Health:                     ',health,count);
    ecc1=eliminate('Eccentricity:               ',ecc,count);
    time1=eliminate('Time of Applicability(s):  ',time,count);
    orb_inc1=eliminate('Orbital Inclination(rad):   ',orb_inc,count);
    right_ascens_rate1=eliminate('Rate of Right Ascen(r/s):  ',right_ascens_rate,count);
    peri1=eliminate('Argument of Perigee(rad):  ',peri,count);
    mean_anomaly1=eliminate('Mean Anom(rad):            ',mean_anomaly,count);
    af01=eliminate('Af0(s):                    ',af0,count);
    af11=eliminate('Af1(s/s):                  ',af1,count);
    right_asc1=eliminate('Right Ascen at Week(rad):  ',right_asc,count);
    semi1=eliminate('SQRT(A)  (m 1/2):           ',semi,count);
    clear('health','semi','peri','af0','af1','mean_anomaly','right_ascens_rate','orb_inc','time','ecc','right_asc');
end