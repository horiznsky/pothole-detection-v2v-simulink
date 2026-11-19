classdef ReshapeLayer1009 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.
    %#codegen

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
        % Specify the properties of the class that will not be modified
        % after the first assignment.
        function p = matlabCodegenNontunableProperties(~)
            p = {
                % Constants, i.e., Vars, NumDims and all learnables and states
                'Vars'
                'NumDims'
                };
        end
    end


    methods(Static, Hidden)
        % Instantiate a codegenable layer instance from a MATLAB layer instance
        function this_cg = matlabCodegenToRedirected(mlInstance)
            this_cg = best.coder.ReshapeLayer1009(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = best.ReshapeLayer1009(cgInstance.Name);
            if isstruct(cgInstance.Vars)
                names = fieldnames(cgInstance.Vars);
                for i=1:numel(names)
                    fieldname = names{i};
                    this_ml.Vars.(fieldname) = dlarray(cgInstance.Vars.(fieldname));
                end
            else
                this_ml.Vars = [];
            end
            this_ml.NumDims = cgInstance.NumDims;
        end
    end

    methods
        function this = ReshapeLayer1009(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'x_model_22_Reshape_4'};
            if isstruct(mlInstance.Vars)
                names = fieldnames(mlInstance.Vars);
                for i=1:numel(names)
                    fieldname = names{i};
                    this.Vars.(fieldname) = best.coder.ops.extractIfDlarray(mlInstance.Vars.(fieldname));
                end
            else
                this.Vars = [];
            end

            this.NumDims = mlInstance.NumDims;
        end

        function [x_model_22_Reshape_4] = predict(this, x_model_22_cv3_1_c_6__)
            if isdlarray(x_model_22_cv3_1_c_6__)
                x_model_22_cv3_1_c_6_ = stripdims(x_model_22_cv3_1_c_6__);
            else
                x_model_22_cv3_1_c_6_ = x_model_22_cv3_1_c_6__;
            end
            x_model_22_cv3_1_c_6NumDims = 4;
            x_model_22_cv3_1_c_6 = best.coder.ops.permuteInputVar(x_model_22_cv3_1_c_6_, [4 3 1 2], 4);

            [x_model_22_Reshape_4__, x_model_22_Reshape_4NumDims__] = ReshapeGraph1034(this, x_model_22_cv3_1_c_6, x_model_22_cv3_1_c_6NumDims, false);
            x_model_22_Reshape_4_ = best.coder.ops.permuteOutputVar(x_model_22_Reshape_4__, [2 1 3], 3);

            x_model_22_Reshape_4 = dlarray(single(x_model_22_Reshape_4_), 'CBT');
        end

        function [x_model_22_Reshape_4, x_model_22_Reshape_4NumDims1035] = ReshapeGraph1034(this, x_model_22_cv3_1_c_6, x_model_22_cv3_1_c_6NumDims, Training)

            % Execute the operators:
            % Reshape:
            [shape1012, x_model_22_Reshape_4NumDims] = best.coder.ops.prepareReshapeArgs(x_model_22_cv3_1_c_6, this.Vars.x_model_22_Constan_4, coder.const(x_model_22_cv3_1_c_6NumDims), 0);
            x_model_22_Reshape_4 = reshape(x_model_22_cv3_1_c_6, shape1012{:});

            % Set graph output arguments
            x_model_22_Reshape_4NumDims1035 = coder.const(x_model_22_Reshape_4NumDims);

        end

    end

end