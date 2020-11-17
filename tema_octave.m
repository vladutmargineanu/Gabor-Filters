% Tema PS 2020
% Autor: Andrei Nicolicioiu
 
clear all 
close all
 
% [audio_train,labels_train, audio_test,labels_test] = load_data();
load('data.mat')
method = 0
plot_figs = true
 
% calculam vectorii de trasaturi pentru fiecare fisier din datasetul de train si de test
% get_features primeste toate sunetele din set date intr-o matrice
% de dimensiune Dimensiune_dataset x Numaresults_esantioane si returneaz? toate
% featurile acestor sunete intr-o matrice de dimensiune Numaresults_sunete x (2*M)
 
% TODO: calculati featurile folosind un set de M filtre Gabor
% method == 0: folositi metoda de la subpunctul 4 pentru filtrare
% method == 1: folositi metoda de la subpunctul 5 pentru filtrare
% plot_figs == true afisati figurile cerute in tema
 
[filters, feat_train] = get_features(audio_train, fs, method, plot_figs);
[filters, feat_test] = get_features(audio_test, fs, method, plot_figs);
 
% antrenam un clasificator
model = train_sc(feat_train,labels_train,'LDA');
 
% prezicem clasele pentru datasetul de train si de test
results_train = test_sc(model,feat_train);
results_test = test_sc(model,feat_test);
 
% calculam acuratetea pe train si test
acc_train = mean(results_train.classlabel(:) == labels_train(:));
acc_test  = mean(results_test.classlabel(:) == labels_test(:));
 
sprintf('Accuracy on train: %0.2f', acc_train)
sprintf('Accuracy on test: %0.2f', acc_test)
 
 
% TODO: verificati calitativ cateva exemple din setul de test. 
% comparati clasa corecta si clasa presiza cu sunetul auzit
 
% alegem random un fisier audio si verificam daca am clasificat corect
% labels_name = ["Dog"; "Rooster"; "Rain" ; "Waves"; "Fire"; "Baby"; ...
%     "Sneezing"; "Clock"; "Helicopter"; "Chainsow"];
% 
% r = round(rand() * 100);
% sound(audio_test(:,r),fs);
% sprintf('Clasa corecta: %s', labels_name(labels_test(r),:))
% sprintf('Clasa prezisa: %s', labels_name(results_test.classlabel(r),:))