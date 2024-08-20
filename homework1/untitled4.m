% Define parameters
num_sources = 4; % Number of point sources
spacing = 0.5; % Spacing between sources (in wavelengths)
wavelength = 1; % Wavelength of signals

% Calculate positions of sources
positions = (0:num_sources-1) * spacing * wavelength;

% Simulate received signals
received_signals = zeros(num_sources, 1000); % Assuming 1000 time samples
for i = 1:num_sources
    % Simulate signal received at each source (e.g., using propagation model)
    received_signals(i, :) = simulate_received_signal(positions(i));
end

% Implement beamforming
% Example: Delay-and-sum beamforming
beamformed_signal = sum(received_signals, 1);

% Plot results
figure;
subplot(2,1,1);
plot(positions, zeros(size(positions)), 'o'); % Plot source positions
xlabel('Position');
title('Array Geometry');
ylim([-0.5, 0.5]);
subplot(2,1,2);
plot(beamformed_signal); % Plot beamformed signal
xlabel('Time');
title('Beamformed Signal');

% Function to simulate received signal at each source
function signal = simulate_received_signal(position)
    % Example: Simulate received signal (replace with actual simulation)
    signal = sin(2*pi*(1:1000)/100) * (1/position)^2; % Adjust amplitude based on distance
end
