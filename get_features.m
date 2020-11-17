% Tema PS 2020
% Implementare functie get_features - Convolutie
  
function [filters, feat] = get_features(audio, fs, method, plot_figs)
  % Exercitiul 4 - Convolutie
  if (method == 0)
    # Functia pentru figurile din cerintele 1-3, returneaza setul de filtre cos
    filters = main_filter(plot_figs);
     
    # Calculam dimensiunile matricei audio si filters
    [nr_audio, nc_audio] = size(audio);
    [nr_filters, nc_filters] = size(filters);
    
    # features, vectorul de trasaturi de dimensiune nc_audio x (2 * 12)
    # salvam std si mean la fiecare pas in matricea features
    feat = zeros(nc_audio, 2 * nr_filters);
    
    for i = 1:nc_audio
      
      # pasul pentru salvarea valorilor calculate cu mean si std
      step = 1;
      
      for j = 1:nr_filters
        
        result_conv = conv(audio(:, i), filters(j, :));
        # inseram valorile calculate cu conv - std si mean
        feat(i, step) = mean(result_conv);
        feat(i, step + 1) = std(result_conv);
        # pasul creste cu valoarea 2
        step = step + 2;
        
      endfor
      
    endfor
    
  % Exercitiul 5 - Creare ferestre
  else
    
    # Functia pentru figurile din cerintele 1-3, returneaza setul de filtre cos
    filters = main_filter(plot_figs);
     
    # Calculam dimensiunile matricei audio si filters
    [nr_audio, nc_audio] = size(audio);
    [nr_filters, nc_filters] = size(filters);
    
    # features, vectorul de trasaturi de dimensiune nc_audio x (2 * 12)
    # salvam std si mean la fiecare pas in matricea features
    feat = zeros(nc_audio, 2 * nr_filters);
    size_window = nc_audio;
    t = 35/1000;
    # numarul de esantioane, fs frecventa de esantionare al fisierului audio
    # inmultesc cu perioada de timp pe care o vreau si obtin cate esantioane are
    K_window = round(25/1000 * fs);
    # numarul de ferestre
    F_window = round(size_window/t);
    
    window_audio = zeros(F_window, K_window);
    
    for i = 1:F_window
      for j = 1: nc_audio
        
        window_audio(i, j) = audio(i, j);
        
      endfor
    endfor
    
  endif
  
endfunction
