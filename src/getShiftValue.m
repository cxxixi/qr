function val = getShiftValue(a,b,c)
    d = (a-c)/2
    val = c-sign(d)*b^2/(abs(d) + sqrt(d^2+b^2))
end