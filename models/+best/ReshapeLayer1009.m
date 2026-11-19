classdef ReshapeLayer1009 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>
    properties (Learnable)
    end

    properties (State)
    end

    properties
        Vars
        NumDims
    end


    methods(Static, Hidden)
        % Specify the path to the class that will be used for codegen
        function name = matlabCodegenRedirect(~)
            name = 'best.coder.ReshapeLayer1009';
        end
    end


    methods
        function this = ReshapeLayer1009(name)
            this.Name = name;
            this.OutputNames = {'x_model_22_Reshape_4'};
        end

        function [x_model_22_Reshape_4] = predict(this, x_model_22_cv3_1_c_6)
            if isdlarray(x_model_22_cv3_1_c_6)
                x_model_22_cv3_1_c_6 = stripdims(x_model_22_cv3_1_c_6);
            end
            x_model_22_cv3_1_c_6NumDims = 4;
            x_model_22_cv3_1_c_6 = best.ops.permuteInputVar(x_model_22_cv3_1_c_6, [4 3 1 2], 4);

            [x_model_22_Reshape_4, x_model_22_Reshape_4NumDims] = ReshapeGraph1034(this, x_model_22_cv3_1_c_6, x_model_22_cv3_1_c_6NumDims, false);
            x_model_22_Reshape_4 = best.ops.permuteOutputVar(x_model_22_Reshape_4, [2 1 3], 3);

            x_model_22_Reshape_4 = dlarray(single(x_model_22_Reshape_4), 'CBT');
        end

        function [x_model_22_Reshape_4] = forward(this, x_model_22_cv3_1_c_6)
            if isdlarray(x_model_22_cv3_1_c_6)
                x_model_22_cv3_1_c_6 = stripdims(x_model_22_cv3_1_c_6);
            end
            x_model_22_cv3_1_c_6NumDims = 4;
            x_model_22_cv3_1_c_6 = best.ops.permuteInputVar(x_model_22_cv3_1_c_6, [4 3 1 2], 4);

            [x_model_22_Reshape_4, x_model_22_Reshape_4NumDims] = ReshapeGraph1034(this, x_model_22_cv3_1_c_6, x_model_22_cv3_1_c_6NumDims, true);
            x_model_22_Reshape_4 = best.ops.permuteOutputVar(x_model_22_Reshape_4, [2 1 3], 3);

            x_model_22_Reshape_4 = dlarray(single(x_model_22_Reshape_4), 'CBT');
        end

        function [x_model_22_Reshape_4, x_model_22_Reshape_4NumDims1035] = ReshapeGraph1034(this, x_model_22_cv3_1_c_6, x_model_22_cv3_1_c_6NumDims, Training)

            % Execute the operators:
            % Reshape:
            [shape, x_model_22_Reshape_4NumDims] = best.ops.prepareReshapeArgs(x_model_22_cv3_1_c_6, this.Vars.x_model_22_Constan_4, x_model_22_cv3_1_c_6NumDims, 0);
            x_model_22_Reshape_4 = reshape(x_model_22_cv3_1_c_6, shape{:});

            % Set graph output arguments
            x_model_22_Reshape_4NumDims1035 = x_model_22_Reshape_4NumDims;

        end

    end

end