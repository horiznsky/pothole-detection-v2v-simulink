%% Standardize YOLOv8 Video for Simulink 3D Co-Simulation
inputVideoPath = 'sample_video.mp4';
outputVideoPath = 'simulink_ready_video.mp4';

vidIn = VideoReader(inputVideoPath);
vidOut = VideoWriter(outputVideoPath, 'MPEG-4');
vidOut.FrameRate = 60; % Match the 1/60 sample time of the model
open(vidOut);

% Calculate frame duplication/skipping ratio to hit 60 FPS
fpsRatio = 60 / vidIn.FrameRate;
frameTime = 0;

while hasFrame(vidIn)
    rawFrame = readFrame(vidIn);

    % Resize to [480 640] to perfectly match the Simulation 3D Camera output
    resizedFrame = imresize(rawFrame, [480, 640]);

    % Duplicate frames if original is 30 FPS to maintain real-time 60 FPS speed
    framesToWrite = round((vidIn.CurrentTime * 60) - frameTime);
    for i = 1:framesToWrite
        writeVideo(vidOut, resizedFrame);
        frameTime = frameTime + 1;
    end
end
close(vidOut);
disp('Saved simulink_ready_video.mp4. Ready for Simulink injection.');