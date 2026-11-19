classdef Shape_To_ExpandLayer1000 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'pothole_lstm.coder.Shape_To_ExpandLayer1000';
        end
    end


    methods
        function this = Shape_To_ExpandLayer1000(name)
            this.Name = name;
            this.OutputNames = {'x_lstm_Expand_1_outp'};
        end

        function [x_lstm_Expand_1_outp] = predict(this, x_lstm_Transpose_out)
            if isdlarray(x_lstm_Transpose_out)
                x_lstm_Transpose_out = stripdims(x_lstm_Transpose_out);
            end
            x_lstm_Transpose_outNumDims = 3;
            x_lstm_Transpose_out = pothole_lstm.ops.permuteInputVar(x_lstm_Transpose_out, [3 2 1], 3);

            [x_lstm_Expand_1_outp, x_lstm_Expand_1_outpNumDims] = Shape_To_ExpandGraph1000(this, x_lstm_Transpose_out, x_lstm_Transpose_outNumDims, false);
            x_lstm_Expand_1_outp = pothole_lstm.ops.permuteOutputVar(x_lstm_Expand_1_outp, [3 2 1], 3);

            x_lstm_Expand_1_outp = dlarray(single(x_lstm_Expand_1_outp), 'CB');
        end

        function [x_lstm_Expand_1_outp] = forward(this, x_lstm_Transpose_out)
            if isdlarray(x_lstm_Transpose_out)
                x_lstm_Transpose_out = stripdims(x_lstm_Transpose_out);
            end
            x_lstm_Transpose_outNumDims = 3;
            x_lstm_Transpose_out = pothole_lstm.ops.permuteInputVar(x_lstm_Transpose_out, [3 2 1], 3);

            [x_lstm_Expand_1_outp, x_lstm_Expand_1_outpNumDims] = Shape_To_ExpandGraph1000(this, x_lstm_Transpose_out, x_lstm_Transpose_outNumDims, true);
            x_lstm_Expand_1_outp = pothole_lstm.ops.permuteOutputVar(x_lstm_Expand_1_outp, [3 2 1], 3);

            x_lstm_Expand_1_outp = dlarray(single(x_lstm_Expand_1_outp), 'CB');
        end

        function [x_lstm_Expand_1_outp, x_lstm_Expand_1_outpNumDims1002] = Shape_To_ExpandGraph1000(this, x_lstm_Transpose_out, x_lstm_Transpose_outNumDims, Training)

            % Execute the operators:
            % Shape:
            [x_lstm_Shape_1_outpu, x_lstm_Shape_1_outpuNumDims] = pothole_lstm.ops.onnxShape(x_lstm_Transpose_out, x_lstm_Transpose_outNumDims, 0, x_lstm_Transpose_outNumDims+1);

            % Gather:
            [x_lstm_Gather_1_outp, x_lstm_Gather_1_outpNumDims] = pothole_lstm.ops.onnxGather(x_lstm_Shape_1_outpu, this.Vars.x_lstm_Constant_3_ou, 0, x_lstm_Shape_1_outpuNumDims, this.NumDims.x_lstm_Constant_3_ou);

            % Unsqueeze:
            [shape, onnx__Concat_78NumDims] = pothole_lstm.ops.prepareUnsqueezeArgs(x_lstm_Gather_1_outp, this.Vars.UnsqueezeAxes1001, x_lstm_Gather_1_outpNumDims);
            onnx__Concat_78 = reshape(x_lstm_Gather_1_outp, shape);

            % Concat:
            [x_lstm_Concat_1_outp, x_lstm_Concat_1_outpNumDims] = pothole_lstm.ops.onnxConcat(0, {this.Vars.onnx__Concat_114, onnx__Concat_78, this.Vars.x_lstm_Constant_4_ou}, [this.NumDims.onnx__Concat_114, onnx__Concat_78NumDims, this.NumDims.x_lstm_Constant_4_ou]);

            % Expand:
            [shape, x_lstm_Expand_1_outpNumDims] = pothole_lstm.ops.prepareExpandArgs(this.NumDims.x_lstm_Constant_outp, x_lstm_Concat_1_outp);
            x_lstm_Expand_1_outp = this.Vars.x_lstm_Constant_outp + zeros(shape);

            % Set graph output arguments
            x_lstm_Expand_1_outpNumDims1002 = x_lstm_Expand_1_outpNumDims;

        end

    end

end