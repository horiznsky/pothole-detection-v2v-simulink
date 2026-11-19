model = 'PotholeDetection3D';
open_system(model);

% 1. Add Multimedia Reader
mmBlk = [model '/Real Dashcam Input'];
if isempty(find_system(model, 'SearchDepth', 1, 'Name', 'Real Dashcam Input'))
    try
        load_system('visionsources');
        srcBlock = 'visionsources/From Multimedia File';
    catch
        load_system('dspsrcs4');
        srcBlock = 'dspsrcs4/From Multimedia File';
    end

    add_block(srcBlock, mmBlk, ...
        'inputFilename', 'simulink_ready_video.mp4', ...
        'Position', [150, 480, 280, 540]);

    % Apply optional format parameters safely (defaults are already Video + RGB)
    try set_param(mmBlk, 'outputStreams', 'Video only'); catch; end
    try set_param(mmBlk, 'outputColorFormat', 'RGB'); catch; end
    try set_param(mmBlk, 'imagePorts', 'One multidimensional signal'); catch; end
end

% 2. Add a Manual Switch to toggle sources
if isempty(find_system(model, 'SearchDepth', 1, 'Name', 'Camera Toggle'))
    add_block('simulink/Signal Routing/Manual Switch', [model '/Camera Toggle'], ...
        'Position', [380, 440, 410, 480]);

    % Safely remove existing direct lines from Simulation 3D Camera
    try delete_line(model, 'Simulation 3D Camera/1', 'Video Viewer/1'); catch; end
    try delete_line(model, 'Simulation 3D Camera/1', 'To Workspace/1'); catch; end

    add_line(model, 'Simulation 3D Camera/1', 'Camera Toggle/1', 'autorouting', 'on');
    add_line(model, 'Real Dashcam Input/1', 'Camera Toggle/2', 'autorouting', 'on');

    % Reconnect downstream outputs
    add_line(model, 'Camera Toggle/1', 'Video Viewer/1', 'autorouting', 'on');
    add_line(model, 'Camera Toggle/1', 'To Workspace/1', 'autorouting', 'on');
end

save_system(model);
disp('AutoRouter completed successfully.');