function [Y, numDimsY] = onnxShape(X, numDimsX_, startAxis_, endAxis_)
% Implements the ONNX Shape operator
% Return the reverse ONNX shape as a 1D column vector
%#codegen

% Copyright 2024-2026 The MathWorks, Inc.

numDimsX = pothole_lstm.coder.ops.extractIfDlarray(numDimsX_);
startAxis = pothole_lstm.coder.ops.extractIfDlarray(startAxis_);
endAxis = pothole_lstm.coder.ops.extractIfDlarray(endAxis_);

switch numDimsX
    case 0
        % A 0-D tensor (scalar) has an empty shape in ONNX
        Y = [];
    case 1
        if isempty(X)
            Y = 0;
        else
            Y = size(X,1);
        end
    otherwise
        if(endAxis<0)
            %  If the endAxis is smaller than 0 after converting it positive, 
            % the endAxis is 0
            endAxis = max(0, numDimsX + endAxis);
        end
        if(startAxis<0)
            %  If the startAxis is smaller than 0 after converting it positive, 
            % the startAxis is 0
            startAxis = max(0, numDimsX + startAxis);
        end
        % transform startAxis and endAxis from 0 index to 1 index
        startAxis = startAxis + 1;
        endAxis = endAxis + 1;
        % if startAxis is larger than numDimsX or endAxis is larger than
        % numDimsX + 1, cramp it to the upper bound. The endAxis is exclusive, 
        % transform it to MATLAB inclusive way
        endAxis = min(endAxis, numDimsX + 1) - 1;
        startAxis = min(startAxis, numDimsX);
        if endAxis < startAxis || endAxis == 0
            Y = 0;
        else
            Y = fliplr(size(X, (numDimsX-endAxis+1):(numDimsX-startAxis+1)))';
        end        
end
numDimsY = 1;
end
