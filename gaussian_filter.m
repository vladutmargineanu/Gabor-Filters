% Tema PS 2020
% Implementrea filtrului lui Gauss

function gauss_filt = gaussian_filter(size, sigma)
  
  % calculam media
  miu = size / 2;
  
  for k = 1 : size
    
    % calculam puterea numarului e
    gauss_filt(k) = power(e, (-1) * (k - miu) * (k - miu) / (2 * sigma * sigma));
    
    % calculam formula finala
    gauss_filt(k) = (1 / (sigma * sqrt(2 * pi))) * gauss_filt(k);
    
  end
  
endfunction
