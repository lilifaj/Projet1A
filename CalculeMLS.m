function Rimpuls=CalculeMLS(Mesure,P1,P2,ordre)
% détermination de la RI 1
N=2^ordre-1;
S2=zeros(N+1,1);
for i=1:N
    S2(i+1)=Mesure( P1(i) );
end
%S2(1)=0;
S3=fht(S2);
S4=S3(2:length(S3));
Rimpuls=zeros(N,1);
for i=1:N
    Rimpuls(i)=1/N*S4( P2(i) );
end
end