global Template;
Template = get(handles.pushbutton2,'UserData');
testImage= imread(get(handles.edit1,'String'));

%testImage = imread('0119001_04.png');


label1 = WriterClassifcation(testImage, categoryClassifier);
label1 = char(label1);
label = str2num(label1(2:end))

set(handles.edit2, 'String', num2str(label));

I = imbinarize(rgb2gray(testImage));
Img = bwmorph(I,'thicken',Inf);
pts1 = detectSURFFeatures(Img);
    [f, vpts] = extractFeatures(Img, pts1);
    global feat;
    feat=f;
%%


%V = G - G2;
%D = sqrt(V * V');

 
 Mtd = zeros(1,1);
 mtd = zeros(1,1);
 atd = zeros(1,1);
 RM = zeros(1,2);
 Rm = zeros(1,2);
 TD = zeros(1,3);

global TestTemplate;

%%%%%%%%%%%
class = label;%
%%%%%%%%%%%
res = sum(sum(sizemat(1:class,1:3)))-sum(sizemat(class,1:3))+1;
    for i = res:sizemat(class,1)+res-1
        for j = 1:length(feat);
            Vtj = Feature(i)-feat(j);
            TDa(j) = sqrt(Vtj * Vtj');
         
        end
        TDaa(i-res+1) = mean(TDa);
    end
    res = res+sizemat(class,1);
    for i = res:sizemat(class,2)+res-1
        for j = 1:length(feat);
            Vtj = Feature(i)-feat(j);
            TDb(j) = sqrt(Vtj * Vtj');
         
        end
        TDbb(i-res+1) = mean(TDb);
    end
    res = res+sizemat(class,2);
    for i = res:sizemat(class,3)+res-1
        for j = 1:length(feat);
            Vtj = Feature(i)-feat(j);
            TDc(j) = sqrt(Vtj * Vtj');
         
        end
        TDcc(i-res+1) = mean(TDc);
    end
        
        
    
        TD(1, 1) = sum(TDaa)/sizemat(class, 1);
        TD(1, 2) = sum(TDbb)/sizemat(class, 2);
        TD(1, 3) = sum(TDcc)/sizemat(class, 3);
        Mtd = max(TD(1:3));
        mtd = min(TD(1:3));
        atd = mean(TD(1:3));
        RM(1,:) = [Mtd+0.005 Mtd-0.005];
        Rm(1,:) = [mtd+0.005 mtd-0.005];
        
        

    TestTemplate=[TD Mtd mtd atd RM Rm];    
            
   result=(sixTests(class))'
   set(handles.uitable4,'data',result);
            