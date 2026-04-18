clear;
clc;

thisDir = fileparts(mfilename('fullpath'));
projectRoot = fileparts(thisDir);
addpath(fullfile(projectRoot, 'src'));

results = runtests(fullfile(projectRoot, 'tests'));

disp(results);
assert(all([results.Passed]), 'One or more MATLAB tests failed.');
