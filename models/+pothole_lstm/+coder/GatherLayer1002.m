classdef GatherLayer1002 < nnet.layer.Layer & nnet.layer.Formattable
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
            this_cg = pothole_lstm.coder.GatherLayer1002(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = pothole_lstm.GatherLayer1002(cgInstance.Name);
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
        function this = GatherLayer1002(mlInstance)
            this.Name = mlInstance.Name;
            this.OutputNames = {'x_Gather_output_0'};
            if isstruct(mlInstance.Vars)
                names = fieldnames(mlInstance.Vars);
                for i=1:numel(names)
                    fieldname = names{i};
                    this.Vars.(fieldname) = pothole_lstm.coder.ops.extractIfDlarray(mlInstance.Vars.(fieldname));
                end
            else
                this.Vars = [];
            end

            this.NumDims = mlInstance.NumDims;
        end

        function [x_Gather_output_0] = predict(this, x_lstm_Transpose_1_o__)
            if isdlarray(x_lstm_Transpose_1_o__)
                x_lstm_Transpose_1_o_ = stripdims(x_lstm_Transpose_1_o__);
            else
                x_lstm_Transpose_1_o_ = x_lstm_Transpose_1_o__;
            end
            x_lstm_Transpose_1_oNumDims = 3;
            x_lstm_Transpose_1_o = pothole_lstm.coder.ops.permuteInputVar(x_lstm_Transpose_1_o_, [2 3 1], 3);

            [x_Gather_output_0__, x_Gather_output_0NumDims__] = GatherGraph1006(this, x_lstm_Transpose_1_o, x_lstm_Transpose_1_oNumDims, false);
            x_Gather_output_0_ = pothole_lstm.coder.ops.permuteOutputVar(x_Gather_output_0__, [2 1], 2);

            x_Gather_output_0 = dlarray(single(x_Gather_output_0_), 'CB');
        end

        function [x_Gather_output_0, x_Gather_output_0NumDims1007] = GatherGraph1006(this, x_lstm_Transpose_1_o, x_lstm_Transpose_1_oNumDims, Training)

            % Execute the operators:
            % Gather:
            [x_Gather_output_0, x_Gather_output_0NumDims] = pothole_lstm.coder.ops.onnxGather(x_lstm_Transpose_1_o, this.Vars.x_Constant_output_0, 1, coder.const(x_lstm_Transpose_1_oNumDims), this.NumDims.x_Constant_output_0);

            % Set graph output arguments
            x_Gather_output_0NumDims1007 = coder.const(x_Gather_output_0NumDims);

        end

    end

end