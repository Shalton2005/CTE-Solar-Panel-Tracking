function animate_tracker(results, cfg)
%ANIMATE_TRACKER Animates sun path and panel tracking over a simulation day.

figure('Position', cfg.visualization.figurePosition);
timeHours = results.timeSec / 3600;

for k = 1:numel(results.timeSec)
    clf;

    subplot(2, 1, 1);
    hold on;
    grid on;
    title('Sun and Solar Panel Movement');
    xlabel('Azimuth (deg)');
    ylabel('Elevation (deg)');
    xlim([0 360]);
    ylim([0 90]);

    plot(results.sunAzimuthDeg, results.sunElevationDeg, 'b--', 'LineWidth', 1.5);
    plot(results.sunAzimuthDeg(k), results.sunElevationDeg(k), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    plot(results.panelAzimuthDeg(k), results.panelElevationDeg(k), 'gs', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
    legend('Sun Path', 'Sun Position', 'Panel Position', 'Location', 'best');

    subplot(2, 1, 2);
    hold on;
    grid on;
    title('Panel Azimuth and Elevation Tracking');
    xlabel('Time (hours)');
    ylabel('Angle (deg)');
    xlim([0 24]);
    ylim([0 180]);

    plot(timeHours(1:k), results.panelAzimuthDeg(1:k), 'g-', 'LineWidth', 2);
    plot(timeHours(1:k), results.panelElevationDeg(1:k), 'm-', 'LineWidth', 2);
    plot(timeHours(k), results.panelAzimuthDeg(k), 'go', 'MarkerSize', 6, 'MarkerFaceColor', 'g');
    plot(timeHours(k), results.panelElevationDeg(k), 'mo', 'MarkerSize', 6, 'MarkerFaceColor', 'm');
    legend('Azimuth Servo', 'Elevation Servo', 'Location', 'southeast');

    sgtitle(sprintf('Time: %02d:%02d', floor(results.timeSec(k)/3600), floor(mod(results.timeSec(k), 3600)/60)));

    drawnow;
    pause(cfg.visualization.pauseSec);
end
end
