% -------------------------------------------------------------------------
%       Acoustic wave equation finite diference simulator
% -------------------------------------------------------------------------

% ----------------------------------------
% Design an example showing that Mie scattering produces attenuation
% Suggestion: build an uniform medium, insert a source in the center of 
% the model and 2 vertical lines of receivers, one on the left and one 
% on the right of the source, simmetrically.
% Now, on one of the 2 sides of the source, add to the velocity model
% random variations (zero mean, anomalies below wavelength) and
% verify on the seismic traces that the wavefront crossing the "noisy" zone
% is more attenuated
clear all
% Create a uniform velocity model
Nx = 800;
Nz = 400;
x = linspace(0, 2000, Nx);
z = linspace(0, 1000, Nz);
[X, Z] = meshgrid(x, z);
vel = 1000 * ones(size(X));

% Add random variations on one side of the source
noisy_zone = X >= 1000;
vel(noisy_zone) = vel(noisy_zone) + 125 * randn(size(vel(noisy_zone)));

model.x = x;
model.z = z;
model.vel = vel;

% Define source and receivers
source.x = [1000]; % Source in the center
source.z = [500];  % Depth of the source
source.f0 = [10];  % Frequency of the source
source.t0 = [0.1];  % Time of source emission
source.type = [1];  % Ricker wavelet
source.amp = [4];   % Amplitude of the source

% Define receivers on both sides of the source
% % model.recx = [800, 1200]; % Two receivers, one on the left and one on the right
% % model.recz = [500, 500];  % Depth of the receivers
model.recx = [12, 1991];
model.recz = [500, 500];
model.dtrec = 0.004;      % Time sampling for receivers

% Simulation parameters
simul.timeMax = 2;
simul.borderAlg = 1;
simul.printRatio = 5;
simul.higVal = 0.5;
simul.lowVal = 0.1;
simul.bkgVel = 1;
simul.cmap = 'hsv';

% Run the simulation
recfield = acu2Dpro(model, source, simul);

% Plot the seismic traces
figure;
time = recfield.time;
traces = recfield.data;
plot(time, traces);
xlabel('Time (s)');
ylabel('Amplitude');
title('Seismic Traces with Mie Scattering');
legend('Receiver 1', 'Receiver 2','Receiver 3','Receiver 4','Receiver 5','Receiver 6','Receiver 7','Receiver 8');