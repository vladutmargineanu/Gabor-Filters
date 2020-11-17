% Tema PS 2020
% Cerinta 1 - Implementare filtru Gabor

function [complex_h, cos_h, sin_h] = gabor_filter(size, sigma, freq)
      
   gauss_filt = gaussian_filter(size, sigma);
   
   for i = 1 : size
     
     % Modulare filtru Gaussian cu functia sin
     sin_h(i) = gauss_filt(i) * sin(2 * pi * freq * i);
     % Modulare filtru Gaussian cu functia cos
     cos_h(i) = gauss_filt(i) * cos(2 * pi * freq * i);
     % Modulare filtru Gaussian cu functia sinusoida complexa
     complex_h(i) = gauss_filt(i) * exp(1i * 2 * pi * freq * i);
     
   end

endfunction
