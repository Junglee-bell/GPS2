Ele1=Ele;
figure;
Ele1=Ele.*double((Ele>0));
plot(times,Ele1(1,:));
ylabel('Angle of inclination');
xlabel('Time in hrs');
xlim([0 24]);
K=zeros(31,96);
K=Ele1>10;
K=double(K);
% plot(times,K,'.-');
% set(gca,'ylim',[-5,5])
l=zeros(1,96);
l=sum(K);
figure;
bar(l);
xlabel('time interval of 15 minutes');
