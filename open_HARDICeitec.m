function [TC]=open_HARDICeitec()
% Output: TC gives us 15 cofficent * X/Y/Z * Y/Z/X  
file_name='2621B_03d_ep2d_diff_mddw_2iso_dir64_b1500_AP.nii';
file_dir=which(file_name);
[V]=ReadData3D(file_dir);
% V : The 3D Volume
% info : Struct with info about the data
% Always the following fields are present
% info.Filename : Name of file
% info.Dimensions : Dimensions of Volume
% info.PixelDimensions : Size of one pixel / voxel
% Normally the 4th component of V tell about the number of gradient direction

g=UnitVectorsHardiCeitec(); % Gives the gradient direction (g) N*3 vector form.
n_grad=size(g,1);
GradientOrientations= g(1:n_grad,:);
b_value= [0;ones(n_grad-10,1)*1500;0;0;0;0;0;0;0;0;0];
order=4;  % 4th order Tensor
S=V;   % For convention used S here for signal
x_ly_no=51;   %% Choose the layer which you want to display in 2D plane
y_ly_no=56;
z_ly_no=36;
tS=squeeze(S(x_ly_no,:,:,1)); % for other layer (e.g. Z) use like:  tS=squeeze(S(:,:,z_ly_no,1));
figure;imagesc(imrotate(tS,90));
G=constructMatrixOfMonomials(GradientOrientations, order); %computes G from section 5.1 (ISBI'10)
C=constructSetOf321Polynomials(order)'; %computes C from section 5.1 (ISBI'10)
P=G*C;
P=[-diag(b_value)*P ones(size(GradientOrientations,1),1)];
BG=constructMatrixOfIntegrals(GradientOrientations, order, 100);
B=BG*C;

%% Here in loop i is stactic. Choose any layer as per need
for i=x_ly_no:x_ly_no         
    for j=1:size(S,2)
        for k=1:size(S,3)
            for gcounter=1:size(S,4)
                if(S(i,j,k,gcounter)==0)
                    S(i,j,k,gcounter)=0.0001;
                end
            end
            y1=(squeeze(log(double(S(i,j,k,:)))));
            if(y1=='Inf' )
                y1(:)=9999;
            end
            if(y1==0 )
                y1(:)=0.0001;
            end
            x1=lsqnonneg(P, y1);
            if(x1=='Inf' )
                x1(:)=9999;
            end
            if(x1==0 )
                x1(:)=0.0001;
            end
            CT_Coeff = C * x1(1:321);
            TC(:,j,k)=CT_Coeff;
        end
    end
end
%{
% for other layer (e.g. Z) code will be like:  Similiar for others 
for i=1:size(S,1)        
    for j=1:size(S,2)
        for k=z_ly_no:z_ly_no
            
            %% Same as above code
            
            TC(:,i,j)=CT_Coeff;   % change the coordinate acoordinaly
        end
    end
end
%}
figure; plotTensors(TC,1,[321  1]); % it will plot full brain image
% for some portion use like  figure; plotTensors(TC(:,20:30,30:40),1,[321  1]);
% Rather than full brain image for small portion use TC = TC(:,20:30,30:40)
end
