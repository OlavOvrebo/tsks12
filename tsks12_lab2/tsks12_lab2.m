%% TSKS12 lab2 

%% task 1

datalen = 100;
iterations = 1;
snr_steps = 1000;


BER_vec = zeros(1, snr_steps);
BER_vec2 = zeros(1, snr_steps);

for step = 1:snr_steps
    SNR = 6*step/snr_steps;
    startData = randi([0 1], datalen, 1);
    data = startData;
    data2 = startData;
    %for iteration = 1:iterations
        data = send_recieve(data, SNR, 1);
        data2 = send_recieve(data2, SNR, 0);
    %end
    
    BER1 = sum(bitxor(startData', data')) / datalen;
    BER2 = sum(bitxor(startData', data2'))/ datalen;
    BER_vec(step) = BER1;
    BER_vec2(step) = BER2;
end

plot(BER_vec);
hold on;
plot(BER_vec2);
hold off;