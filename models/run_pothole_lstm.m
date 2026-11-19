function prob = run_pothole_lstm(win_norm)
persistent net
if isempty(net)
    s = load('pothole_net.mat');
    net = s.net;
end
% Scale damped 14-DOF CG acceleration to match real smartphone IMU range
scaled_win = single(win_norm * 4.0);
prob = double(predict(net, scaled_win));
end
