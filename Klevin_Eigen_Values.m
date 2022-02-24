function [S41,S42,S43,S44,S45,S46,J41,J42,J43,J44,J45,J46]=Klevin_Eigen_Values(D)
f=sqrt(2);
% Where TD is a either (15 coff *sizeX * sizeY) martix or  ( 6 * 6 * sizeX * sizeY)
if size(D,1)==15
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
if (size(D,1)==6 && size(D,2)==6)
    T6D=D;
end

for i=1:size(T6D,3)
    for j=1:size(T6D,4)
        
        L= eig(squeeze(T6D(:,:,i,j)));
        pi=1;
        S41(i,j)=(L(1))^pi+(L(2))^pi+(L(3))^pi+(L(4))^pi+(L(5))^pi+(L(6))^pi;
        
        pi=2;
        S42(i,j)=(L(1))^pi+(L(2))^pi+(L(3))^pi+(L(4))^pi+(L(5))^pi+(L(6))^pi;
        
        pi=3;
        S43(i,j)=(L(1))^pi+(L(2))^pi+(L(3))^pi+(L(4))^pi+(L(5))^pi+(L(6))^pi;
        
        pi=4;
        S44(i,j)=(L(1))^pi+(L(2))^pi+(L(3))^pi+(L(4))^pi+(L(5))^pi+(L(6))^pi;
        
        pi=5;
        S45(i,j)=(L(1))^pi+(L(2))^pi+(L(3))^pi+(L(4))^pi+(L(5))^pi+(L(6))^pi;
        
        pi=6;
        S46(i,j)=(L(1))^pi+(L(2))^pi+(L(3))^pi+(L(4))^pi+(L(5))^pi+(L(6))^pi;
        
        J41(i,j)= S41(i,j);
        
        J42(i,j)= L(1)*L(2)+L(1)*L(3)+ L(1)*L(4)+L(1)*L(5)+L(1)*L(6)+L(2)*L(3)+...
            L(2)*L(4)+L(2)*L(5)+L(2)*L(6)+L(3)*L(4)+L(3)*L(5)+L(3)*L(6)+...
            L(4)*L(5)+L(4)*L(6)+L(5)*L(6);
        
        J43(i,j)= L(1)*L(2)*L(3)+L(1)*L(2)*L(4)+ L(1)*L(2)*L(5)+L(1)*L(2)*L(6)+...
            L(1)*L(3)*L(4)+ L(1)*L(3)*L(5)+L(1)*L(3)*L(6)+L(1)*L(4)*L(5)+...
            L(1)*L(4)*L(6)+L(1)*L(5)*L(6)+L(2)*L(3)*L(4)+L(2)*L(3)*L(5)+...
            L(2)*L(3)*L(6)+L(2)*L(4)*L(5)+L(2)*L(4)*L(6)+L(2)*L(5)*L(6)+...
            L(3)*L(4)*L(5)+L(3)*L(4)*L(6)+L(3)*L(5)*L(6)+L(4)*L(5)*L(6);
        
        J44(i,j)= L(1)*L(2)*L(3)*L(4)+L(1)*L(2)*L(3)*L(5)+L(1)*L(2)*L(3)*L(6)+...
            L(1)*L(2)*L(4)*L(5)+L(1)*L(2)*L(4)*L(6)+L(1)*L(2)*L(5)*L(6)+...
            L(1)*L(3)*L(4)*L(5)+L(1)*L(3)*L(4)*L(6)+L(1)*L(3)*L(5)*L(6)+...
            L(1)*L(4)*L(5)*L(6)+L(2)*L(3)*L(4)*L(5)+L(2)*L(3)*L(4)*L(6)+...
            L(2)*L(3)*L(5)*L(6)+L(2)*L(4)*L(5)*L(6)+L(3)*L(4)*L(5)*L(6);
        
        J45(i,j)= L(1)*L(2)*L(3)*L(4)*L(5)+L(1)*L(2)*L(3)*L(4)*L(6)+L(1)*L(2)*L(3)*L(5)*L(6)+...
            L(1)*L(2)*L(4)*L(5)*L(6)+L(1)*L(3)*L(4)*L(5)*L(6)+L(2)*L(3)*L(4)*L(5)*L(6);
        
        J46(i,j)= L(1)*L(2)*L(3)*L(4)*L(5)*L(6);
    end
end
end

