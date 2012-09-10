clear all; close all;
Fs = 16000;

note = { noteWithVowelA(220, 100),
noteWithVowelA(220, 100),
noteWithVowelA(247, 100),
noteWithVowelA(247, 100),

noteWithVowelA(220, 150),
noteWithVowelA(196, 50),
noteWithVowelA(185, 200),

noteWithVowelA(220, 100),
noteWithVowelA(220, 100),
noteWithVowelA(247, 100),
noteWithVowelA(247, 100),

noteWithVowelA(220, 150),
noteWithVowelA(196, 50),
noteWithVowelA(185, 200),


noteWithVowelA(220, 100),
noteWithVowelA(220, 100),
noteWithVowelA(247, 100),
noteWithVowelA(277, 100),

noteWithVowelA(294, 350),
noteWithVowelA(330, 50),

noteWithVowelA(262, 200),
noteWithVowelA(247, 200),

noteWithVowelA(220, 400)};


% for k = 1:length(note)
%     sound(note{k}, Fs);
% end

song = cat(2, note{:});
sound(song, Fs);
wavwrite(song, Fs, 8, 'songOfNotes8bit.wav');
wavwrite(song, Fs, 16, 'songOfNotes16bit.wav');
wavwrite(song, Fs, 24, 'songOfNotes24bit.wav');
wavwrite(song, Fs, 32, 'songOfNotes32bit.wav');