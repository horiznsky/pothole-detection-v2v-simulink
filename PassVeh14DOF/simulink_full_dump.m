model = 'PassVeh14DOF'; % <--- CHANGE THIS TO YOUR MODEL NAME
load_system(model);

fid = fopen('PassVeh14DOFslxsimulink_full_dump.txt', 'w');

% Helper function to safely convert any variable (1D, 2D, 3D+, structs) to text
safeToStr = @(v) strtrim(formattedDisplayText(v, 'SuppressMarkup', true));

% 1. EXPORT BASE WORKSPACE VARIABLES
fprintf(fid, '=== BASE WORKSPACE VARIABLES ===\n');
vars = evalin('base', 'whos');
for i = 1:length(vars)
    val = evalin('base', vars(i).name);
    try
        fprintf(fid, '%s (%s) = %s\n', vars(i).name, vars(i).class, safeToStr(val));
    catch
        fprintf(fid, '%s (%s, size: %s)\n', vars(i).name, vars(i).class, mat2str(vars(i).size));
    end
end

% 2. EXPORT MODEL WORKSPACE VARIABLES
fprintf(fid, '\n=== MODEL WORKSPACE VARIABLES ===\n');
mws = get_param(model, 'ModelWorkspace');
if ~isempty(mws)
    mvars = mws.whos;
    for i = 1:length(mvars)
        val = mws.getVariable(mvars(i).name);
        try
            fprintf(fid, '%s (%s) = %s\n', mvars(i).name, mvars(i).class, safeToStr(val));
        catch
            fprintf(fid, '%s (%s, size: %s)\n', mvars(i).name, mvars(i).class, mat2str(mvars(i).size));
        end
    end
end

% 3. EXPORT ALL BLOCKS AND THEIR PARAMETERS
fprintf(fid, '\n=== BLOCKS & PARAMETERS ===\n');
blocks = find_system(model, 'MatchFilter', @Simulink.match.allVariants, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'Type', 'Block');
for i = 1:length(blocks)
    blk = blocks{i};
    blkType = get_param(blk, 'BlockType');
    fprintf(fid, '\n--- Block: %s (Type: %s) ---\n', blk, blkType);
    
    params = get_param(blk, 'DialogParameters');
    if isstruct(params)
        pNames = fieldnames(params);
        for j = 1:length(pNames)
            pName = pNames{j};
            try
                pVal = get_param(blk, pName);
                if ischar(pVal) || isstring(pVal)
                    fprintf(fid, '  %s: %s\n', pName, pVal);
                elseif isnumeric(pVal)
                    fprintf(fid, '  %s: %s\n', pName, safeToStr(pVal));
                end
            catch
            end
        end
    end
end

% 4. EXPORT MATLAB FUNCTION BLOCK SCRIPTS
fprintf(fid, '\n=== MATLAB FUNCTION BLOCK SCRIPTS ===\n');
rt = sfroot;
mBlocks = rt.find('-isa', 'Stateflow.EMChart', 'Path', model);
for i = 1:length(mBlocks)
    fprintf(fid, '\n--- MATLAB Function: %s ---\n%s\n', mBlocks(i).Path, mBlocks(i).Script);
end

% 5. EXPORT SIGNAL CONNECTIONS
fprintf(fid, '\n=== SIGNAL CONNECTIONS ===\n');
lines = find_system(model, 'FindAll', 'on', 'MatchFilter', @Simulink.match.allVariants, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'Type', 'line');
for i = 1:length(lines)
    srcBlock = get_param(lines(i), 'SrcBlockHandle');
    dstBlocks = get_param(lines(i), 'DstBlockHandle');
    dstPorts = get_param(lines(i), 'DstPortHandle');
    
    if ~isempty(srcBlock) && srcBlock ~= -1 && ~isempty(dstBlocks)
        srcName = getfullname(srcBlock);
        srcPort = get_param(get_param(lines(i), 'SrcPortHandle'), 'PortNumber');
        
        for k = 1:length(dstBlocks)
            if dstBlocks(k) ~= -1
                dstName = getfullname(dstBlocks(k));
                if iscell(dstPorts)
                    dPort = get_param(dstPorts{k}, 'PortNumber');
                else
                    dPort = get_param(dstPorts(k), 'PortNumber');
                end
                if iscell(dPort), dPort = dPort{1}; end
                if iscell(srcPort), sPort = srcPort{1}; else, sPort = srcPort; end
                
                fprintf(fid, '%s [Port %d] --> %s [Port %d]\n', srcName, sPort, dstName, dPort);
            end
        end
    end
end

fclose(fid);
disp('Success! Open "simulink_full_dump.txt" in your current MATLAB folder.');
