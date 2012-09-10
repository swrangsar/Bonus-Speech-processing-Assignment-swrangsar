function [impulseResponse] = vowelResonatorA(samples)
%VOWELRESONATORA(SAMPLES) Creates a new filter WITH 3 formant frequencies.
%  VOWELRESONATORA creates a new transfer function H(z)
%  for a digital filter with three formants. It uses the input
%  string 'VOWEL' to do
%  this. SAMPLES is the no of samples of impulse response required within 1 second of time.

vowel = 'a';
F1 = 730; F2 =1090; F3 = 2440;

Bw = 100;
Fs = 16000; % 16 kHz
poleRadius = exp(-(pi*Bw/Fs));
poleTheta = 2*pi*F1/Fs;
pole1 = poleRadius*exp(1i*poleTheta);
pole2 = poleRadius*exp(-1i*poleTheta);

M = 16000;
% step = Fs/M;
f = 0:1:M-1;
% f = f*step;
r = 1;
z = r*exp(1i*2*pi*f/Fs);
H1 = (z.*z)./((z-pole1+eps).*(z-pole2+eps));
poleTheta = 2*pi*F2/Fs;
pole1 = poleRadius*exp(1i*poleTheta);
pole2 = poleRadius*exp(-1i*poleTheta);
H2 = (z.*z)./((z-pole1+eps).*(z-pole2+eps));
poleTheta = 2*pi*F3/Fs;
pole1 = poleRadius*exp(1i*poleTheta);
pole2 = poleRadius*exp(-1i*poleTheta);
H3 = (z.*z)./((z-pole1+eps).*(z-pole2+eps));
H = H1.*H2.*H3;


% mag = 20*log10(abs(H));
% figure, plot(f, mag);
% title(['Magnitude plot for vowel /', vowel, '/']);
% xlabel('Frequency (Hz)');
% ylabel('Magnitude (dB)');
% length(H)

impulseResponse = real(ifft(H, samples)); % do ifft on centered Fourier transform

% M = length(impulseResponse)
% n = 0:1:M-1;
% t = n/M;
% figure, plot(t, impulseResponse);
% title(['Impulse response for vowel /', vowel, '/']);
% xlabel('Time (sec)');
% ylabel('Impulse response h(t)');