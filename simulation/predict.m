predict_p = [];
predict_u = [];
for i = 500:600
    tmp = [1000;300;i];
    uu = ANNs(tmp,25);
    pp = interp1(data(i - 499).u,data(i - 499).p,uu,'linear');
    predict_p = [predict_p, pp];
    predict_u = [predict_u, uu];
end