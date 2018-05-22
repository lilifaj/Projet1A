function S=fht(s)
taille = length(s);
nombre_etapes = ceil(log(taille)/log(2));
S=s;
for et=1:nombre_etapes
   %fprintf(1,'étape %d sur %d\n',et,nombre_etapes);
   i=2^(et-1);
   j=2^(nombre_etapes-et);
   for l=0:j-1
      for m=0:i-1
         i1=l*i*2+m+1;
         i2=i1+i;
         s1=S(i1);
         s2=S(i2);
         S(i1)=s1+s2;
         S(i2)=s1-s2;
      end
   end
end
return