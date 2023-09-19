function single_sided_power_spectrum = FFT(X)
    n=length(X);
    Y=fftshift(fft(X));
    power=(abs(Y)/n).^2; 
    power=power(n-(floor(n/2)):n);
    power(1)=power(1)/2;
    single_sided_power_spectrum=power*2+rand(1+floor(n/2),1)/10000;
end