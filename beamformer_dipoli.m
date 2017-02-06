% EEG Analysis
% FieldTrip - Beamformer
% Script writted by: Sara Jamil
% Script modified by: Sadman Sakib
%
% EEG data info:
% Control Subject - mTBI_P19
% P300 ERPs
% Standard tone - S10

disp('Beamformer_dipoli program - EEG analysis using FieldTrip beamformer.');
disp('Press any key to continue');
pause;

clear;
close all;
clc;

%% Importing data and pre-processing stage

% Import data
fn = 'C:\Users\Admin\Documents\Research Project\mTBI_P40.bdf';
cfg = [];
cfg.dataset = fn;
cfg.trialfun = 'ft_trialfun_general';

% code used to find trial markers
% % % cfg.trialdef.eventtype = '?';
% % % cfg = ft_definetrial(cfg);

% code used to find sampling rate
% % % data = ft_preprocessing(cfg);

% details of the trial definitions
cfg.trialdef.eventtype = 'STATUS';
% trial length is 2 secs
% 0.2 s before event and 1.8 s after event
cfg.trialdef.prestim = 0.2;
cfg.trialdef.poststim = 1.8;
% we choose to analyse at  the following four events
cfg.trialdef.eventvalue = [10, 40, 1034, 1057];
cfg = ft_definetrial(cfg);

% we remove trials that don't pertain to ERPs
% select trials to remove manually
badTrials = 529:1:2710;
cfg.trl(badTrials,:) = [];




