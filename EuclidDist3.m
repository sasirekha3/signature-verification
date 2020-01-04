
wb = waitbar(11/12,'Calculating Euclidean Distances...');
srcFiles2 = dir('C:\Users\Sasirekha\Documents\MATLAB_userfiles\MySigRec\SingleSet\*.png');
i=1;
%global feat;
D = zeros(length(sizemat), 3);
MaxD=zeros(length(sizemat), 1);
MinD=zeros(length(sizemat), 1);
AvgD=zeros(length(sizemat), 1);
Rmax=zeros(length(sizemat), 2);
Rmin=zeros(length(sizemat), 2);

global Template;

class111=1;
while class111 <= length(srcFiles2)
filename1 = strcat('C:\Users\Sasirekha\Documents\MATLAB_userfiles\MySigRec\SingleSet\',srcFiles2(class111).name);
  Ig1 = imread(filename1);
I = imbinarize(rgb2gray(Ig1));
Img = bwmorph(I,'thicken',Inf);
pts1 = detectSURFFeatures(Img);
    [f, vpts] = extractFeatures(Img, pts1);
    feat=f;

res = sum(sum(sizemat(1:class111,1:3)))-sum(sizemat(class111,1:3))+1;
    for i = res:sizemat(class111,1)+res-1
        for j = 1:length(f);
            Vtj = Feature(i)-feat(j);
            Daidj(j) = sqrt(Vtj * Vtj');
         
        end
        Dad(i-res+1) = mean(Daidj);
    end
    res = res+sizemat(class111,1);
    for i = res:sizemat(class111,2)+res-1
        for j = 1:length(f);
            Vtj = Feature(i)-feat(j);
            Dbidj(j) = sqrt(Vtj * Vtj');
         
        end
        Dbd(i-res+1) = mean(Dbidj);
    end
    res = res+sizemat(class111,2);
    for i = res:sizemat(class111,3)+res-1
        for j = 1:length(f);
            Vtj = Feature(i)-feat(j);
            Dcidj(j) = sqrt(Vtj * Vtj');
         
        end
        Dcd(i-res+1) = mean(Dcidj);
    end
        
    
    D(class111, 1) = sum(Dad)/(sizemat(class111, 1));
    D(class111, 2) = sum(Dbd)/(sizemat(class111, 1));
    D(class111, 3) = sum(Dcd)/(sizemat(class111, 2));
    MaxD(class111) = max(D(class111, 1:3));
    MinD(class111) = min(D(class111, 1:3));
    AvgD(class111) = mean(D(class111, 1:3));
    Rmax(class111,:) = [MaxD(class111)+0.005 MaxD(class111)-0.005];
    Rmin(class111,:) = [MinD(class111)+0.005 MinD(class111)-0.005];
    
    class111 = class111 + 1;
end
    
  
        
        

    Template=[D MaxD MinD AvgD Rmax Rmin];
    set(handles.pushbutton2,'UserData',Template);
set(handles.pushbutton3,'UserData',sizemat);
set(handles.pushbutton1,'UserData', Feature);

disp('EuclidDist done.');
 delete(wb);
 
 
setDir  = fullfile('OrganizedGenuine');
 imgSets = imageSet(setDir, 'recursive'); 
%delete(wb);
%wb = waitbar(1/10,'Creating Bag of Features...'); 
bag = bagOfFeatures(imgSets,'Verbose',true);

%delete(wb);
%wb = waitbar(4/10,'Training Classifier...');
%% 
% Train a classifier with the training sets.
    categoryClassifier = trainImageCategoryClassifier(imgSets, bag);
%delete(wb);
    set(handles.pushbutton4,'UserData',categoryClassifier);
    
 waitbar(12/12,'Training completed!');
  