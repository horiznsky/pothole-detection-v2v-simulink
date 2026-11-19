classdef GatherLayer1002 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'pothole_lstm.coder.GatherLayer1002';
        end
    end


    methods
        function this = GatherLayer1002(name)
            this.Name = name;
            this.OutputNames = {'x_Gather_output_0'};
        end

        function [x_Gather_output_0] = predict(this, x_lstm_Transpose_1_o)
            if isdlarray(x_lstm_Transpose_1_o)
                x_lstm_Transpose_1_o = stripdims(x_lstm_Transpose_1_o);
            end
            x_lstm_Transpose_1_oNumDims = 3;
            x_lstm_Transpose_1_o = pothole_lstm.ops.permuteInputVar(x_lstm_Transpose_1_o, [2 3 1], 3);

            [x_Gather_output_0, x_Gather_output_0NumDims] = GatherGraph1006(this, x_lstm_Transpose_1_o, x_lstm_Transpose_1_oNumDims, false);
            x_Gather_output_0 = pothole_lstm.ops.permuteOutputVar(x_Gather_output_0, [2 1], 2);

            x_Gather_output_0 = dlarray(single(x_Gather_output_0), 'CB');
        end

        function [x_Gather_output_0] = forward(this, x_lstm_Transpose_1_o)
            if isdlarray(x_lstm_Transpose_1_o)
                x_lstm_Transpose_1_o = stripdims(x_lstm_Transpose_1_o);
            end
            x_lstm_Transpose_1_oNumDims = 3;
            x_lstm_Transpose_1_o = pothole_lstm.ops.permuteInputVar(x_lstm_Transpose_1_o, [2 3 1], 3);

            [x_Gather_output_0, x_Gather_output_0NumDims] = GatherGraph1006(this, x_lstm_Transpose_1_o, x_lstm_Transpose_1_oNumDims, true);
            x_Gather_output_0 = pothole_lstm.ops.permuteOutputVar(x_Gather_output_0, [2 1], 2);

            x_Gather_output_0 = dlarray(single(x_Gather_output_0), 'CB');
        end

        function [x_Gather_output_0, x_Gather_output_0NumDims1007] = GatherGraph1006(this, x_lstm_Transpose_1_o, x_lstm_Transpose_1_oNumDims, Training)

            % Execute the operators:
            % Gather:
            [x_Gather_output_0, x_Gather_output_0NumDims] = pothole_lstm.ops.onnxGather(x_lstm_Transpose_1_o, this.Vars.x_Constant_output_0, 1, x_lstm_Transpose_1_oNumDims, this.NumDims.x_Constant_output_0);

            % Set graph output arguments
            x_Gather_output_0NumDims1007 = x_Gather_output_0NumDims;

        end

    end

end