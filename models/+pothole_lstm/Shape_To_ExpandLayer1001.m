classdef Shape_To_ExpandLayer1001 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'pothole_lstm.coder.Shape_To_ExpandLayer1001';
        end
    end


    methods
        function this = Shape_To_ExpandLayer1001(name)
            this.Name = name;
            this.OutputNames = {'x_lstm_Expand_output'};
        end

        function [x_lstm_Expand_output] = predict(this, x_lstm_Transpose_out)
            if isdlarray(x_lstm_Transpose_out)
                x_lstm_Transpose_out = stripdims(x_lstm_Transpose_out);
            end
            x_lstm_Transpose_outNumDims = 3;
            x_lstm_Transpose_out = pothole_lstm.ops.permuteInputVar(x_lstm_Transpose_out, [3 2 1], 3);

            [x_lstm_Expand_output, x_lstm_Expand_outputNumDims] = Shape_To_ExpandGraph1003(this, x_lstm_Transpose_out, x_lstm_Transpose_outNumDims, false);
            x_lstm_Expand_output = pothole_lstm.ops.permuteOutputVar(x_lstm_Expand_output, [3 2 1], 3);

            x_lstm_Expand_output = dlarray(single(x_lstm_Expand_output), 'CB');
        end

        function [x_lstm_Expand_output] = forward(this, x_lstm_Transpose_out)
            if isdlarray(x_lstm_Transpose_out)
                x_lstm_Transpose_out = stripdims(x_lstm_Transpose_out);
            end
            x_lstm_Transpose_outNumDims = 3;
            x_lstm_Transpose_out = pothole_lstm.ops.permuteInputVar(x_lstm_Transpose_out, [3 2 1], 3);

            [x_lstm_Expand_output, x_lstm_Expand_outputNumDims] = Shape_To_ExpandGraph1003(this, x_lstm_Transpose_out, x_lstm_Transpose_outNumDims, true);
            x_lstm_Expand_output = pothole_lstm.ops.permuteOutputVar(x_lstm_Expand_output, [3 2 1], 3);

            x_lstm_Expand_output = dlarray(single(x_lstm_Expand_output), 'CB');
        end

        function [x_lstm_Expand_output, x_lstm_Expand_outputNumDims1005] = Shape_To_ExpandGraph1003(this, x_lstm_Transpose_out, x_lstm_Transpose_outNumDims, Training)

            % Execute the operators:
            % Shape:
            [x_lstm_Shape_output_, x_lstm_Shape_output_NumDims] = pothole_lstm.ops.onnxShape(x_lstm_Transpose_out, x_lstm_Transpose_outNumDims, 0, x_lstm_Transpose_outNumDims+1);

            % Gather:
            [x_lstm_Gather_output, x_lstm_Gather_outputNumDims] = pothole_lstm.ops.onnxGather(x_lstm_Shape_output_, this.Vars.x_lstm_Constant_1_ou, 0, x_lstm_Shape_output_NumDims, this.NumDims.x_lstm_Constant_1_ou);

            % Unsqueeze:
            [shape, onnx__Concat_69NumDims] = pothole_lstm.ops.prepareUnsqueezeArgs(x_lstm_Gather_output, this.Vars.UnsqueezeAxes1004, x_lstm_Gather_outputNumDims);
            onnx__Concat_69 = reshape(x_lstm_Gather_output, shape);

            % Concat:
            [x_lstm_Concat_output, x_lstm_Concat_outputNumDims] = pothole_lstm.ops.onnxConcat(0, {this.Vars.onnx__Concat_113, onnx__Concat_69, this.Vars.x_lstm_Constant_2_ou}, [this.NumDims.onnx__Concat_113, onnx__Concat_69NumDims, this.NumDims.x_lstm_Constant_2_ou]);

            % Expand:
            [shape, x_lstm_Expand_outputNumDims] = pothole_lstm.ops.prepareExpandArgs(this.NumDims.x_lstm_Constant_outp, x_lstm_Concat_output);
            x_lstm_Expand_output = this.Vars.x_lstm_Constant_outp + zeros(shape);

            % Set graph output arguments
            x_lstm_Expand_outputNumDims1005 = x_lstm_Expand_outputNumDims;

        end

    end

end