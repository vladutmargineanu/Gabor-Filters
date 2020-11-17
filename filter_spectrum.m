% Tema PS 2020
% Implementare functie afisare spectrul filtrelor
  
function [coefs_cos, coefs_sin] = filter_spectrum(M, size, cos_filter, sin_filter)

  for i = 1 : M
    
    # calculam fft pentru filtrul gabor cos
    coefs_cos(i, :) = abs((fft(cos_filter(i, [1:size]))));
    # calculam fft pentru filtrul gabor sin
    coefs_sin(i, :) = abs((fft(sin_filter(i, [1:size]))));
    
  end
  
endfunction
