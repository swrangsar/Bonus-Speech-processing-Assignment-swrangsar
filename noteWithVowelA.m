function note = noteWithVowelA(F0, duration)
%NOTEWITHVOWELA produces a note of vowel /a/ with pitch F0 and duration
%'duration' ms
Fs = 16000;
samples = 16000;
impulseResponse = vowelResonatorA(samples);

step = round(samples/F0);
impulseTrain = zeros(1, samples);
for k = 1:step:samples
    impulseTrain(k) = 1;
end
y = conv(impulseResponse, impulseTrain);
requiredLength = round(duration*(samples/1000));
note = y(1:requiredLength);
% n = 0:length(note)-1;
% t = n/samples;
% figure, plot(t, note);
% title(['Time domain waveform for vowel /a/ and F0 = ', num2str(F0), ' and duration = ', num2str(duration), ' ms']);
% xlabel('Time (sec)');
% ylabel('Output y(t)');

% sound(note, Fs);