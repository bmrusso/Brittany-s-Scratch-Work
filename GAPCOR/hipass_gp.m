%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PROGRAM:
% hipass_gp.m
%
% PROGRAMMER:
% Matt Haney
%
% Last revision date:
% 22 June 2010
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Program hipass_gp is a Matlab function that applies a high-pass filter. 
% The filtering is not done in the Fourier transform domain and, as a
% result, care is taken to treat gaps in the data (samples with no data). 
% By using a recursive technique the filtering is done fast. The high-pass
% filter is obtain by subtracting a low-pass version of the input data 
% (low-pass with a comb filter) from itself.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input
%
% 1. scalar wlen: number of data points on one side of the filter window
%
% 2. vector d1n: input data
%
% 3. scaler nd1: the value given to a sample when there is no data
%    
% Output
%
% 1. vector d1n: a high-pass version of the input data (overwritten)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function d1n=hipass_gp(wlen,d1n,nd1)

% the length of the data vector
slen = length(d1n);

% mirror the data on the ends 
d1n2 = [ d1n((wlen+1):-1:2) d1n d1n((slen-1):-1:(slen-wlen)) ];

% initiate the recursion
ii=wlen+1;
% the sum of the non-NO_DATA values 
ntmp = sum((d1n2((ii-wlen):(ii+wlen)) ~= nd1).*d1n2((ii-wlen):(ii+wlen)));
% the number of non-NO_DATA values 
dtmp = sum(d1n2((ii-wlen):(ii+wlen)) ~= nd1);

% continue the recursion
for ii=(wlen+1):(wlen+slen-1)
    
    % if no data, it becomes zero; otherwise, remove the mean
    d1n(ii-wlen) = ...
        (d1n(ii-wlen) ~= nd1)*(d1n(ii-wlen) - (ntmp/(dtmp+(dtmp == 0))));
    
    % recursive summation
    ntmp = ntmp - ((d1n2(ii-wlen) ~= nd1)*d1n2(ii-wlen)) ...
                + ((d1n2(ii+(wlen+1)) ~= nd1)*d1n2(ii+(wlen+1)));
    dtmp = dtmp - (d1n2(ii-wlen) ~= nd1) + (d1n2(ii+(wlen+1)) ~= nd1);
    
end

% final index
ii = ii+1;
d1n(ii-wlen) = ...
    (d1n(ii-wlen) ~= nd1)*(d1n(ii-wlen) - (ntmp/(dtmp+(dtmp == 0))));

