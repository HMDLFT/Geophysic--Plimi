% -------------------------------------------------------------------------
%       Acoustic wave equation finite difference simulator
% -------------------------------------------------------------------------

% --------------------------------------------------
% Create your own model and example....
% --------------------------------------------------

% 1. Model parameters

model.x   = 0:1:300;    % horizontal x axis sampling
model.z   = 0:1:200;     % vertical   z axis sampling

% temporary variables to compute size of velocity matrix
Nx = numel(model.x);
Nz = numel(model.z);

% velocity model assignement
model.vel=zeros(Nz,Nx);      % initialize matrix

for kx=1:Nx,
  x=model.x(kx);
  for kz=1:Nz,
    z=model.z(kz);
    
     if z>140 & z<180 & x>120 &x<200,
       model.vel(kz,kx)=300;
    else
      model.vel(kz,kx)=2500;
    end
    
  end
end

% optional receivers in (recx, recz)
% the program round their position on the nearest velocity grid
model.recx  = 10:10:model.x(end);
model.recz  = model.recx*0+model.z(end);
model.dtrec = 0.004;
% ----------------------------------------
% 2. Source parameters

source.x    = [50];
source.z    = [60 ]; 
source.f0   = [20 ];
source.t0   = [0.04];
source.amp  = [1];
source.type = [1];    % 1: ricker, 2: sinusoidal  at f0

% ----------------------------------------
% 3. Simulation and graphic parameters in structure simul

simul.borderAlg=1;
simul.timeMax=0.51;

simul.printRatio=10;
simul.higVal=.05;
simul.lowVal=0.03;
simul.bkgVel=1;

simul.cmap='cool';   % gray, cool, hot, parula, hsv

% ----------------------------------------
% 4. Program call

recfield=acu2Dpro(model,source,simul);

% Plot receivers traces

figure
scal   = 1;  % 1 for global max, 0 for global ave, 2 for trace max
pltflg = 0;  % 1 plot only filled peaks, 0 plot wiggle traces and filled peaks,
             % 2 plot wiggle traces only, 3 imagesc gray, 4 pcolor gray
scfact = 5;  % scaling factor
colour = '';  % trace colour, default is black
clip   = []; % clipping of amplitudes (if <1); default no clipping

seisplot2(recfield.data,recfield.time,[],scal,pltflg,scfact,colour,clip)
xlabel('receiver nr')




