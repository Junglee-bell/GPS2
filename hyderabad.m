lat = 17.3850;
lon = 78.4867;
h=505;
wgs84 = wgs84Ellipsoid('meters');
[xh,yh,zh] = geodetic2ecef(wgs84,lat,lon,h);
Pos_Rcv=[xh;yh;zh];