% Define radii of curvature
r1 = 2;  % Radius of curvature for the left side of the lens
r2 = 5;  % Radius of curvature for the right side of the lens

% Define the center of the lens
center_x = 500;  % X-coordinate of the center of the lens
center_z = 150;  % Z-coordinate of the center of the lens

% Define the range of x-values for plotting
x_range = linspace(center_x - r1, center_x + r2, 1000);

% Calculate corresponding z-values using the equation of a circle
z_left = center_z + sqrt(r1^2 - (x_range - center_x).^2);
z_right = center_z + sqrt(r2^2 - (x_range - center_x).^2);

% Plot the convex lens
figure;
plot(x_range, z_left, 'b', 'LineWidth', 2);  % Left side of the lens
hold on;
plot(x_range, z_right, 'r', 'LineWidth', 2); % Right side of the lens
xlabel('Horizontal Distance (m)');
ylabel('Vertical Distance (m)');
title('Convex Lens Plot');
legend('Left Side', 'Right Side', 'Location', 'NorthWest');
grid on;
axis equal; % Ensure aspect ratio is equal
