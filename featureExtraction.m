%% Reading images from folder

global Person;
global Feature;
global sizemat;
global D;

srcFiles = dir('C:\Users\Sasirekha\Pictures\TrainingSet\Training Set\Genuine\*.png');
i=1;


while i < length(srcFiles)
   
wb = waitbar(i/36,'Training Images...');
  filename = strcat('C:\Users\Sasirekha\Pictures\TrainingSet\Training Set\Genuine\',srcFiles(i).name);
  I1 = imread(filename);
  i = i + 1;
   filename = strcat('C:\Users\Sasirekha\Pictures\TrainingSet\Training Set\Genuine\',srcFiles(i).name);
  I2 = imread(filename);
  i = i + 1;
   filename = strcat('C:\Users\Sasirekha\Pictures\TrainingSet\Training Set\Genuine\',srcFiles(i).name);
  I3 = imread(filename);
  i = i + 1;
  %if(mod(i,3) + 1 == 3)
        I1 = imbinarize(rgb2gray(I1));
        I2 = imbinarize(rgb2gray(I2));
        I3 = imbinarize(rgb2gray(I3));
        Img1 = bwmorph(I1,'thicken',Inf);
        Img2 = bwmorph(I2,'thicken',Inf);
        Img3 = bwmorph(I3,'thicken',Inf);
        extractFeaturesOf(Img1,Img2,Img3,int16(i/3));
   %end
   delete(wb);
 end


