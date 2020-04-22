function [ x,y ] = rotapp( c,s,x,y )

t = c*x + s*y;
y = c*y - (s')*x;
x = t;

end

