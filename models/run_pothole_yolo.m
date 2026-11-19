function prob = run_pothole_yolo(img)
persistent net frameCount lastProb
if isempty(net)
    s = load('yolo_pothole_net.mat');
    net = s.yoloNet;
    frameCount = 0;
    lastProb = 0.0;
end
frameCount = frameCount + 1;
if mod(frameCount, 3) ~= 1
    prob = lastProb;
    return;
end
inImg = single(imresize(img, [640 640]));
if max(inImg(:)) > 1.5
    inImg = inImg / 255.0;
end
out = squeeze(predict(net, inImg));
if size(out, 1) == 7
    lastProb = double(max(out(7, :)));
else
    lastProb = double(max(out(:, 7)));
end
prob = lastProb;
if mod(frameCount, 30) == 1
    fprintf('Frame %d | Max Pixel: %.1f | YOLO Pothole Prob: %.4f\n', ...
        frameCount, max(single(img(:))), lastProb);
end
end
