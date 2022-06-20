% IRB460 is a class that contains D-H parameters of IRB460
classdef IRB460
    properties (Access = public)
        % a struct that contains all parameters.
        parameters;
    end

    methods
        % initialization
        function obj = IRB460()
            % left & right range of angle1, angle2, angle3.
            obj.parameters.angle1L = deg2rad(-165);
            obj.parameters.angle1R = deg2rad(165);
            obj.parameters.angle2L = deg2rad(-40);
            obj.parameters.angle2R = deg2rad(85);
            obj.parameters.angle3L = deg2rad(-20);
            obj.parameters.angle3R = deg2rad(120);
    
            % Initial D-H Parameters for alpha, a, d, theta.S
            obj.parameters.dG1 = 235.5;
    
            obj.parameters.a1I = 260;
            obj.parameters.d1I = 742.5-obj.parameters.dG1;
    
            obj.parameters.alphaI2 = deg2rad(-90);
            obj.parameters.thetaI2 = deg2rad(-90);
    
            obj.parameters.a23 = 945;
            obj.parameters.theta23 = deg2rad(90);
    
            obj.parameters.a34 = 1025;
    
            obj.parameters.alpha46 = deg2rad(-90);
            obj.parameters.a46 = 220;
            obj.parameters.d46 = 251.5;

            % obj.parameters.C0_G=[-8.37;-0.202;107.46];
            % obj.parameters.C1_1=[-147.973;-22.763;347.734];
            % obj.parameters.C6_2=[0;894.7/2;0];
            % obj.parameters.C7_3=[0;-200;0];
            % obj.parameters.S1_G=[-264.88;0;140.84];
            % obj.parameters.SC8=[-3;0;60];
            % obj.parameters.C9_3=[984.96;0;0];
            % obj.parameters.C11_4=[124.94;0;0];

            obj.parameters.C0_G=[-0.202;8.370;107.46];
            obj.parameters.C1_1=[-22.763;147.973;333.194];
            obj.parameters.SC2_3=[-0.208;-123.447;21.675];

        end

        % get parameters
        function parameters = get_parameters(obj)
            parameters = obj.parameters;
        end
    end
end 