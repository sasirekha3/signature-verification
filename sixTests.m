function [ t ] = sixTests( class )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

t1 = 'forged';
t2 = 'forged';
t3 = 'forged';
t4 = 'forged';
t5 = 'forged';
t6 = 'forged';

global TestTemplate;
global Template;
TestTemplate
Template

if Template(class,4) - TestTemplate(4) <= 0.0008
    t1 = 'genuine';
end
if Template(class,5) - TestTemplate(5) <= 0.0005
    t2 = 'genuine';
end
if Template(class,6) - TestTemplate(6) <= 0.0006
    t3 = 'genuine';
end
if (Template(class,7) > TestTemplate(4))&&(Template(class,8) < TestTemplate(4))
    t4 = 'genuine';
end
if (Template(class,9) > TestTemplate(5))&&(Template(class,10) < TestTemplate(5))
    t5 = 'genuine';
end
if (Template(class,7) > TestTemplate(4))&&(Template(class,8) < TestTemplate(4))&&(Template(class,9) > TestTemplate(5))&&(Template(class,10) < TestTemplate(5))
    t6='genuine';
end

t = {t1, t2, t3, t4, t5, t6};
end

