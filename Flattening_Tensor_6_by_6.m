function [T6D]=Flattening_Tensor_6_by_6(D)
% Output: T6D which is a 6 * 6 * sizeX * sizeY matrix.
f=sqrt(2);
% Where D is a matrix of 15 coff * sizeX * sizeY
    for i=1:size(D,2)
        for j=1:size(D,3)
            T6D(:,:,i,j)= [ D(15,i,j),         (1/6)*D(12,i,j),    (1/6)*D(10,i,j),   (1/4)*f*D(14,i,j), (1/4)*f*D(13,i,j),  (1/12)*f*D(11,i,j);
                (1/6)*D(12,i,j),     D(5,i,j),          (1/6)*D(3,i,j),    (1/4)*f*D(9,i,j),  (1/12)*f*D(8,i,j),  (1/4)*f*D(4,i,j);
                (1/6)*D(10,i,j),    (1/6)*D(3,i,j),     D(1,i,j),          (1/12)*f*D(7,i,j), (1/4)*f*D(6,i,j),   (1/4)*f*D(2,i,j);
                (1/4)*f*D(14,i,j),  (1/4)*f*D(9,i,j),   (1/12)*f*D(7,i,j), (1/6)*2*D(12,i,j), (1/12)*2*D(11,i,j), (1/12)*2*D(8,i,j);
                (1/4)*f*D(13,i,j),  (1/12)*f*D(8,i,j),  (1/4)*f*D(6,i,j),  (1/12)*2*D(11,i,j),(1/6)*2*D(10,i,j),  (1/12)*2*D(7,i,j);
                (1/12)*f*D(11,i,j), (1/4)*f*D(4,i,j),   (1/4)*f*D(2,i,j),  (1/12)*2*D(8,i,j), (1/12)*2*D(7,i,j),  (1/6)*2*D(3,i,j)];
        end
    end
end