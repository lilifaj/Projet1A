function filename=CreeWavMLS(duree,ordre,nbits,fe,fc)
%filename = CreerWavMLS(duree,ordre,nbits,fs,fc);
% Crée un fichier .wav contenant une MLS répétée N fois
% Entrées:
%   duree: durée en secondes
%   ordre: ordre de la MLS
%   nbits: nombre de bits de codage
%   fe: fréquence d'échantillonnage
%   fc : fréquence de coupure du filtre Passe-bas du 1er ordre (0: pas de filtre)
% Sortie:
%   filename: le nom du fichier
%             MLS_ordre_nbits_fe_N_fc
TailleMLS=2^ordre-1;
N=ceil((duree*fe)/TailleMLS);
filename=sprintf('MLS_%d_%d_%.0fk_%d_%.0fk.wav',ordre,nbits,floor(fe/1000),N,fc/1000);
[P1,P2,MLS]=GenereMLS(ordre);
SRC=MLS;
for i=1:N-1
    SRC=[SRC MLS];
end

% filtrage passe-bas de la MLS à fc (2e ordre)
if fc>0
    wc=2*pi*fc;
    tc=1/wc;
    p=tf('s');
    Hc=1/(1+tc*p);
    Hn=c2d(Hc,1/fe,'tustin');
    num=cell2mat(Hn.Numerator);
    den=cell2mat(Hn.Denominator);
    Y=filter(num,den,SRC);
else
    Y=SRC;
end
audiowrite(filename,Y,fe,'BitsPerSample',32);
return


