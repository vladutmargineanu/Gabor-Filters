% Tema PS 2020
% main function - testare cerinte 1-3

function [cos_filter] = main_filter (plot_figs)

% Cerinta 1 - Implementare filtru Gabor

  # Gaussian Filter
  size_gaussian = 1102;
  sigma_gaussian = 187.2109;
  gaussFilter_model = zeros(1, size_gaussian);
  gaussFilter_model = gaussian_filter(size_gaussian, sigma_gaussian);
  
  if (plot_figs == true)
    
    figure 1
    plot(gaussFilter_model, 'r');
    xlabel("Time");
    ylabel("Magnitude");
    title("Gaussian Filter Model");
    hold on;
    
  endif
  
  # Gabor Filter - cos
  # Verificare filtru Gabor modulat cu cos
  complex_model = zeros(1, size_gaussian);
  cos_model = zeros(1, size_gaussian);
  sin_model = zeros(1, size_gaussian);
  freq_model = 0.0110;
  
  [complex_model, cos_model, sin_model] = gabor_filter(size_gaussian, sigma_gaussian, freq_model);
  
  if (plot_figs == true)
    
    figure 2
    plot(cos_model, 'r');
    xlabel("Time");
    ylabel("Magnitude");
    title("Gabor Filter Model - cos");
    hold on;
    
  endif
  
% Cerinta 2 - Setul de filtre

  # Apelam functia care creaza setul de M filtre - functia filter_bank
  M = 12;
  size = 1102;
  freq = [0.0027, 0.0089, 0.0173, 0.0284, 0.0433, 0.0632, 0.0898, 0.1254, 0.1730, 0.2365, 0.3215, 0.4350];
  sigma = [187.2109, 140.0663, 104.7939, 78.4041, 58.6599, 43.8878, 32.8357, 24.5668, 18.3803, 13.7516, 10.2886, 7.6977];
  # Stocam cele M filtre calculate pentru fiecare varianta de filtru in parte (3 matrice)
  # Matrice de dmensiune: M x size (M linii cu cate un filtru calculat diferit)
  complex_filter = zeros(M, size);
  cos_filter = zeros(M, size);
  sin_filter = zeros(M, size);
  # Calculam setul de M filtre pentru fiecare filtru Gabor
  [complex_filter, cos_filter, sin_filter] = filter_bank(M, size, freq, sigma);
  
  # Afisam filtrele de tip cos, sin si sinusoidalul complex cu primii parametrii
  if (plot_figs == true)
  
    figure 3
    plot(sin_filter(1, :), 'r');
    xlabel("Time");
    ylabel("Magnitude");
    title("Gabor Filter - Sin");
    hold on;
  
    figure 4
    plot(cos_filter(1, :), 'g');
    xlabel("Time");
    ylabel("Magnitude");
    title("Gabor Filter - Cos");
    hold on;
    
    figure 5
    plot( complex_filter(1, :), 'b');
    xlabel("Time");
    ylabel("Magnitude");
    title("Gabor Filter - Sinusoidala Complexa");
    
  endif
  
% Cerinta 3 - Spectrul filtrelor
  
  # Calculam spectrul pentru fiecare set de filtre: cos_filter, sin_filter
  coefs_cos = zeros(M, size);
  coefs_sin = zeros(M, size);
  
  [coefs_cos, coefs_sin] = filter_spectrum(M, size, cos_filter, sin_filter);
  # Valorile orizontale
  f = [1:size/2];
  
  # Afisam spectrul pentru setul de filtre gabor - cosinus si sinus
  if (plot_figs == true)
    
    figure 6
    for i = 1:M
      plot(f, coefs_cos(i,[1:(size/2)]));
      hold on;
    end
    
    xlabel("Time");
    ylabel("Magnitude");
    title("Spectrul Setului de Filtre Gabor - Cosinus");
    
    figure 7
    for i = 1:M
      plot(f, coefs_sin(i,[1:(size/2)]));
      hold on;
    end
    xlabel("Time");
    ylabel("Magnitude");
    title("Spectrul Setului de Filtre Gabor - Sinus");
    
  endif
 
endfunction
  