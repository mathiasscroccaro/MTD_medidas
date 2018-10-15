% Arquivo utilizado para plotar todos os dados selecionados na interface web
% de maneira junta

close all;
clear all;

dir = 'L02';

[arquivos,erro,msg] = readdir(dir);

for arquivo = arquivos(3:end)'
    arquivoF = strsplit(char(arquivo),'.')(1);
    [medidor,fMin,fMax] = strread(char(arquivoF),'L02_M%u_%u-%u');
    dados = dlmread(strcat(dir,'/',char(arquivo)))(5:end,1);
    delta_freq = (fMax-fMin);
    freqs = linspace(fMin,fMax,700);
    figure(1);
    size(freqs);
    size(dados);
    plot(freqs,dados);
    axis([fMin fMax -90 -50])
    xlabel('Frequencia [MHz]')
    ylabel('Potencia [dB]')
    title(sprintf('Espectro eletromagnetico %s M%d - %d a %d MHz',dir,medidor,fMin,fMax))
    string = sprintf("mv relatorio.pdf graficos/relatorio_%s_M%d_%d-%d.pdf",dir,medidor,fMin,fMax)
    print relatorio.pdf
    sleep(0.05)
    system(string);
    sleep(0.05)   
endfor