%creat data for plot
function DisplayInfluences(Influences,AlgorithmParams,ProblemParams,DisplayParams)
    
    if ~DisplayParams.PlotInfluences
        return;
    end
    
    if (ProblemParams.NPar ~= 2) && (ProblemParams.NPar ~= 3)
        return;
    end

    if ~any(findall(0)==DisplayParams.InfluencesFigureHandle)
        return;
    end
    
    
    if ProblemParams.NPar == 2
        for ii = 1:numel(Influences)
            plot(DisplayParams.InfluencesAxisHandle,Influences(ii).FolowingPosition(1),Influences(ii).FolowingPosition(2),'p',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',DisplayParams.ColorMatrix(ii,:),...
                'MarkerSize',70*numel(Influences(ii).postesCost)/AlgorithmParams.NumOfAllpostes + 13);
            hold on
            
            plot(DisplayParams.InfluencesAxisHandle,Influences(ii).postesPosition(:,1),Influences(ii).postesPosition(:,2),'ok',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',DisplayParams.ColorMatrix(ii,:),...
                'MarkerSize',8);
        end
        
        xlim([DisplayParams.AxisMargin.Min(1) DisplayParams.AxisMargin.Max(1)]);
        ylim([DisplayParams.AxisMargin.Min(2) DisplayParams.AxisMargin.Max(2)]);
        hold off
    end

    if  ProblemParams.NPar == 3
        figure(1)
        for ii = 1:numel(Influences)
           plot3(DisplayParams.InfluencesAxisHandle,Influences(ii).FolowingPosition(1),Influences(ii).FolowingPosition(2),Influences(ii).FolowingPosition(3),'p',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',DisplayParams.ColorMatrix(ii,:),...
                'MarkerSize',70*numel(Influences(ii).postesCost)/AlgorithmParams.NumOfAllpostes + 13);
            hold on
            
           plot3(DisplayParams.InfluencesAxisHandle,Influences(ii).postesPosition(:,1),Influences(ii).postesPosition(:,2),Influences(ii).postesPosition(:,3),'ok',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',DisplayParams.ColorMatrix(ii,:),...
                'MarkerSize',8);
        end

        xlim([DisplayParams.AxisMargin.Min(1) DisplayParams.AxisMargin.Max(1)]);
        ylim([DisplayParams.AxisMargin.Min(2) DisplayParams.AxisMargin.Max(2)]);
        zlim([DisplayParams.AxisMargin.Min(3) DisplayParams.AxisMargin.Max(3)]);
        hold off
    end
    
    pause(0.05);
end
