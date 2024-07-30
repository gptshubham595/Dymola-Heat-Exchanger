classdef DIAGRAMVIEW_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        DEFAULTVIEWTab                  matlab.ui.container.Tab
        Image                           matlab.ui.control.Image
        Image2                          matlab.ui.control.Image
        Image3                          matlab.ui.control.Image
        Image3_2                        matlab.ui.control.Image
        Image2_2                        matlab.ui.control.Image
        ColdTemperatureINEditFieldLabel_2  matlab.ui.control.Label
        ColdTemperatureINEditFieldLabel_3  matlab.ui.control.Label
        HotTemperatureINEditFieldLabel  matlab.ui.control.Label
        HotTemperatureINEditField       matlab.ui.control.NumericEditField
        ColdTemperatureINEditFieldLabel  matlab.ui.control.Label
        ColdTemperatureINEditField      matlab.ui.control.NumericEditField
        DYMOLASIMULATORLabel            matlab.ui.control.Label
        PLOTANDSIMULATEButton_2         matlab.ui.control.Button
        ResumeButton_2                  matlab.ui.control.Button
        PauseButton_2                   matlab.ui.control.Button
        StopButton_2                    matlab.ui.control.Button
        TimeEditFieldLabel              matlab.ui.control.Label
        TimeEditField                   matlab.ui.control.NumericEditField
        INITIALIZEDEFAILTSButton        matlab.ui.control.Button
        CHNGButton_11                   matlab.ui.control.Button
        FeedColdINEditFieldLabel        matlab.ui.control.Label
        FeedColdINEditField             matlab.ui.control.NumericEditField
        FeedHOTINEditFieldLabel         matlab.ui.control.Label
        FeedHOTINEditField              matlab.ui.control.NumericEditField
        CHNGButton_12                   matlab.ui.control.Button
        CHNGButton_13                   matlab.ui.control.Button
        CHNGButton_14                   matlab.ui.control.Button
        THEORITICALVIEWTab              matlab.ui.container.Tab
        CHNGButton                      matlab.ui.control.Button
        FeedColdFciFcoEditFieldLabel    matlab.ui.control.Label
        FeedColdFciFcoEditField         matlab.ui.control.NumericEditField
        INITIALIZEButton                matlab.ui.control.Button
        PLOTANDSIMULATEButton           matlab.ui.control.Button
        ResumeButton                    matlab.ui.control.Button
        PauseButton                     matlab.ui.control.Button
        StopButton                      matlab.ui.control.Button
        TimeEditField_2Label            matlab.ui.control.Label
        TimeEditField_2                 matlab.ui.control.NumericEditField
        CHNGButton_2                    matlab.ui.control.Button
        FeedHotFhiFhoLabel              matlab.ui.control.Label
        FeedHotFhiFhoEditField          matlab.ui.control.NumericEditField
        CHNGButton_3                    matlab.ui.control.Button
        TemperatureColdInTciEditFieldLabel  matlab.ui.control.Label
        TemperatureColdInTciEditField   matlab.ui.control.NumericEditField
        CHNGButton_4                    matlab.ui.control.Button
        TemperatureHotInThiEditFieldLabel  matlab.ui.control.Label
        TemperatureHotInThiEditField    matlab.ui.control.NumericEditField
        CHNGButton_5                    matlab.ui.control.Button
        CHNGButton_6                    matlab.ui.control.Button
        CHNGButton_7                    matlab.ui.control.Button
        CHNGButton_8                    matlab.ui.control.Button
        AreaAEditFieldLabel             matlab.ui.control.Label
        AreaAEditField                  matlab.ui.control.NumericEditField
        VolumeVEditFieldLabel           matlab.ui.control.Label
        VolumeVEditField                matlab.ui.control.NumericEditField
        DensityEditFieldLabel           matlab.ui.control.Label
        DensityEditField                matlab.ui.control.NumericEditField
        SpecificHeatCpEditFieldLabel    matlab.ui.control.Label
        SpecificHeatCpEditField         matlab.ui.control.NumericEditField
        CHNGButton_9                    matlab.ui.control.Button
        HeatTransferCoeffUEditFieldLabel  matlab.ui.control.Label
        HeatTransferCoeffUEditField     matlab.ui.control.NumericEditField
        DYMOLASIMULATORLabel_2          matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: INITIALIZEButton
        function INITIALIZE_ALL_VALUES(app, event)
             %====================================VARIABLE VALUE===============================
            global area_val;global volume_val;global density_val;global cp_val;global Fci_val;
            global Fhi_val;global Tci_val;global Thi_val;global Tho_val;global U_val;
            Fci_val = app.FeedColdFciFcoEditField.Value;
            Fhi_val = app.FeedHotFhiFhoEditField.Value;
            Tci_val= app.TemperatureColdInTciEditField.Value;
            Thi_val= app.TemperatureHotInThiEditField.Value;
            U_val = app.HeatTransferCoeffUEditField.Value;
            cp_val=app.SpecificHeatCpEditField.Value;
            density_val=app.DensityEditField.Value;
            volume_val=app.VolumeVEditField.Value;
            area_val=app.AreaAEditField.Value;
            %=================================================================================
            
            %====================================CONNECTED====================================
            global hostInfo ;
            hostInfo = opcserverinfo('localhost');
            global da;
            da = opcda('localhost','Dymosim.OPCServer.1');
            connect(da);
            pause(2);
            %=================================================================================
            
            %====================================INITIAL VARIABLE=============================
            global grp; global grp2;global Initialize;global Run;global Status;global Stop;global Pause;
            grp=addgroup(da,'Demo');
            grp2=addgroup(da,'Demo2');
            
            Initialize=additem(grp2,{'SimControl.Initialize'});
            Run=additem(grp2,{'SimControl.Run'});
            Status=additem(grp2,{'SimControl.Status'});
            Stop=additem(grp2,{'SimControl.Stop'});
            Pause=additem(grp2,{'SimControl.Pause'});
            %=================================================================================
            write(Initialize,1);
            pause(2);
            
            global Tco; global area;global volume;global density;global cp;global Fci;
            global Fhi;global Tci;global Thi;global Tho;global U;
            Tco=additem(grp,{'ModelVariables.Tco'});
            area=additem(grp,{'ModelVariables.Area'});
            volume=additem(grp,{'ModelVariables.Volume'});
            density=additem(grp,{'ModelVariables.Density'});
            cp=additem(grp,{'ModelVariables.Cp'});
            U=additem(grp,{'ModelVariables.U'});
            Fci=additem(grp,{'ModelVariables.Fci'});
            Fhi=additem(grp,{'ModelVariables.Fhi'});
            Tci=additem(grp,{'ModelVariables.Tci'});
            Thi=additem(grp,{'ModelVariables.Thi'});
            Tho=additem(grp,{'ModelVariables.Tho'});
            
            write(area,area_val);
            write(volume,volume_val);
            write(density,density_val);
            write(cp,cp_val);
            write(U,U_val);
            write(Fci,Fci_val);
            write(Fhi,Fhi_val);
            write(Tci,Tci_val);
            write(Thi,Thi_val);
            %====================================INITIALIZATION COMPLETE===============================
            
        end

        % Button pushed function: ResumeButton, ResumeButton_2
        function resume_experiment(app, event)
            global Run;
            write(Run,1);
        end

        % Button pushed function: PauseButton, PauseButton_2
        function pause_experiment(app, event)
            global Pause;
            write(Pause,1);
        end

        % Button pushed function: StopButton, StopButton_2
        function stop_experiment(app, event)
            global Stop;
            write(Stop,1);
        end

        % Button pushed function: CHNGButton
        function chng_feed_cold(app, event)
                PlotLoopPauser();
                global Fci;
                global Fci_val;
                Fci_val = app.FeedColdFciFcoEditField.Value;
                write(Fci,Fci_val);
                PlotLoopResumer();
        end

        % Button pushed function: CHNGButton_2
        function chng_feed_hot(app, event)
            PlotLoopPauser();
            global Fhi;
            global Fhi_val;
            Fhi_val = app.FeedHotFhiFhoEditField.Value;
            write(Fhi,Fhi_val);
            PlotLoopResumer();
        end

        % Button pushed function: CHNGButton_4
        function chng_thot_in(app, event)
            PlotLoopPauser();
            global Thi_val;
            global Thi;
            Thi_val= app.TemperatureHotInThiEditField.Value;
            write(Thi,Thi_val);
            PlotLoopResumer();
        end

        % Button pushed function: CHNGButton_3
        function chng_tcold_in(app, event)
            PlotLoopPauser();
            global Tci_val;
            global Tci;
            Tci_val= app.TemperatureColdInTciEditField.Value;
            write(Tci,Tci_val);
            PlotLoopResumer();
        end

        % Button pushed function: CHNGButton_8
        function chng_cp(app, event)
            PlotLoopPauser();
            global cp;
            global cp_val;
            cp_val= app.SpecificHeatCpEditField.Value;
            write(cp,cp_val);
            PlotLoopResumer();
        end

        % Button pushed function: CHNGButton_7
        function chng_density(app, event)
            PlotLoopPauser();
            global density;
            global density_val;
            density_val= app.DensityEditField.Value;
            write(density,density_val);
            PlotLoopResumer();
        end

        % Button pushed function: CHNGButton_6
        function chng_volume(app, event)
            PlotLoopPauser();
            global volume_val;
            global volume;
            volume_val= app.VolumeVEditField.Value;
            write(volume,volume_val);
            PlotLoopResumer();
        end

        % Button pushed function: CHNGButton_5
        function chng_area(app, event)
            PlotLoopPauser();
            global area_val;
            global area;
            area_val= app.AreaAEditField.Value;
            write(area,area_val);
            PlotLoopResumer();
        end

        % Button pushed function: CHNGButton_9
        function chng_u(app, event)
            PlotLoopPauser(); 
            global U_val;
            global U;
            U_val= app.HeatTransferCoeffUEditField.Value;
            write(U,U_val);
            PlotLoopResumer();
        end

        % Button pushed function: PLOTANDSIMULATEButton, 
        % PLOTANDSIMULATEButton_2
        function PLOT_AND_SIM_BUTTON(app, event)
            global Tco;global Tho;global Time;
            global hostInfo ;global da;
            global grp; global grp2;global Initialize;global Run;global Status;global Stop;global Pause;
            
            write(Run,1);
            %pause(0.2);
            global area_val;global volume_val;global density_val;global cp_val;global Fci_val;
            global Fhi_val;global Tci_val;global Thi_val;global Tho_val;global U_val;global Tco_val;
            
            
            main_plot_function();
            
        end

        % Button pushed function: INITIALIZEDEFAILTSButton
        function INITIALIZE_defaults(app, event)
              %====================================VARIABLE VALUE===============================
            global area_val;global volume_val;global density_val;global cp_val;global Fci_val;
            global Fhi_val;global Tci_val;global Thi_val;global Tho_val;global U_val;
            global Fci_val_def;global Fhi_val_def;global Tci_val_def;global Thi_val_def;
            
            Fci_val_def = app.FeedColdINEditField.Value;
            Fhi_val_def = app.FeedHOTINEditField.Value;
            Thi_val_def = app.HotTemperatureINEditField.Value;
            Tci_val_def = app.ColdTemperatureINEditField.Value;
            
            Fci_val = app.FeedColdFciFcoEditField.Value;
            Fhi_val = app.FeedHotFhiFhoEditField.Value;
            Tci_val= app.TemperatureColdInTciEditField.Value;
            Thi_val= app.TemperatureHotInThiEditField.Value;
            U_val = app.HeatTransferCoeffUEditField.Value;
            cp_val=app.SpecificHeatCpEditField.Value;
            density_val=app.DensityEditField.Value;
            volume_val=app.VolumeVEditField.Value;
            area_val=app.AreaAEditField.Value;
            %=================================================================================
            
            %====================================CONNECTED====================================
            global hostInfo ;
            hostInfo = opcserverinfo('localhost');
            global da;
            da = opcda('localhost','Dymosim.OPCServer.1');
            connect(da);
            pause(2);
            %=================================================================================
            
            %====================================INITIAL VARIABLE=============================
            global grp; global grp2;global Initialize;global Run;global Status;global Stop;global Pause;
            grp=addgroup(da,'Demo');
            grp2=addgroup(da,'Demo2');
            
            Initialize=additem(grp2,{'SimControl.Initialize'});
            Run=additem(grp2,{'SimControl.Run'});
            Status=additem(grp2,{'SimControl.Status'});
            Stop=additem(grp2,{'SimControl.Stop'});
            Pause=additem(grp2,{'SimControl.Pause'});
            %=================================================================================
            write(Initialize,1);
            pause(2);
            
            global Tco; global area;global volume;global density;global cp;global Fci;
            global Fhi;global Tci;global Thi;global Tho;global U;
            Tco=additem(grp,{'ModelVariables.Tco'});
            area=additem(grp,{'ModelVariables.Area'});
            volume=additem(grp,{'ModelVariables.Volume'});
            density=additem(grp,{'ModelVariables.Density'});
            cp=additem(grp,{'ModelVariables.Cp'});
            U=additem(grp,{'ModelVariables.U'});
            Fci=additem(grp,{'ModelVariables.Fci'});
            Fhi=additem(grp,{'ModelVariables.Fhi'});
            Tci=additem(grp,{'ModelVariables.Tci'});
            Thi=additem(grp,{'ModelVariables.Thi'});
            Tho=additem(grp,{'ModelVariables.Tho'});
            
            %AS IT WILL LOAD DEFAULTS
            write(area,200);
            write(volume,5);
            write(density,10);
            write(cp,150);
            write(U,2000);
            write(Fci,Fci_val_def);
            write(Fhi,Fhi_val_def);
            write(Tci,Tci_val_def);
            write(Thi,Thi_val_def);
            %====================================INITIALIZATION COMPLETE===============================
            
        end

        % Callback function
        function plot_and_sim_default(app, event)
            
        end

        % Button pushed function: CHNGButton_13
        function chng_default_HotTempIN(app, event)
            PlotLoopPauser();
            global Thi_val_def;
            global Thi;
            Thi_val_def= app.HotTemperatureINEditField.Value;
            write(Thi,Thi_val_def);
            PlotLoopResumer();
        end

        % Button pushed function: CHNGButton_11
        function chng_tcold_in_def(app, event)
            PlotLoopPauser();
            global Tci_val_def;
            global Tci;
            Tci_val_def= app.ColdTemperatureINEditField.Value;
            write(Tci,Tci_val_def);
            PlotLoopResumer();
        end

        % Button pushed function: CHNGButton_14
        function chng_default_FeedHotIN(app, event)
            PlotLoopPauser();
            global Fhi_val_def;
            global Fhi;
            Fhi_val_def= app.FeedHOTINEditField.Value;
            write(Fhi,Fhi_val_def);
            PlotLoopResumer();            
        end

        % Button pushed function: CHNGButton_12
        function chng_default_FeedColdIN(app, event)
            PlotLoopPauser();
            global Fci_val_def;
            global Fci;
            Fci_val_def= app.FeedColdINEditField.Value;
            write(Fci,Fci_val_def);
            PlotLoopResumer();
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 826 624];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 826 624];

            % Create DEFAULTVIEWTab
            app.DEFAULTVIEWTab = uitab(app.TabGroup);
            app.DEFAULTVIEWTab.Title = 'DEFAULT VIEW';

            % Create Image
            app.Image = uiimage(app.DEFAULTVIEWTab);
            app.Image.Position = [158 114 513 385];
            app.Image.ImageSource = 'Untitled1.png';

            % Create Image2
            app.Image2 = uiimage(app.DEFAULTVIEWTab);
            app.Image2.Position = [616 274 77 71];
            app.Image2.ImageSource = 'arr right.png';

            % Create Image3
            app.Image3 = uiimage(app.DEFAULTVIEWTab);
            app.Image3.Position = [527 46 74 61];
            app.Image3.ImageSource = 'arr down.png';

            % Create Image3_2
            app.Image3_2 = uiimage(app.DEFAULTVIEWTab);
            app.Image3_2.Position = [229 503 74 61];
            app.Image3_2.ImageSource = 'arr down.png';

            % Create Image2_2
            app.Image2_2 = uiimage(app.DEFAULTVIEWTab);
            app.Image2_2.Position = [143 277 77 71];
            app.Image2_2.ImageSource = 'arr right.png';

            % Create ColdTemperatureINEditFieldLabel_2
            app.ColdTemperatureINEditFieldLabel_2 = uilabel(app.DEFAULTVIEWTab);
            app.ColdTemperatureINEditFieldLabel_2.HorizontalAlignment = 'right';
            app.ColdTemperatureINEditFieldLabel_2.Position = [602 323 130 22];
            app.ColdTemperatureINEditFieldLabel_2.Text = 'Cold Temperature OUT';

            % Create ColdTemperatureINEditFieldLabel_3
            app.ColdTemperatureINEditFieldLabel_3 = uilabel(app.DEFAULTVIEWTab);
            app.ColdTemperatureINEditFieldLabel_3.HorizontalAlignment = 'right';
            app.ColdTemperatureINEditFieldLabel_3.Position = [500 25 123 22];
            app.ColdTemperatureINEditFieldLabel_3.Text = 'Hot Temperature OUT';

            % Create HotTemperatureINEditFieldLabel
            app.HotTemperatureINEditFieldLabel = uilabel(app.DEFAULTVIEWTab);
            app.HotTemperatureINEditFieldLabel.HorizontalAlignment = 'right';
            app.HotTemperatureINEditFieldLabel.Position = [295 527 110 22];
            app.HotTemperatureINEditFieldLabel.Text = 'Hot Temperature IN';

            % Create HotTemperatureINEditField
            app.HotTemperatureINEditField = uieditfield(app.DEFAULTVIEWTab, 'numeric');
            app.HotTemperatureINEditField.Limits = [0 Inf];
            app.HotTemperatureINEditField.Position = [411 527 100 22];

            % Create ColdTemperatureINEditFieldLabel
            app.ColdTemperatureINEditFieldLabel = uilabel(app.DEFAULTVIEWTab);
            app.ColdTemperatureINEditFieldLabel.FontSize = 11;
            app.ColdTemperatureINEditFieldLabel.Position = [7 352 122 22];
            app.ColdTemperatureINEditFieldLabel.Text = 'Cold Temperature IN';

            % Create ColdTemperatureINEditField
            app.ColdTemperatureINEditField = uieditfield(app.DEFAULTVIEWTab, 'numeric');
            app.ColdTemperatureINEditField.Limits = [0 Inf];
            app.ColdTemperatureINEditField.Position = [114 352 58 22];

            % Create DYMOLASIMULATORLabel
            app.DYMOLASIMULATORLabel = uilabel(app.DEFAULTVIEWTab);
            app.DYMOLASIMULATORLabel.HorizontalAlignment = 'center';
            app.DYMOLASIMULATORLabel.FontWeight = 'bold';
            app.DYMOLASIMULATORLabel.Position = [379 563 132 22];
            app.DYMOLASIMULATORLabel.Text = 'DYMOLA SIMULATOR';

            % Create PLOTANDSIMULATEButton_2
            app.PLOTANDSIMULATEButton_2 = uibutton(app.DEFAULTVIEWTab, 'push');
            app.PLOTANDSIMULATEButton_2.ButtonPushedFcn = createCallbackFcn(app, @PLOT_AND_SIM_BUTTON, true);
            app.PLOTANDSIMULATEButton_2.Position = [169 106 137 23];
            app.PLOTANDSIMULATEButton_2.Text = 'PLOT AND SIMULATE';

            % Create ResumeButton_2
            app.ResumeButton_2 = uibutton(app.DEFAULTVIEWTab, 'push');
            app.ResumeButton_2.ButtonPushedFcn = createCallbackFcn(app, @resume_experiment, true);
            app.ResumeButton_2.Position = [26 60 100 23];
            app.ResumeButton_2.Text = 'Resume';

            % Create PauseButton_2
            app.PauseButton_2 = uibutton(app.DEFAULTVIEWTab, 'push');
            app.PauseButton_2.ButtonPushedFcn = createCallbackFcn(app, @pause_experiment, true);
            app.PauseButton_2.Position = [26 17 100 23];
            app.PauseButton_2.Text = 'Pause';

            % Create StopButton_2
            app.StopButton_2 = uibutton(app.DEFAULTVIEWTab, 'push');
            app.StopButton_2.ButtonPushedFcn = createCallbackFcn(app, @stop_experiment, true);
            app.StopButton_2.Position = [165 17 131 23];
            app.StopButton_2.Text = 'Stop';

            % Create TimeEditFieldLabel
            app.TimeEditFieldLabel = uilabel(app.DEFAULTVIEWTab);
            app.TimeEditFieldLabel.HorizontalAlignment = 'right';
            app.TimeEditFieldLabel.Position = [165 65 31 22];
            app.TimeEditFieldLabel.Text = 'Time';

            % Create TimeEditField
            app.TimeEditField = uieditfield(app.DEFAULTVIEWTab, 'numeric');
            app.TimeEditField.Limits = [0 Inf];
            app.TimeEditField.Position = [211 65 85 22];

            % Create INITIALIZEDEFAILTSButton
            app.INITIALIZEDEFAILTSButton = uibutton(app.DEFAULTVIEWTab, 'push');
            app.INITIALIZEDEFAILTSButton.ButtonPushedFcn = createCallbackFcn(app, @INITIALIZE_defaults, true);
            app.INITIALIZEDEFAILTSButton.Position = [24 106 135 22];
            app.INITIALIZEDEFAILTSButton.Text = 'INITIALIZE DEFAILTS';

            % Create CHNGButton_11
            app.CHNGButton_11 = uibutton(app.DEFAULTVIEWTab, 'push');
            app.CHNGButton_11.ButtonPushedFcn = createCallbackFcn(app, @chng_tcold_in_def, true);
            app.CHNGButton_11.Position = [175 350 55 23];
            app.CHNGButton_11.Text = 'CHNG';

            % Create FeedColdINEditFieldLabel
            app.FeedColdINEditFieldLabel = uilabel(app.DEFAULTVIEWTab);
            app.FeedColdINEditFieldLabel.HorizontalAlignment = 'right';
            app.FeedColdINEditFieldLabel.Position = [13 248 90 22];
            app.FeedColdINEditFieldLabel.Text = 'Feed Cold IN';

            % Create FeedColdINEditField
            app.FeedColdINEditField = uieditfield(app.DEFAULTVIEWTab, 'numeric');
            app.FeedColdINEditField.Limits = [0 Inf];
            app.FeedColdINEditField.Position = [110 248 60 22];

            % Create FeedHOTINEditFieldLabel
            app.FeedHOTINEditFieldLabel = uilabel(app.DEFAULTVIEWTab);
            app.FeedHOTINEditFieldLabel.HorizontalAlignment = 'right';
            app.FeedHOTINEditFieldLabel.Position = [294 482 90 22];
            app.FeedHOTINEditFieldLabel.Text = 'Feed HOT IN';

            % Create FeedHOTINEditField
            app.FeedHOTINEditField = uieditfield(app.DEFAULTVIEWTab, 'numeric');
            app.FeedHOTINEditField.Limits = [0 Inf];
            app.FeedHOTINEditField.Position = [412 482 100 22];

            % Create CHNGButton_12
            app.CHNGButton_12 = uibutton(app.DEFAULTVIEWTab, 'push');
            app.CHNGButton_12.ButtonPushedFcn = createCallbackFcn(app, @chng_default_FeedColdIN, true);
            app.CHNGButton_12.Position = [176 248 55 23];
            app.CHNGButton_12.Text = 'CHNG';

            % Create CHNGButton_13
            app.CHNGButton_13 = uibutton(app.DEFAULTVIEWTab, 'push');
            app.CHNGButton_13.ButtonPushedFcn = createCallbackFcn(app, @chng_default_HotTempIN, true);
            app.CHNGButton_13.Position = [537 527 55 23];
            app.CHNGButton_13.Text = 'CHNG';

            % Create CHNGButton_14
            app.CHNGButton_14 = uibutton(app.DEFAULTVIEWTab, 'push');
            app.CHNGButton_14.ButtonPushedFcn = createCallbackFcn(app, @chng_default_FeedHotIN, true);
            app.CHNGButton_14.Position = [535 479 55 23];
            app.CHNGButton_14.Text = 'CHNG';

            % Create THEORITICALVIEWTab
            app.THEORITICALVIEWTab = uitab(app.TabGroup);
            app.THEORITICALVIEWTab.Title = 'THEORITICAL VIEW';

            % Create CHNGButton
            app.CHNGButton = uibutton(app.THEORITICALVIEWTab, 'push');
            app.CHNGButton.ButtonPushedFcn = createCallbackFcn(app, @chng_feed_cold, true);
            app.CHNGButton.Position = [269 479 68 23];
            app.CHNGButton.Text = 'CHNG';

            % Create FeedColdFciFcoEditFieldLabel
            app.FeedColdFciFcoEditFieldLabel = uilabel(app.THEORITICALVIEWTab);
            app.FeedColdFciFcoEditFieldLabel.HorizontalAlignment = 'right';
            app.FeedColdFciFcoEditFieldLabel.Position = [58 480 114 22];
            app.FeedColdFciFcoEditFieldLabel.Text = 'Feed Cold Fci = Fco';

            % Create FeedColdFciFcoEditField
            app.FeedColdFciFcoEditField = uieditfield(app.THEORITICALVIEWTab, 'numeric');
            app.FeedColdFciFcoEditField.Limits = [0 Inf];
            app.FeedColdFciFcoEditField.Position = [182 479 72 22];

            % Create INITIALIZEButton
            app.INITIALIZEButton = uibutton(app.THEORITICALVIEWTab, 'push');
            app.INITIALIZEButton.ButtonPushedFcn = createCallbackFcn(app, @INITIALIZE_ALL_VALUES, true);
            app.INITIALIZEButton.Position = [138 146 100 23];
            app.INITIALIZEButton.Text = 'INITIALIZE';

            % Create PLOTANDSIMULATEButton
            app.PLOTANDSIMULATEButton = uibutton(app.THEORITICALVIEWTab, 'push');
            app.PLOTANDSIMULATEButton.ButtonPushedFcn = createCallbackFcn(app, @PLOT_AND_SIM_BUTTON, true);
            app.PLOTANDSIMULATEButton.Position = [251 145 137 23];
            app.PLOTANDSIMULATEButton.Text = 'PLOT AND SIMULATE';

            % Create ResumeButton
            app.ResumeButton = uibutton(app.THEORITICALVIEWTab, 'push');
            app.ResumeButton.ButtonPushedFcn = createCallbackFcn(app, @resume_experiment, true);
            app.ResumeButton.Position = [449 171 100 23];
            app.ResumeButton.Text = 'Resume';

            % Create PauseButton
            app.PauseButton = uibutton(app.THEORITICALVIEWTab, 'push');
            app.PauseButton.ButtonPushedFcn = createCallbackFcn(app, @pause_experiment, true);
            app.PauseButton.Position = [449 123 100 23];
            app.PauseButton.Text = 'Pause';

            % Create StopButton
            app.StopButton = uibutton(app.THEORITICALVIEWTab, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @stop_experiment, true);
            app.StopButton.Position = [569 125 100 23];
            app.StopButton.Text = 'Stop';

            % Create TimeEditField_2Label
            app.TimeEditField_2Label = uilabel(app.THEORITICALVIEWTab);
            app.TimeEditField_2Label.HorizontalAlignment = 'right';
            app.TimeEditField_2Label.Position = [561 172 31 22];
            app.TimeEditField_2Label.Text = 'Time';

            % Create TimeEditField_2
            app.TimeEditField_2 = uieditfield(app.THEORITICALVIEWTab, 'numeric');
            app.TimeEditField_2.Limits = [0 Inf];
            app.TimeEditField_2.Position = [607 172 62 22];

            % Create CHNGButton_2
            app.CHNGButton_2 = uibutton(app.THEORITICALVIEWTab, 'push');
            app.CHNGButton_2.ButtonPushedFcn = createCallbackFcn(app, @chng_feed_hot, true);
            app.CHNGButton_2.Position = [269 427 68 23];
            app.CHNGButton_2.Text = 'CHNG';

            % Create FeedHotFhiFhoLabel
            app.FeedHotFhiFhoLabel = uilabel(app.THEORITICALVIEWTab);
            app.FeedHotFhiFhoLabel.VerticalAlignment = 'top';
            app.FeedHotFhiFhoLabel.Position = [58 423 114 26];
            app.FeedHotFhiFhoLabel.Text = 'Feed Hot Fhi = Fho';

            % Create FeedHotFhiFhoEditField
            app.FeedHotFhiFhoEditField = uieditfield(app.THEORITICALVIEWTab, 'numeric');
            app.FeedHotFhiFhoEditField.Limits = [0 Inf];
            app.FeedHotFhiFhoEditField.Position = [182 427 72 22];

            % Create CHNGButton_3
            app.CHNGButton_3 = uibutton(app.THEORITICALVIEWTab, 'push');
            app.CHNGButton_3.ButtonPushedFcn = createCallbackFcn(app, @chng_tcold_in, true);
            app.CHNGButton_3.Position = [269 372 68 23];
            app.CHNGButton_3.Text = 'CHNG';

            % Create TemperatureColdInTciEditFieldLabel
            app.TemperatureColdInTciEditFieldLabel = uilabel(app.THEORITICALVIEWTab);
            app.TemperatureColdInTciEditFieldLabel.HorizontalAlignment = 'right';
            app.TemperatureColdInTciEditFieldLabel.Position = [32 373 140 22];
            app.TemperatureColdInTciEditFieldLabel.Text = 'Temperature Cold In (Tci)';

            % Create TemperatureColdInTciEditField
            app.TemperatureColdInTciEditField = uieditfield(app.THEORITICALVIEWTab, 'numeric');
            app.TemperatureColdInTciEditField.Limits = [0 Inf];
            app.TemperatureColdInTciEditField.Position = [182 373 72 22];

            % Create CHNGButton_4
            app.CHNGButton_4 = uibutton(app.THEORITICALVIEWTab, 'push');
            app.CHNGButton_4.ButtonPushedFcn = createCallbackFcn(app, @chng_thot_in, true);
            app.CHNGButton_4.Position = [269 315 68 23];
            app.CHNGButton_4.Text = 'CHNG';

            % Create TemperatureHotInThiEditFieldLabel
            app.TemperatureHotInThiEditFieldLabel = uilabel(app.THEORITICALVIEWTab);
            app.TemperatureHotInThiEditFieldLabel.HorizontalAlignment = 'right';
            app.TemperatureHotInThiEditFieldLabel.Position = [40 316 132 22];
            app.TemperatureHotInThiEditFieldLabel.Text = 'Temperature Hot In(Thi)';

            % Create TemperatureHotInThiEditField
            app.TemperatureHotInThiEditField = uieditfield(app.THEORITICALVIEWTab, 'numeric');
            app.TemperatureHotInThiEditField.Limits = [0 Inf];
            app.TemperatureHotInThiEditField.Position = [182 315 72 22];

            % Create CHNGButton_5
            app.CHNGButton_5 = uibutton(app.THEORITICALVIEWTab, 'push');
            app.CHNGButton_5.ButtonPushedFcn = createCallbackFcn(app, @chng_area, true);
            app.CHNGButton_5.Position = [615 314 68 23];
            app.CHNGButton_5.Text = 'CHNG';

            % Create CHNGButton_6
            app.CHNGButton_6 = uibutton(app.THEORITICALVIEWTab, 'push');
            app.CHNGButton_6.ButtonPushedFcn = createCallbackFcn(app, @chng_volume, true);
            app.CHNGButton_6.Position = [615 371 68 23];
            app.CHNGButton_6.Text = 'CHNG';

            % Create CHNGButton_7
            app.CHNGButton_7 = uibutton(app.THEORITICALVIEWTab, 'push');
            app.CHNGButton_7.ButtonPushedFcn = createCallbackFcn(app, @chng_density, true);
            app.CHNGButton_7.Position = [615 426 68 23];
            app.CHNGButton_7.Text = 'CHNG';

            % Create CHNGButton_8
            app.CHNGButton_8 = uibutton(app.THEORITICALVIEWTab, 'push');
            app.CHNGButton_8.ButtonPushedFcn = createCallbackFcn(app, @chng_cp, true);
            app.CHNGButton_8.Position = [615 478 68 23];
            app.CHNGButton_8.Text = 'CHNG';

            % Create AreaAEditFieldLabel
            app.AreaAEditFieldLabel = uilabel(app.THEORITICALVIEWTab);
            app.AreaAEditFieldLabel.HorizontalAlignment = 'right';
            app.AreaAEditFieldLabel.Position = [471 315 47 22];
            app.AreaAEditFieldLabel.Text = 'Area(A)';

            % Create AreaAEditField
            app.AreaAEditField = uieditfield(app.THEORITICALVIEWTab, 'numeric');
            app.AreaAEditField.Limits = [0 Inf];
            app.AreaAEditField.Position = [527 314 72 22];

            % Create VolumeVEditFieldLabel
            app.VolumeVEditFieldLabel = uilabel(app.THEORITICALVIEWTab);
            app.VolumeVEditFieldLabel.HorizontalAlignment = 'right';
            app.VolumeVEditFieldLabel.Position = [456 372 62 22];
            app.VolumeVEditFieldLabel.Text = 'Volume(V)';

            % Create VolumeVEditField
            app.VolumeVEditField = uieditfield(app.THEORITICALVIEWTab, 'numeric');
            app.VolumeVEditField.Limits = [0 Inf];
            app.VolumeVEditField.Position = [527 373 72 22];

            % Create DensityEditFieldLabel
            app.DensityEditFieldLabel = uilabel(app.THEORITICALVIEWTab);
            app.DensityEditFieldLabel.HorizontalAlignment = 'right';
            app.DensityEditFieldLabel.Position = [456 428 61 22];
            app.DensityEditFieldLabel.Text = 'Density(ÿ)';

            % Create DensityEditField
            app.DensityEditField = uieditfield(app.THEORITICALVIEWTab, 'numeric');
            app.DensityEditField.Limits = [0 Inf];
            app.DensityEditField.Position = [527 427 72 22];

            % Create SpecificHeatCpEditFieldLabel
            app.SpecificHeatCpEditFieldLabel = uilabel(app.THEORITICALVIEWTab);
            app.SpecificHeatCpEditFieldLabel.HorizontalAlignment = 'right';
            app.SpecificHeatCpEditFieldLabel.Position = [419 479 99 22];
            app.SpecificHeatCpEditFieldLabel.Text = 'Specific Heat(Cp)';

            % Create SpecificHeatCpEditField
            app.SpecificHeatCpEditField = uieditfield(app.THEORITICALVIEWTab, 'numeric');
            app.SpecificHeatCpEditField.Limits = [0 Inf];
            app.SpecificHeatCpEditField.Position = [527 478 72 22];

            % Create CHNGButton_9
            app.CHNGButton_9 = uibutton(app.THEORITICALVIEWTab, 'push');
            app.CHNGButton_9.ButtonPushedFcn = createCallbackFcn(app, @chng_u, true);
            app.CHNGButton_9.Position = [615 260 68 23];
            app.CHNGButton_9.Text = 'CHNG';

            % Create HeatTransferCoeffUEditFieldLabel
            app.HeatTransferCoeffUEditFieldLabel = uilabel(app.THEORITICALVIEWTab);
            app.HeatTransferCoeffUEditFieldLabel.HorizontalAlignment = 'right';
            app.HeatTransferCoeffUEditFieldLabel.Position = [392 261 126 22];
            app.HeatTransferCoeffUEditFieldLabel.Text = 'Heat Transfer Coeff(U)';

            % Create HeatTransferCoeffUEditField
            app.HeatTransferCoeffUEditField = uieditfield(app.THEORITICALVIEWTab, 'numeric');
            app.HeatTransferCoeffUEditField.Limits = [0 Inf];
            app.HeatTransferCoeffUEditField.Position = [527 261 72 22];

            % Create DYMOLASIMULATORLabel_2
            app.DYMOLASIMULATORLabel_2 = uilabel(app.THEORITICALVIEWTab);
            app.DYMOLASIMULATORLabel_2.FontWeight = 'bold';
            app.DYMOLASIMULATORLabel_2.Position = [340 544 132 22];
            app.DYMOLASIMULATORLabel_2.Text = 'DYMOLA SIMULATOR';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = DIAGRAMVIEW_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end