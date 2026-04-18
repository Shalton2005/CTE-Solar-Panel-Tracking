function metrics = compute_tracking_metrics(results)
%COMPUTE_TRACKING_METRICS Computes common control performance metrics.

azError = results.trackingErrorAzimuthDeg;
elError = results.trackingErrorElevationDeg;

timeSec = results.timeSec;

metrics.meanAbsErrorAzimuthDeg = mean(abs(azError));
metrics.meanAbsErrorElevationDeg = mean(abs(elError));
metrics.rmseAzimuthDeg = sqrt(mean(azError .^ 2));
metrics.rmseElevationDeg = sqrt(mean(elError .^ 2));
metrics.peakAbsErrorAzimuthDeg = max(abs(azError));
metrics.peakAbsErrorElevationDeg = max(abs(elError));

metrics.settlingTimeAzimuthSec = estimate_settling_time(timeSec, azError, 2.0);
metrics.settlingTimeElevationSec = estimate_settling_time(timeSec, elError, 2.0);

metrics.table = table(
    metrics.meanAbsErrorAzimuthDeg,
    metrics.meanAbsErrorElevationDeg,
    metrics.rmseAzimuthDeg,
    metrics.rmseElevationDeg,
    metrics.peakAbsErrorAzimuthDeg,
    metrics.peakAbsErrorElevationDeg,
    metrics.settlingTimeAzimuthSec,
    metrics.settlingTimeElevationSec,
    'VariableNames', {
        'MAE_Azimuth_Deg',
        'MAE_Elevation_Deg',
        'RMSE_Azimuth_Deg',
        'RMSE_Elevation_Deg',
        'Peak_Azimuth_Deg',
        'Peak_Elevation_Deg',
        'Settling_Azimuth_Sec',
        'Settling_Elevation_Sec'
    }
);
end

function settlingSec = estimate_settling_time(timeSec, errorSignal, thresholdDeg)
idx = find(abs(errorSignal) > thresholdDeg, 1, 'last');
if isempty(idx)
    settlingSec = 0;
    return;
end

if idx == numel(timeSec)
    settlingSec = timeSec(end);
else
    settlingSec = timeSec(idx + 1);
end
end
