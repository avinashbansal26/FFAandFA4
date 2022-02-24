function [FA]=GFA(D)
% D must be square matrix of any size or n*n*sizeX*sizeY. It's a general formula to calulate the Fractional Anisotropy in 2D
n=size(D,1);
for i=1:size(D,3)
    for j=1:size(D,4)
        eval=eig(squeeze(D(:,:,i,j)));
        MD=sum(eval)/n;
        FA(i,j)=sqrt(n/(n-1))*sqrt(sum((eval-MD).^2))/sqrt(sum(eval.^2));
    end
end
end