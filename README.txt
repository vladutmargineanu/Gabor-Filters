Margineanu Nicolae-Vladut 341 C2

	Tema PS - Clasificare de sunete folosind filtre Gabor

 In rezolvarea temei, am realizat urmatoarele functii, dupa cum urmeaza:

 1) function gauss_filt = gaussian_filter(size, sigma)
 - primesste ca parametrii size - dimensiunea unui filtru si sigma - deviatia standard.
 - functia returneaza filtrul Gauss calculat dupa formula data.
 - aceasta functie implementeaza filtrul Gauss. Media este calculata ca size/2.
 In prima parte am calculat numarul e, dupa care am completat formula data.

 2) function [complex_h, cos_h, sin_h] = gabor_filter(size, sigma, freq)
 - functia primeste urmatorii parametrii:
  size - dimensiunea unui filtru
  sigma - deviatia standard
  freq - frecventa cu care se construieste semnalul sinusoidal
 - functia returneaza 3 vectori care reprezinta filtrul caclulat cu sinusoida respectiva
 - functia apeleaza functia gaussian_filter, dupa care se moduleaza filtrul cu functia
 sinusoida respectiva

 3) function [complex_filter, cos_filter, sin_filter] = filter_bank(M, size, freq, sigma)
 - functia primeste parametrii:
  M - numarul de filtre
  size - dimensiunea unui filtru
  freq - un vector de frecvente
 sigma - un vector de deviatii standard
 - functia returneaza 3 matrice de dimensiuni M x size (M linii cu cate un filtru calculat diferit)
 - se calculeaza setul de M filtre pentru fiecare filtru Gabor - sin, cos, sinusoida

 4) function [coefs_cos, coefs_sin] = filter_spectrum(M, size, cos_filter, sin_filter)
 - functia primeste ca parametri:
  M - numarul de filtre
  size - dimensiunea unui filtru
  cos_filter - setul de M filtre Gabor (matrice)
  sin_filter - setul de M filtre Gabor (matrice)
 - functia returneaza spectrul pentru fiecare set de filtre: cos_filter, sin_filter
  coefs_cos - spectrul pentru filtrul Gabor cos
  coefs_sin - spectrul pentru filtrul Gabor sin
 - calculam fft pentru fiecare filtru gabor, dupa care aplicam abs.
 
 5) function [cos_filter] = main_filter (plot_figs)
 - functia primeste ca parametru plot_figs - in vederea afisarii graficelor
 - functia returneaza setul de M filtre Gabor cos
 - in aceasta functia testam functionalitatea cerintelor 1-3, dupa cum urmeaza:
 a) Se apeleaza functia gaussian_filter, pentru care facem plot pe rezultat
 b) Se apeleaza functia gabor_filter pentru a calcula cele 3 filtre si 
 se verifica pentru filtrul Gabor modulat cu cos.
 c) Se apeleaza functia filter_bank pentru care calculam setul de filtre cos, sin, sinusoida.
 Afisam filtrele de tip cos, sin si sinusoidalul complex cu primii parametrii
 d) Se apeleaza functia filter_spectrum pentru a calcula spectrul pentru setul de filtre cos si sin.
 Afisam spectrul pentru setul de filtre gabor - cosinus si sinus.

 6) function [filters, feat] = get_features(audio, fs, method, plot_figs)
 Prima parte - cerinta 4 (method == 0)
 - functia primeste parametrii:
  audio - setul de sunete
  fs - fereastra
  method- implementare 4 sau 5
  plot_figs - afisare plot-uri sau nu
 - functia returneaza 
  filters - setul de M filtre Gabor modulate cu cos
  feat - matrice in care se calculeaza vectorii 2M
 - functia, in prima parte calculeaza convolutia
 - features, vectorul de trasaturi de dimensiune nc_audio x (2 * 12)
 - salvam std si mean la fiecare pas in matricea features
  Ne folosim de variabila pas - pasul pentru salvarea valorilor calculate cu mean si std in
  matricea 2*M (mean std mean std ...)
 
 A doua parte - Cerinta 5 - Creare de ferestre 
 rezolvare partiala

 In rezolvarea temei, am rezolvat cerintele 1-4 (1-Implementare filtru Gabor, 2-Creati un set de filtre,
 3-Afisati spectrul filtrelor, 4-Convolutie).
 La exericitul 4, am obtinut acuratetea de:
 ans = Accuracy on train: 0.54
 ans = Accuracy on test: 0.46

