function [P1,P2,MLS]=GenereMLS(ordre)
% [P1,P2,MLS]=genereMLS(ordre)
switch(ordre)
    case 3
        pol=[1 1 0 1];
    case 4
        pol=[1 1 0 0 1];
    case 5
        pol=[1 0 0 1 0 1];
    case 6
        pol=[1 1 0 0 0 0 1];
    case 7
        pol=[1 1 0 0 0 0 0 1];
    case 8
        pol=[1 0 1 1 1 0 0 0 1];
    case 9
        pol=[1 0 0 0 1 0 0 0 0 1];
    case 10
        pol=[1 0 0 1 0 0 0 0 0 0 1];
    case 11
        pol=[1 0 1 0 0 0 0 0 0 0 0 1];
    case 12
        pol=[1 1 0 0 1 0 1 0 0 0 0 0 1];
    case 13
        pol=[1 1 0 1 1 0 0 0 0 0 0 0 0 1];
    case 14
        pol=[1 1 0 0 0 0 1 0 0 0 1 0 0 0 1];
    case 15
        pol=[1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1];
    case 16
        pol=[1 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 1];
    case 17
        pol=[1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1];
    case 18
        pol=[1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1];
    otherwise
        fprintf('\nOrdre %d incorrect\n',ordre);
        P1=0;
        P2=0;
        MLS=0;
        return;
end
entree=ones(1,ordre);
lg = length(entree);
n_k = [entree, zeros(1,ordre+1-lg)];
MLS = zeros(1,2^ordre-1);

for i = 1:2^ordre-1
    MLS(i) = n_k(1);
    n_k = [n_k(2:ordre+1),0];
    n_k(ordre+1)=0;
    for j=1:ordre
        if (pol(j)==1)
            n_k(ordre+1)=xor(n_k(ordre+1), n_k(j));
        end
    end
end
N=2^ordre;

P1=zeros( N-1, 1 );

for i=1:N-1
    tag=0;
    for j=0:ordre-1
        tag=tag+MLS( mod2(i-j,N-1) )*2^j;
    end
    P1(tag)=i;
end

P2=zeros( N-1, 1 );

for i=1:N-1
    tag=0;
    for j=0:ordre-1
        tag=tag+MLS( mod2(P1(2^j)-i+1,N-1) )*2^j;
    end
    P2(i)=tag;
end
MLS = -2*MLS + 1; % passage du binaire au signal
end