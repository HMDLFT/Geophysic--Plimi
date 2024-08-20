% Define model parameters
model.x = 0:1:1000;         % Horizontal x axis sampling
model.z = 0:1:300;          % Vertical z axis sampling

% Temporary variables to compute the size of the velocity matrix
Nx = numel(model.x);
Nz = numel(model.z);

% Initialize the velocity model
model.vel = ones(Nz, Nx) * 1000;  % Higher velocity area

% Define a region of lower velocity (e.g., a convex lens)
center_x = 500;
center_z = 150;
focal_length = 20;  % Adjust the focal length to decrease the thickness of the lens

for kx = 1:Nx
    for kz = 1:Nz
        % Compute the distance from the current point to the center of the convex lens
        distance_to_center = sqrt((model.x(kx) - center_x)^2 + (model.z(kz) - center_z)^2);
        
        % Define velocity based on the distance from the center using a convex function
        velocity = 500 + (distance_to_center/focal_length)^2 * 500;  % Quadratic function
        
        % Ensure velocity does not exceed 1000 (maximum velocity)
        velocity = min(velocity, 1000);
        
        % Assign the velocity to the model
        model.vel(kz, kx) = velocity;
        
        % Color the lens region differently
        if distance_to_center <= focal_length  % Define the lens region based on focal length
            model.vel(kz, kx) = 250;  % Assign a lower velocity value to the lens region
        end
    end
end
