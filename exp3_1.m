[s,Fs] = audioread('piano2.wav');
subplot(2,2,1);
y1 = fn(Fs,s);

[s,Fs] = audioread('trumpet2.wav');
subplot(2,2,2);
y2 = fn(Fs,s);

[s,Fs] = audioread('violin2.wav');
subplot(2,2,3);
y3 = fn(Fs,s);

[s,Fs] = audioread('flute2.wav');
subplot(2,2,4);
y4 = fn(Fs,s);

function P1 = fn(Fs,X)
T = 1/Fs;
L = length(X);
t = (0:L-1)*T;
Y = fft(X);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L-1))/L;
P3 = mag2db(P2);
plot(f,P3);
xlabel('frequency');
ylabel('magnitude(in db)');
[peaks, peak_indices] = findpeaks(abs(X), 'SortStr', 'descend', 'NPeaks', 1);
fundamental_frequency = f(peak_indices)
end