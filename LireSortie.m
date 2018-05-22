function [Sortie,fe,ordre,N]=LireSortie(filename)
% [Sortie,fe, ordre,N]=LireSortie(filename);
% Entr�es:
%   filename: nom du fichier audio
% Sorties:
%   fe: fr�quence d'�chantillonnage
%   ordre: ordre de la MLS
%   N: nombre de MLS successives
info=audioinfo(filename);
fprintf('\nCompression: %s',info.CompressionMethod);
fprintf('\nFe: %.0f',info.SampleRate);
fprintf('\nnbits: %d',info.BitsPerSample);
fprintf('\n');
[Sortie,fe]=audioread(filename);
A=sscanf(filename,'MLS_%d_%d_%dk_%d_%d.wav');
ordre=A(1);
N=A(4);
fe=info.SampleRate;
