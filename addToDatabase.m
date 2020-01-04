function [ ] = addToDatabase( newF, class )
%ADDTODATABASE Summary of this function goes here
%   Detailed explanation goes here

%Feature(class,:,:) = newF;
%size(Feature)
global Person;
global Feature;
class

%size(ones(size(newF, 1), 1))
t = ones(size(newF, 1),1);

t = t + double(class-1);
if class == 1
    Person = t;
    Feature = newF;
else
    Person = vertcat(Person, t);
    Feature = vertcat(Feature, newF);
end


end

