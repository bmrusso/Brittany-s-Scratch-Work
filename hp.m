function newsig=hp(signal,samprate,cutofffreq);
%newsig=hp(signal,samprate,cutofffreq);
%high pass filter given the initial signal, sample rate, and a cutoff
%frequency

[b,a]=butter(4,cutofffreq/2/samprate,'high');
newsig=filter(b,a,signal);