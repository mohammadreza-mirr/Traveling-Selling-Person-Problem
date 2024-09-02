function PlotSolution(sol,model)

    x=model.x;
    y=model.y;
    
    xmin=model.xmin;
    xmax=model.xmax;
    ymin=model.ymin;
    ymax=model.ymax;
    
    tour=sol.Position;
    
    tour=[tour tour(1)];
    
    plot(x(tour),y(tour),'k-s',...
        'LineWidth',2,...
        'MarkerFaceColor','y');

    xlim([xmin xmax]);
    ylim([ymin ymax]);
    
end