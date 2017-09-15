function [ ] = jaccard_coeff(idMovie1, idMovie2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[ratings items userids itemids] = loadmovielens();

% LANGKAH #1
% Mencari baris yang itemsid-nya (kolom ke-2) = idMovie1
rowMov1_logic = ratings(:,2) == idMovie1;

% Mencari baris yang itemsid-nya (kolom ke-2) = idMovie2
rowMov2_logic = ratings(:,2) == idMovie2;

% Hasil dari PROSES#1 akan menghasilkan matriks logical 0 & 1 yang
% akan digunakan untuk memfilter baris pada matriks 'ratings' yang memiliki
% idMovie.

% LANGKAH #2
% Memfilter matriks rating yang itemsid-nya = idMovie1
rowMov1 = ratings(rowMov1_logic,:);

% Memfilter matriks rating yang itemsid-nya = idMovie1
rowMov2 = ratings(rowMov2_logic,:);

% LANGKAH #3
% Mencari user yang merate kedua movie
f11 = 0;

for i=1:size(rowMov1)
    for j=1:size(rowMov2)
        if rowMov1(i,1) == rowMov2 (j,1)
            f11 = f11 + 1;
%             untuk memastikan jumlah f11, dapat menggunakan :
%             text = sprintf('%d \t|%d \t| %d \t | %d \t | %d \t', f11,i,j,rowMov1(i,1),rowMov2 (j,1));
%             disp(text);
        end
    end
end

print_f11 = sprintf('Jumlah user yang merate kedua film : \t %d',f11);
disp(print_f11);

% Menghitung user yang merate Movie 1
[f10 ~] = size(rowMov1);
f10 = f10 - f11;
print_f10 = sprintf('Jumlah user yang merate film (%d) %s : \t %d',idMovie1,items{1,idMovie1},f10);
disp(print_f10);

% Menghitung user yang merate Movie 2
[f01 ~] = size(rowMov2);
f01 = f01 - f11;
print_f01 = sprintf('Jumlah user yang merate film (%d) %s : \t %d',idMovie2,items{1,idMovie2},f01);
disp(print_f01);

% LANGKAH 4
% Menghitung jaccard
jaccard = f11 / (f01 + f10 + f11);
print_jaccard = sprintf('Jaccard coefficient : %.3f',jaccard);
disp(print_jaccard);
end
