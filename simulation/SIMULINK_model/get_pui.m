p = load('P.mat');
u = load('U.mat');
i = load('I.mat');

img_data(k).p = p.ans.Data;
img_data(k).u = u.ans.Data;
img_data(k).i = i.ans.Data;

figure(1)
hold on
for i = 1:3
    plot(img_data(i).u, img_data(i).p)
end

figure(2)
hold on
for i = 1:3
    plot(img_data(i).u, [img_data(i).p] ./ [img_data(i).u])
end