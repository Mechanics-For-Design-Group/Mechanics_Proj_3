classdef Parameters_Class
    properties
        Parameters.angle1L = deg2rad(-165);
        Parameters.angle1R = deg2rad(165);
        Parameters.angle2L = deg2rad(-40);
        Parameters.angle2R = deg2rad(85);
        Parameters.angle3L = deg2rad(-20);
        Parameters.angle3R = deg2rad(120);

        % Initial D-H Parameters for alpha, a, d, theta.S
        Parameters.dG1 = 235.5;

        Parameters.a1I = 260;
        Parameters.d1I = 742.5-dG1;

        Parameters.alphaI2 = deg2rad(-90);
        Parameters.thetaI2 = deg2rad(-90);

        Parameters.a23 = 945;

        Parameters.a34 = 1025;

        Parameters.alpha46 = deg2rad(-90);
        Parameters.a46 = 220; 
        Parameters.d46 = 251.5;
    end
end