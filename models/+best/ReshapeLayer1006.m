classdef ReshapeLayer1006 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'best.coder.ReshapeLayer1006';
        end
    end


    methods
        function this = ReshapeLayer1006(name)
            this.Name = name;
            this.OutputNames = {'x_model_22_Reshape_3'};
        end

        function [x_model_22_Reshape_3] = predict(this, x_model_22_cv3_0_c_6)
            if isdlarray(x_model_22_cv3_0_c_6)
                x_model_22_cv3_0_c_6 = stripdims(x_model_22_cv3_0_c_6);
            end
            x_model_22_cv3_0_c_6NumDims = 4;
            x_model_22_cv3_0_c_6 = best.ops.permuteInputVar(x_model_22_cv3_0_c_6, [4 3 1 2], 4);

            [x_model_22_Reshape_3, x_model_22_Reshape_3NumDims] = ReshapeGraph1024(this, x_model_22_cv3_0_c_6, x_model_22_cv3_0_c_6NumDims, false);
            x_model_22_Reshape_3 = best.ops.permuteOutputVar(x_model_22_Reshape_3, [2 1 3], 3);

            x_model_22_Reshape_3 = dlarray(single(x_model_22_Reshape_3), 'CBT');
        end

        function [x_model_22_Reshape_3] = forward(this, x_model_22_cv3_0_c_6)
            if isdlarray(x_model_22_cv3_0_c_6)
                x_model_22_cv3_0_c_6 = stripdims(x_model_22_cv3_0_c_6);
            end
            x_model_22_cv3_0_c_6NumDims = 4;
            x_model_22_cv3_0_c_6 = best.ops.permuteInputVar(x_model_22_cv3_0_c_6, [4 3 1 2], 4);

            [x_model_22_Reshape_3, x_model_22_Reshape_3NumDims] = ReshapeGraph1024(this, x_model_22_cv3_0_c_6, x_model_22_cv3_0_c_6NumDims, true);
            x_model_22_Reshape_3 = best.ops.permuteOutputVar(x_model_22_Reshape_3, [2 1 3], 3);

            x_model_22_Reshape_3 = dlarray(single(x_model_22_Reshape_3), 'CBT');
        end

        function [x_model_22_Reshape_3, x_model_22_Reshape_3NumDims1025] = ReshapeGraph1024(this, x_model_22_cv3_0_c_6, x_model_22_cv3_0_c_6NumDims, Training)

            % Execute the operators:
            % Reshape:
            [shape, x_model_22_Reshape_3NumDims] = best.ops.prepareReshapeArgs(x_model_22_cv3_0_c_6, this.Vars.x_model_22_Constan_4, x_model_22_cv3_0_c_6NumDims, 0);
            x_model_22_Reshape_3 = reshape(x_model_22_cv3_0_c_6, shape{:});

            % Set graph output arguments
            x_model_22_Reshape_3NumDims1025 = x_model_22_Reshape_3NumDims;

        end

    end

end