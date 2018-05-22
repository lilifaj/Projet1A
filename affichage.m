function affichage(nomFichier,p1,p2, ordre)

lecture = audioread(nomFichier);
RImpulse = CalculeMLS(lecture,p1,p2,ordre);
longueur = length(RImpulse);

fourier = 20*log10(abs(fft(RImpulse))/length(RImpulse));
f = ((0:1/longueur:1-1/longueur)*48000);

% affichage

subplot(2,1,1)
plot(RImpulse);
title('R�ponse impulsionnelle');
ylabel('Amplitude');
xlabel('Echantillons')

subplot(2,1,2)
plot(f,fourier);
title('R�ponse fr�quentielle');
ylabel('Amplitude (dB)');
xlabel('Fr�quence (Hz)')



end