function [ label1 ] = WriterClassifcation(testImage, categoryClassifier)

wb = waitbar(7/10,'Predicting WriterID');
%% 
% Apply the newly trained classifier to categorize new images.
 
    [labelIdx, ~] = predict(categoryClassifier, testImage);
%% 
% Display the classification label.
    label1=categoryClassifier.Labels(labelIdx);
 delete(wb);
waitbar(10/10,'Done!');