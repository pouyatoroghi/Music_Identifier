function [downsampled_Fs, resampled_audio] = import_audio(path, song_num, format)
    % import the audio 
    [audio, Fs] = audioread([path, 'music', num2str(song_num), format]);
    % getting mean over right and left channels
    if(size(audio,2)==2)
        audioMono=(audio(:,1)+audio(:,2))/2;
    else
        audioMono=audio;
    end
    % downsample the audio to 8 KHz
    downsampled_Fs = 8000;
    [P,Q] = rat(downsampled_Fs/Fs);
    resampled_audio=resample(audioMono,P,Q);
end