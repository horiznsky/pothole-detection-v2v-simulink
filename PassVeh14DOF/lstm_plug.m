net = importNetworkFromONNX('D:\IOT PROJECT\models\pothole_lstm.onnx', ...
    'InputDataFormats', 'BTC', ...
    'OutputDataFormats', 'BC');
save('pothole_net.mat', 'net');

% Quick sanity check before putting it in Simulink
testProb = predict(net, single(zeros(30, 3)));
disp(['Sanity check output: ' num2str(testProb)]);