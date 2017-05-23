str=urlread('https://www.navcen.uscg.gov/?pageName=currentAlmanac&format=yuma');
filename='current213.alm';
urlwrite(filename,url);