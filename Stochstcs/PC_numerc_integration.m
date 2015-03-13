function [x,fs,mm,ss]=PC_numerc_integration(distype,m,s,n)

%m=-3;
%s=2;

if strcmp(distype,'lognorm')
    mu = log((m.^2)./sqrt(s^2+m.^2));
    sigma = sqrt(log(s^2./(m.^2)+1));
    %[M,V]= lognstat(mu,sigma)
else
    mu = m;
    sigma = s;
end

%if strcmp(distype,'norm')
    %Last ortho-norm polynomials Hn roots
    %b0 Hs coeficients
switch (n)
    
    case 1
    xs =0;
    fs =1;
    
    case 2
    xs =[ -1
           1];
    fs =[  0.5   0.5]';

    case 3
    xs =[              0
       1.732050666147553
      -1.732050666147553];
    fs =[  0.666666612233567   0.166666693883217   0.166666693883217]';

    case 4
    xs =[-2.334414006316253
       2.334414006316253
      -0.741963791110370
       0.741963791110370];
    fs =   [0.045875863101401   0.045875863101401   0.454124136898599...
           0.454124136898599]';

    case 5
    xs =[              0
      -2.856970013872805
       2.856970013872805
      -1.355626179974266
       1.355626179974266];
    fs =[  1.6/3      0.011257411327721   0.011257411327721...
       0.222075922005613   0.222075922005613]';

    case 6
    xs =[ -3.324257433552117; 3.324257433552115; -1.889175877753711;...
           1.889175877753711; -0.616706590192594; 0.616706590192594];
       
    fs =[2.555784402056283e-3   2.555784402056283e-3   88.61574604191455e-3 ...
       88.61574604191455e-3   0.408828469556029   0.408828469556029]';
   
    case 7
    xs =[                   0  -3.750439717725747   3.750439717725739  -2.366759410734539...
  -1.154405394739969   2.366759410734539   1.154405394739968]';

fs =[0.457142857142858   0.548268855972256e-3   0.548268855972256e-3   30.757123967586537e-3...
  0.240123178605012   30.757123967586537e-3   0.240123178605012]';


    case 8
    xs =[-4.144547186125901   4.144547186125905  -2.802485861287534   2.802485861287537...
 -1.636519042435110   1.636519042435113  -0.539079811351375   0.539079811351375]';

fs =[0.112614538375327e-3   0.112614538375327e-3   9.635220120788587e-3   9.635220120788587e-3...
  0.117239907661758   0.117239907661759   0.373012257679079   0.373012257679077]';

    case 9
    xs =[ 0,  -4.512745863399779,   4.512745863399779,...
        -3.205429002856465, 3.205429002856465, -2.076847978677834,...
          -1.023255663789131,   2.076847978677834,   1.023255663789131]';

fs =[   0.406349206349205, 2.2345844007746e-5, 2.2345844007746e-5,...
   2.789141321231786e-3,   2.789141321231731e-3,  49.916406765217772e-3,...
   0.244097502894940, 49.916406765217772e-3,0.244097502894940]';

    otherwise
        disp('VER PC_num_integr N > 9')
    xs =[ 0,  -4.512745863399779,   4.512745863399779,...
        -3.205429002856465, 3.205429002856465, -2.076847978677834,...
          -1.023255663789131,   2.076847978677834,   1.023255663789131]';

fs =[   0.406349206349205, 2.2345844007746e-5, 2.2345844007746e-5,...
   2.789141321231786e-3,   2.789141321231731e-3,  49.916406765217772e-3,...
   0.244097502894940, 49.916406765217772e-3,0.244097502894940]';
end

x=xs*sigma+mu;
if strcmp(distype,'lognorm')
    x=exp(x);
end

%pc_std=(w*Zpc.^2-pc_mean^2)^.5
mm=sum(x.*fs);
ss=(sum((x.^2).*fs) - mm^2)^.5;

