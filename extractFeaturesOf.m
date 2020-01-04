function [ ] = extractFeaturesOf( Img1, Img2, Img3, class )
%EXTRACTFEATURESOF Summary of this function goes here
%   Detailed explanation goes here

points1 = detectSURFFeatures(Img1);
    [f1, vpts1] = extractFeatures(Img1, points1);

%figure; imshow(Img1); hold on;
    %plot(vpts1.selectStrongest(10),'showOrientation',true);
%    ax1=gca;
points2 = detectSURFFeatures(Img2);
   [f2, vpts2] = extractFeatures(Img2, points2);

%figure; imshow(Img2); hold on;
    %plot(vpts2.selectStrongest(10),'showOrientation',true);
%    ax2=gca;

points3 = detectSURFFeatures(Img3);
   [f3, vpts3] = extractFeatures(Img3, points3);

%figure; imshow(Img3); hold on;
    %plot(vpts3.selectStrongest(10),'showOrientation',true);
    


%% Combining all features into one matrix

F = [f1; f2; f3];
global sizemat;
sizemat(class,:)=[size(f1, 1) size(f2, 1) size(f3, 1)];
addToDatabase(F, class);

end

