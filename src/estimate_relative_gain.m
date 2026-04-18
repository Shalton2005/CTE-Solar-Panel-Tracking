function relativeGainPercent = estimate_relative_gain(trackerResults, fixedResults)
%ESTIMATE_RELATIVE_GAIN Estimates relative alignment gain from tracking.

trackerScore = alignment_score(trackerResults);
fixedScore = alignment_score(fixedResults);

if fixedScore <= 0
    relativeGainPercent = NaN;
    return;
end

relativeGainPercent = ((trackerScore - fixedScore) / fixedScore) * 100;
end

function score = alignment_score(results)
% Alignment proxy uses product of cosines of orthogonal axis errors.
azTerm = cosd(results.trackingErrorAzimuthDeg);
elTerm = cosd(results.trackingErrorElevationDeg);

alignment = max(azTerm .* elTerm, 0);
score = trapz(results.timeSec, alignment);
end
