classdef Reshape_To_AddLayer1012 < nnet.layer.Layer & nnet.layer.Formattable
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
            this_cg = best.coder.Reshape_To_AddLayer1012(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = best.Reshape_To_AddLayer1012(cgInstance.Name);
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
        function this = Reshape_To_AddLayer1012(mlInstance)
            this.Name = mlInstance.Name;
            this.NumOutputs = 2;
            this.OutputNames = {'x_model_22_Add_2_out', 'x_model_22_Sub_1_out'};
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

        function [x_model_22_Add_2_out, x_model_22_Sub_1_out] = predict(this, x_model_22_dfl_conv___)
            if isdlarray(x_model_22_dfl_conv___)
                x_model_22_dfl_conv__ = stripdims(x_model_22_dfl_conv___);
            else
                x_model_22_dfl_conv__ = x_model_22_dfl_conv___;
            end
            x_model_22_dfl_conv_NumDims = 4;
            x_model_22_dfl_conv_ = best.coder.ops.permuteInputVar(x_model_22_dfl_conv__, [4 3 1 2], 4);

            [x_model_22_Add_2_out__, x_model_22_Sub_1_out__, x_model_22_Add_2_outNumDims__, x_model_22_Sub_1_outNumDims__] = Reshape_To_AddGraph1042(this, x_model_22_dfl_conv_, x_model_22_dfl_conv_NumDims, false);
            x_model_22_Add_2_out_ = best.coder.ops.permuteOutputVar(x_model_22_Add_2_out__, [2 1 3], 3);
            x_model_22_Sub_1_out_ = best.coder.ops.permuteOutputVar(x_model_22_Sub_1_out__, [2 1 3], 3);

            x_model_22_Add_2_out = dlarray(single(x_model_22_Add_2_out_), 'CBT');
            x_model_22_Sub_1_out = dlarray(single(x_model_22_Sub_1_out_), 'CBT');
        end

        function [x_model_22_Add_2_out, x_model_22_Sub_1_out, x_model_22_Add_2_outNumDims1043, x_model_22_Sub_1_outNumDims1044] = Reshape_To_AddGraph1042(this, x_model_22_dfl_conv_, x_model_22_dfl_conv_NumDims, Training)

            % Execute the operators:
            % Reshape:
            [shape1014, x_model_22_dfl_ReshaNumDims] = best.coder.ops.prepareReshapeArgs(x_model_22_dfl_conv_, this.Vars.x_model_22_dfl_Const, coder.const(x_model_22_dfl_conv_NumDims), 0);
            x_model_22_dfl_Resha = reshape(x_model_22_dfl_conv_, shape1014{:});

            % Slice:
            [indices1015, x_model_22_Slice_1_oNumDims] = best.coder.ops.prepareSliceArgs(x_model_22_dfl_Resha, this.Vars.x_model_22_Mul_outpu, this.Vars.x_model_22_Mul_1_out, this.Vars.x_model_22_Constan_5, '', coder.const(x_model_22_dfl_ReshaNumDims));
            x_model_22_Slice_1_o = x_model_22_dfl_Resha(indices1015{:});

            % Add:
            x_model_22_Add_1_out = this.Vars.x_model_22_Constan_1 + x_model_22_Slice_1_o;
            x_model_22_Add_1_outNumDims = max(this.NumDims.x_model_22_Constan_1, coder.const(x_model_22_Slice_1_oNumDims));

            % Slice:
            [indices1016, x_model_22_Slice_outNumDims] = best.coder.ops.prepareSliceArgs(x_model_22_dfl_Resha, this.Vars.x_model_22_Constan_6, this.Vars.x_model_22_Mul_outpu, this.Vars.x_model_22_Constan_5, '', coder.const(x_model_22_dfl_ReshaNumDims));
            x_model_22_Slice_out = x_model_22_dfl_Resha(indices1016{:});

            % Sub:
            x_model_22_Sub_outpu = this.Vars.x_model_22_Constant_ - x_model_22_Slice_out;
            x_model_22_Sub_outpuNumDims = max(this.NumDims.x_model_22_Constant_, coder.const(x_model_22_Slice_outNumDims));

            % Sub:
            x_model_22_Sub_1_out = x_model_22_Add_1_out - x_model_22_Sub_outpu;
            x_model_22_Sub_1_outNumDims = max(coder.const(x_model_22_Add_1_outNumDims), coder.const(x_model_22_Sub_outpuNumDims));

            % Add:
            x_model_22_Add_2_out = x_model_22_Sub_outpu + x_model_22_Add_1_out;
            x_model_22_Add_2_outNumDims = max(coder.const(x_model_22_Sub_outpuNumDims), coder.const(x_model_22_Add_1_outNumDims));

            % Set graph output arguments
            x_model_22_Add_2_outNumDims1043 = coder.const(x_model_22_Add_2_outNumDims);
            x_model_22_Sub_1_outNumDims1044 = coder.const(x_model_22_Sub_1_outNumDims);

        end

    end

end