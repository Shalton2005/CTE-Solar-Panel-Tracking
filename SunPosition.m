function [azimuth, elevation] = SunPosition(simTime, latitude, longitude, UTC_offset)
    if nargin ~= 4
        error('SunPosition requires simTime, latitude, longitude, and UTC_offset.');
    end

    if ~isscalar(simTime) || ~isscalar(latitude) || ~isscalar(longitude) || ~isscalar(UTC_offset)
        error('All inputs to SunPosition must be scalar numeric values.');
    end

    secs_per_day = 86400;
    dayOfYear = floor(simTime / secs_per_day) + 1;
    secondsToday = mod(simTime, secs_per_day);

    timeUTC = (secondsToday / 3600);

    % Declination angle
    decl = 23.45 * sind(360 * (284 + dayOfYear) / 365);

    % Equation of Time
    B = 360 * (dayOfYear - 81) / 364;
    EoT = 9.87 * sind(2*B) - 7.53 * cosd(B) - 1.5 * sind(B); % in minutes

    % Time Correction
    localStandardMeridian = 15 * UTC_offset;
    TC = 4 * (longitude - localStandardMeridian) + EoT;

    % Local Solar Time
    LST = timeUTC + TC / 60;

    % Hour Angle
    hourAngle = 15 * (LST - 12);

    % Convert to radians
    latRad = deg2rad(latitude);
    declRad = deg2rad(decl);
    haRad = deg2rad(hourAngle);

    % Elevation
    elevation = asind(sin(latRad)*sin(declRad) + cos(latRad)*cos(declRad)*cos(haRad));

    % Azimuth
    cosAz = (sin(declRad) - sin(latRad)*sind(elevation)) / (cos(latRad)*cosd(elevation));
    cosAz = max(min(cosAz, 1), -1); % clamp
    azimuth = acosd(cosAz);

    if hourAngle > 0
        azimuth = 360 - azimuth;
    end
end