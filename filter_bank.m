% Tema PS 2020
% Cerinta 2: Set de M filtre

function [complex_filter, cos_filter, sin_filter] = filter_bank(M, size, freq, sigma)
 
 # Filtrul calculat cu frecventa si deviatia standard la pasul i
 complex_set = zeros(1, size);
 cos_set = zeros(1, size);
 sin_set = zeros(1, size);
         
 for i = 1 : M
       
  [complex_set, cos_set, sin_set] = gabor_filter(size, sigma(i), freq(i));
  
  # Inlocuim in matrici liniile noi calculate
  complex_filter(i,:) = complex_set;
  cos_filter(i,:) = cos_set;
  sin_filter(i,:) = sin_set;
     
 end
 
endfunction