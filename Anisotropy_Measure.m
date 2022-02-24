%{
Caution:-
For this code we used the tool box provided by Angelos Barmpoutis: Link for downloading the tool box is
https://www.mathworks.com/matlabcentral/fileexchange/?term=authorid%3A89529.
Here we added all the required files in this folder. It will be work fine as a stand alone programe.
If you face any problem/query contact me on this email: avinashbansal26@gmail.com
%}
[All_Tensor_Coff]=open_HARDICeitec(); % Calling the function to get brain's data.
g=UnitVectorsHardiCeitec();  % Gives gradient direction N*3.
n_grad=size(g,1);
GradientOrientations= g(1:n_grad,:);  % 64 gradient direction
F_metric=Finsler_metric_as_variables();  % symbolic matrix which needs 15 cofficent and [1 3] vector
%{
Plot for some portion of brain use D=All_Tensor_Coff(:, 20:30, 30:40) where 1st cordinate of D is 15 cofficents
of tensor and 2nd & 3rd are possition coordinates. It's always adviseable to run for small portion else it will
take 3 to 4 hours for full 2D brain image as per the hardware/sofware configraion of PC.
%}
D=All_Tensor_Coff; % It will run for full 2D brain image and time consuling.
%% Flatting of 4th order tensor to 6*6 matrix
T6D=Flattening_Tensor_6_by_6(D);
%% 12 Sclar Measure 6 for S and 6 for J where S41=J41
[S41,S42,S43,S44,S45,S46,J41,J42,J43,J44,J45,J46]=Klevin_Eigen_Values(D);

for i=1:size(D,2)
    for j=1:size(D,3)       
        %% code for Finsler Fractional Anisotropy (FFA)
        TD=D(:,i,j)+.0001; % Adding small value(0.0001) to avoid division by zero error
        v= GradientOrientations; % v is N*3 vectors
        count=0;
        for ii=1:size(v,1)
            if (v(ii,1)>0)  % Choosing all direction on hemisphere
                count=count+1;
                F(:,:,count)=double(F_metric (TD(1),TD(2),TD(3),TD(4),TD(5),TD(6),TD(7),TD(8),TD(9),TD(10),TD(11),...
                    TD(12),TD(13), TD(14), TD(15), v(ii,1),v(ii,2),v(ii,3)));
            end
        end
        FSum=zeros(3,3);
        for ii=1:count
            FSum=FSum+squeeze(F(:,:,ii));
        end
        FSumAll(:,:,i,j)=FSum/count;         % Mean of Finsler/ diffusion matrix
        %Finsler-Riemann Anisotropy
        FFA(i,j)=GFA(squeeze(FSumAll(:,:,i,j)));  % Finsler Anisotropy
        FA4(i,j)=GFA(squeeze(T6D(:,:,i,j)));     % Riemann Anisotory after flatting of 4th order tensor
    end
end

%% Ploting figures
% For grayscale image uncomment colormap
figure; imagesc(imrotate(FFA,90)); % colormap('gray');
title('FFA')
figure; imagesc(imrotate(FA4,90)); % colormap('gray');
title('FA4')
figure; imagesc(imrotate(S41,90)); % colormap('gray');
title('S41')
figure; imagesc(imrotate(S42,90)); %  colormap('gray');
title('S42')
figure; imagesc(imrotate(S43,90)); % colormap('gray');
title('S43')
figure; imagesc(imrotate(S44,90)); % colormap('gray');
title('S44')
figure; imagesc(imrotate(S45,90));  % colormap('gray');
title('S45')
figure; imagesc(imrotate(S46,90)); % colormap('gray');
title('S46')
figure; imagesc(imrotate(J42,90)); %  colormap('gray');
title('J42')
figure; imagesc(imrotate(J43,90)); %  colormap('gray');
title('J43')
figure; imagesc(imrotate(J44,90)); % colormap('gray');
title('J44')
figure; imagesc(imrotate(J45,90)); % colormap('gray');
title('J45')
figure; imagesc(imrotate(J46,90)); % colormap('gray');
title('J46')

