function main_plot_function
            global FigH;
            FigH    = figure;
            global ButtonH;
            ButtonH = uicontrol(FigH, 'Style', 'PushButton', 'String', 'PAUSE', 'Callback', @ButtonPaused, 'UserData', 0);
            ButtonH.UserData
            pause(1);
            plotter(ButtonH);
end
        
        function ButtonPaused(ButtonH, EventData)
            fprintf("PAUSING!!!..");
            pause(0.2);    
            global ButtonH;
            global Pause;
            global Run;
            if(ButtonH.UserData == 1)
                ButtonH.UserData=0;
                write(Run,1);
                plotter(ButtonH);
            else
                ButtonH.UserData=1;
                write(Pause,1);
            end
            fprintf("BUTTON PAUSED!!")
            
        end
        function plotter(ButtonH)
        global Tco;global Tho;
            t=0:0.01:9999;
            hold on;
            i=0;
            global Tci_val;global Thi_val;
            ylim([Tci_val-10 Thi_val+10]);
            %xlim([0 inf]);
             while(1)
                if(ButtonH.UserData)
                    %fprintf("BUTTON PRESSED!!")
                    return;
                end
                i=i+1;
                Tco_val(1,i)=read(Tco,'device').Value;
                Tho_val(1,i)=read(Tho,'device').Value;
                %TimeVal=read(Time,'device').Value;
                plot(t(1:i),Tco_val(1:i),'b');
                plot(t(1:i),Tho_val(1:i),'r');
                legend('Tco','Tho')
                pause(0.2);
            end
        end