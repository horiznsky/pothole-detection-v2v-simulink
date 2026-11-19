classdef Reshape_To_AddLayer1012 < nnet.layer.Layer & nnet.layer.Formattable
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
            name = 'best.coder.Reshape_To_AddLayer1012';
        end
    end


    methods
        function this = Reshape_To_AddLayer1012(name)
            this.Name = name;
            this.NumOutputs = 2;
            this.OutputNames = {'x_model_22_Add_2_out', 'x_model_22_Sub_1_out'};
        end

        function [x_model_22_Add_2_out, x_model_22_Sub_1_out] = predict(this, x_model_22_dfl_conv_)
            if isdlarray(x_model_22_dfl_conv_)
                x_model_22_dfl_conv_ = stripdims(x_model_22_dfl_conv_);
            end
            x_model_22_dfl_conv_NumDims = 4;
            x_model_22_dfl_conv_ = best.ops.permuteInputVar(x_model_22_dfl_conv_, [4 3 1 2], 4);

            [x_model_22_Add_2_out, x_model_22_Sub_1_out, x_model_22_Add_2_outNumDims, x_model_22_Sub_1_outNumDims] = Reshape_To_AddGraph1042(this, x_model_22_dfl_conv_, x_model_22_dfl_conv_NumDims, false);
            x_model_22_Add_2_out = best.ops.permuteOutputVar(x_model_22_Add_2_out, [2 1 3], 3);
            x_model_22_Sub_1_out = best.ops.permuteOutputVar(x_model_22_Sub_1_out, [2 1 3], 3);

            x_model_22_Add_2_out = dlarray(single(x_model_22_Add_2_out), 'CBT');
            x_model_22_Sub_1_out = dlarray(single(x_model_22_Sub_1_out), 'CBT');
        end

        function [x_model_22_Add_2_out, x_model_22_Sub_1_out] = forward(this, x_model_22_dfl_conv_)
            if isdlarray(x_model_22_dfl_conv_)
                x_model_22_dfl_conv_ = stripdims(x_model_22_dfl_conv_);
            end
            x_model_22_dfl_conv_NumDims = 4;
            x_model_22_dfl_conv_ = best.ops.permuteInputVar(x_model_22_dfl_conv_, [4 3 1 2], 4);

            [x_model_22_Add_2_out, x_model_22_Sub_1_out, x_model_22_Add_2_outNumDims, x_model_22_Sub_1_outNumDims] = Reshape_To_AddGraph1042(this, x_model_22_dfl_conv_, x_model_22_dfl_conv_NumDims, true);
            x_model_22_Add_2_out = best.ops.permuteOutputVar(x_model_22_Add_2_out, [2 1 3], 3);
            x_model_22_Sub_1_out = best.ops.permuteOutputVar(x_model_22_Sub_1_out, [2 1 3], 3);

            x_model_22_Add_2_out = dlarray(single(x_model_22_Add_2_out), 'CBT');
            x_model_22_Sub_1_out = dlarray(single(x_model_22_Sub_1_out), 'CBT');
        end

        function [x_model_22_Add_2_out, x_model_22_Sub_1_out, x_model_22_Add_2_outNumDims1043, x_model_22_Sub_1_outNumDims1044] = Reshape_To_AddGraph1042(this, x_model_22_dfl_conv_, x_model_22_dfl_conv_NumDims, Training)

            % Execute the operators:
            % Reshape:
            [shape, x_model_22_dfl_ReshaNumDims] = best.ops.prepareReshapeArgs(x_model_22_dfl_conv_, this.Vars.x_model_22_dfl_Const, x_model_22_dfl_conv_NumDims, 0);
            x_model_22_dfl_Resha = reshape(x_model_22_dfl_conv_, shape{:});

            % Slice:
            [Indices, x_model_22_Slice_1_oNumDims] = best.ops.prepareSliceArgs(x_model_22_dfl_Resha, this.Vars.x_model_22_Mul_outpu, this.Vars.x_model_22_Mul_1_out, this.Vars.x_model_22_Constan_5, '', x_model_22_dfl_ReshaNumDims);
            x_model_22_Slice_1_o = x_model_22_dfl_Resha(Indices{:});

            % Add:
            x_model_22_Add_1_out = this.Vars.x_model_22_Constan_1 + x_model_22_Slice_1_o;
            x_model_22_Add_1_outNumDims = max(this.NumDims.x_model_22_Constan_1, x_model_22_Slice_1_oNumDims);

            % Slice:
            [Indices, x_model_22_Slice_outNumDims] = best.ops.prepareSliceArgs(x_model_22_dfl_Resha, this.Vars.x_model_22_Constan_6, this.Vars.x_model_22_Mul_outpu, this.Vars.x_model_22_Constan_5, '', x_model_22_dfl_ReshaNumDims);
            x_model_22_Slice_out = x_model_22_dfl_Resha(Indices{:});

            % Sub:
            x_model_22_Sub_outpu = this.Vars.x_model_22_Constant_ - x_model_22_Slice_out;
            x_model_22_Sub_outpuNumDims = max(this.NumDims.x_model_22_Constant_, x_model_22_Slice_outNumDims);

            % Sub:
            x_model_22_Sub_1_out = x_model_22_Add_1_out - x_model_22_Sub_outpu;
            x_model_22_Sub_1_outNumDims = max(x_model_22_Add_1_outNumDims, x_model_22_Sub_outpuNumDims);

            % Add:
            x_model_22_Add_2_out = x_model_22_Sub_outpu + x_model_22_Add_1_out;
            x_model_22_Add_2_outNumDims = max(x_model_22_Sub_outpuNumDims, x_model_22_Add_1_outNumDims);

            % Set graph output arguments
            x_model_22_Add_2_outNumDims1043 = x_model_22_Add_2_outNumDims;
            x_model_22_Sub_1_outNumDims1044 = x_model_22_Sub_1_outNumDims;

        end

    end

end