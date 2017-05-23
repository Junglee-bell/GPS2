function [E,Azi]=Calc_Azimuth_Elevation(play,t);
    E=zeros(31,96);
    Azi=zeros(31,96);
    for i = 1 :31
        Pos_SV=play{1,i};
        for j = 1:length(t)
            R=Pos_SV(:,j)-Pos_Rcv;               %vector from Reciever to Satellite
            GPS = ECEF2GPS(Pos_Rcv);        %Lattitude and Longitude of Reciever
            Lat=GPS(1);Lon=GPS(2);
            ENU=XYZ2ENU(R,Lat,Lon);
            Elevation=asin(ENU(3)/norm(ENU));
            Azimuth=atan2(ENU(1)/norm(ENU),ENU(2)/norm(ENU));
            E(i,j)=Elevation;
            Azi(i,j)=Azimuth;
        end    
    end
end    