clear;clc;
pause(1);
clear;
clc;
hostInfo = opcserverinfo('localhost');
da = opcda('localhost','Dymosim.OPCServer.1');
connect(da);
pause(2);
fprintf("CONNECTED\n");

grp=addgroup(da,'Demo');
grp2=addgroup(da,'Demo2');

tScale=additem(grp2,{'SimControl.tScale'});
Time=additem(grp2,{'SimControl.Time'});
Realtime=additem(grp2,{'SimControl.Realtime'});
Initialize=additem(grp2,{'SimControl.Initialize'});
Run=additem(grp2,{'SimControl.Run'});
Status=additem(grp2,{'SimControl.Status'});
Stop=additem(grp2,{'SimControl.Stop'});
Pause=additem(grp2,{'SimControl.Pause'});

tScaleVal=read(tScale,'device').Value;
TimeVal=read(Time,'device').Value;
RealtimeVal=read(Realtime,'device').Value;


RunStatusBefore=read(Run,'device');
StatusBefore=read(Status,'device').Value;
StopStatusBefore=read(Stop,'device');
PauseStatusBefore=read(Pause,'device');

write(Initialize,1);
pause(2);

itmIDs={'ModelVariables.Tco'};
Tco=additem(grp,itmIDs);
area=additem(grp,{'ModelVariables.Area'});
volume=additem(grp,{'ModelVariables.Volume'});
density=additem(grp,{'ModelVariables.Density'});
cp=additem(grp,{'ModelVariables.Cp'});
Fci=additem(grp,{'ModelVariables.Fci'});
Fhi=additem(grp,{'ModelVariables.Fhi'});
Tci=additem(grp,{'ModelVariables.Tci'});
Thi=additem(grp,{'ModelVariables.Thi'});
Tho=additem(grp,{'ModelVariables.Tho'});
logFileName = fullfile(tempdir,'LoggingExample.olf');
grp.LoggingMode = 'disk&memory';
grp.LogFileName = logFileName;
grp.LogToDiskMode = 'overwrite';
%set(grp,'UpdateRate',0.2,'RecordsToAcquire',50);


write(Run,1);

%start(grp);

fprintf("LOGGING\n");


%[logIDs,TcoData]=getdata(grp,'double');
t=0:0.01:9999;
figure
hold on;
%set(gca,'Color',[0 0 0]);
flag=true;
i=0;
t(1)=0;
while(1)
    i=i+1;
    Tco_val(1,i)=read(Tco,'device').Value;
    Tho_val(1,i)=read(Tho,'device').Value;
    TimeVal=read(Time,'device').Value;
    plot(t(1:i),Tco_val(1:i),'b');
    plot(t(1:i),Tho_val(1:i),'r');
    %legend('Tco','Tho')
    if(i==200)
        write(area,300);
    end
   % if(i==250)
    %    write(volume,10);
  %  end
 %   if(i==300)
       % write(density,15);
%    end
    pause(0.01);
end
%wait(grp);


disconnect(da);
delete(da);