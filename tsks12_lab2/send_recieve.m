function [data] = send_recieve(data, SNR, turbo)

dataLen = size(data, 1);
InterleaverIndices = randperm(dataLen, dataLen)';
trellis = poly2trellis(3, [7 5], 7);
enc     = comm.TurboEncoder(trellis, InterleaverIndices);
dec     = comm.TurboDecoder(trellis, InterleaverIndices);
mod     = comm.BPSKModulator();
demod   = comm.BPSKDemodulator();
channel = comm.AWGNChannel('NoiseMethod', 'Signal to noise ratio (SNR)', 'SNR', SNR);
if turbo
    data  = step(dec, step(demod, step(channel, step(mod, step(enc, data))))); 
else
    data = step(demod, step(channel, step(mod, data)));
end
%diff = bitxor(data', output');

%nr_errors = sum(diff);
%BER = nr_errors/dataLen;