classdef Reshape_To_TransposeLayer1007 < nnet.layer.Layer & nnet.layer.Formattable
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
            this_cg = best.coder.Reshape_To_TransposeLayer1007(mlInstance);
        end
        function this_ml = matlabCodegenFromRedirected(cgInstance)
            this_ml = best.Reshape_To_TransposeLayer1007(cgInstance.Name);
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
        function this = Reshape_To_TransposeLayer1007(mlInstance)
            this.Name = mlInstance.Name;
            this.NumInputs = 3;
            this.OutputNames = {'x_model_22_dfl_Trans'};
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

        function [x_model_22_dfl_Trans] = predict(this, x_model_22_cv2_0_c_6__, x_model_22_cv2_1_c_6__, x_model_22_cv2_2_c_6__)
            if isdlarray(x_model_22_cv2_0_c_6__)
                x_model_22_cv2_0_c_6_ = stripdims(x_model_22_cv2_0_c_6__);
            else
                x_model_22_cv2_0_c_6_ = x_model_22_cv2_0_c_6__;
            end
            if isdlarray(x_model_22_cv2_1_c_6__)
                x_model_22_cv2_1_c_6_ = stripdims(x_model_22_cv2_1_c_6__);
            else
                x_model_22_cv2_1_c_6_ = x_model_22_cv2_1_c_6__;
            end
            if isdlarray(x_model_22_cv2_2_c_6__)
                x_model_22_cv2_2_c_6_ = stripdims(x_model_22_cv2_2_c_6__);
            else
                x_model_22_cv2_2_c_6_ = x_model_22_cv2_2_c_6__;
            end
            x_model_22_cv2_0_c_6NumDims = 4;
            x_model_22_cv2_1_c_6NumDims = 4;
            x_model_22_cv2_2_c_6NumDims = 4;
            x_model_22_cv2_0_c_6 = best.coder.ops.permuteInputVar(x_model_22_cv2_0_c_6_, [4 3 1 2], 4);
            x_model_22_cv2_1_c_6 = best.coder.ops.permuteInputVar(x_model_22_cv2_1_c_6_, [4 3 1 2], 4);
            x_model_22_cv2_2_c_6 = best.coder.ops.permuteInputVar(x_model_22_cv2_2_c_6_, [4 3 1 2], 4);

            [x_model_22_dfl_Trans__, x_model_22_dfl_TransNumDims__] = Reshape_To_TransposeGraph1026(this, x_model_22_cv2_0_c_6, x_model_22_cv2_1_c_6, x_model_22_cv2_2_c_6, x_model_22_cv2_0_c_6NumDims, x_model_22_cv2_1_c_6NumDims, x_model_22_cv2_2_c_6NumDims, false);
            x_model_22_dfl_Trans_ = best.coder.ops.permuteOutputVar(x_model_22_dfl_Trans__, [3 4 2 1], 4);

            x_model_22_dfl_Trans = dlarray(single(x_model_22_dfl_Trans_), 'SSCB');
        end

        function [x_model_22_dfl_Trans, x_model_22_dfl_TransNumDims1029] = Reshape_To_TransposeGraph1026(this, x_model_22_cv2_0_c_6, x_model_22_cv2_1_c_6, x_model_22_cv2_2_c_6, x_model_22_cv2_0_c_6NumDims, x_model_22_cv2_1_c_6NumDims, x_model_22_cv2_2_c_6NumDims, Training)

            % Execute the operators:
            % Reshape:
            [shape1001, x_model_22_Reshape_oNumDims] = best.coder.ops.prepareReshapeArgs(x_model_22_cv2_0_c_6, this.Vars.x_model_22_Constan_7, coder.const(x_model_22_cv2_0_c_6NumDims), 0);
            x_model_22_Reshape_o = reshape(x_model_22_cv2_0_c_6, shape1001{:});

            % Reshape:
            [shape1002, x_model_22_Reshape_1NumDims] = best.coder.ops.prepareReshapeArgs(x_model_22_cv2_1_c_6, this.Vars.x_model_22_Constan_7, coder.const(x_model_22_cv2_1_c_6NumDims), 0);
            x_model_22_Reshape_1 = reshape(x_model_22_cv2_1_c_6, shape1002{:});

            % Reshape:
            [shape1003, x_model_22_Reshape_2NumDims] = best.coder.ops.prepareReshapeArgs(x_model_22_cv2_2_c_6, this.Vars.x_model_22_Constan_7, coder.const(x_model_22_cv2_2_c_6NumDims), 0);
            x_model_22_Reshape_2 = reshape(x_model_22_cv2_2_c_6, shape1003{:});

            % Concat:
            [x_model_22_Concat_ou, x_model_22_Concat_ouNumDims] = best.coder.ops.onnxConcat(-1, {x_model_22_Reshape_o, x_model_22_Reshape_1, x_model_22_Reshape_2}, [coder.const(x_model_22_Reshape_oNumDims), coder.const(x_model_22_Reshape_1NumDims), coder.const(x_model_22_Reshape_2NumDims)]);

            % Reshape:
            [shape1004, x_model_22_dfl_Res_1NumDims] = best.coder.ops.prepareReshapeArgs(x_model_22_Concat_ou, this.Vars.x_model_22_dfl_Con_1, coder.const(x_model_22_Concat_ouNumDims), 0);
            x_model_22_dfl_Res_1 = reshape(x_model_22_Concat_ou, shape1004{:});

            % Transpose:
            [perm1005, x_model_22_dfl_Tra_1NumDims] = best.coder.ops.prepareTransposeArgs(this.Vars.TransposePerm1027, coder.const(x_model_22_dfl_Res_1NumDims));
            if isempty(perm1005)
                x_model_22_dfl_Tra_1 = x_model_22_dfl_Res_1;
            else
                x_model_22_dfl_Tra_1 = permute(best.coder.ops.extractIfDlarray(x_model_22_dfl_Res_1), perm1005);
            end

            % Softmax:
            [dim11006, dim21007, origSize1008, x_model_22_dfl_SoftmNumDims] = best.coder.ops.prepareSoftmaxArgs(x_model_22_dfl_Tra_1, 3, coder.const(x_model_22_dfl_Tra_1NumDims));
            Y11009 = reshape(x_model_22_dfl_Tra_1, dim11006, dim21007);
            Y21010 = softmax(dlarray(single(Y11009)), 'DataFormat', 'CB');
            x_model_22_dfl_Softm = reshape(best.coder.ops.extractIfDlarray(Y21010), origSize1008);

            % Transpose:
            [perm1011, x_model_22_dfl_TransNumDims] = best.coder.ops.prepareTransposeArgs(this.Vars.TransposePerm1028, coder.const(x_model_22_dfl_SoftmNumDims));
            if isempty(perm1011)
                x_model_22_dfl_Trans = x_model_22_dfl_Softm;
            else
                x_model_22_dfl_Trans = permute(best.coder.ops.extractIfDlarray(x_model_22_dfl_Softm), perm1011);
            end

            % Set graph output arguments
            x_model_22_dfl_TransNumDims1029 = coder.const(x_model_22_dfl_TransNumDims);

        end

    end

end