% Parameters
Nx = 100; % Number of grid points along x
Nz = 100; % Number of grid points along z
dx = 1;   % Grid spacing along x (meters)
dz = 1;   % Grid spacing along z (meters)

% Create a simple model
model.x = 0:dx:(Nx-1)*dx;
model.z = 0:dz:(Nz-1)*dz;
model.vel = ones(Nz, Nx) * 1500; % Constant velocity for simplicity

% Create an array of sources
numSources = 5;
sourceSpacing = 10;
sourceArray = struct('x', [], 'z', [], 'f0', [], 't0', [], 'amp', [], 'type', []);

for i = 1:numSources
    sourceArray(i).x = i * sourceSpacing;
    sourceArray(i).z = 10; % Some arbitrary depth
    sourceArray(i).f0 = 30; % Frequency
    sourceArray(i).t0 = 0.04 + i * 0.0005; % Time delay
    sourceArray(i).amp = 1;
    sourceArray(i).type = 1; % Ricker wavelet
end

% Simulation parameters
simul.borderAlg = 1;
simul.timeMax = 0.5;
simul.printRatio = 5;
simul.higVal = 0.6;
simul.lowVal = 0.1;
simul.bkgVel = 1;
simul.cmap = 'gray';

% Run the simulator
recfield = acu2Dpro(model, sourceArray, simul);

% Plot the seismic traces
figure
scal = 1;
pltflg = 0;
scfact = 1;
colour = '';
clip = [];

seisplot2(recfield.data, recfield.time, [], scal, pltflg, scfact, colour, clip)
xlabel('Receiver Number')
