figure(1)
hold on
for i = 1:3
    plot(img_data(i).u,img_data(i).p, 'k')
end
plot(result(2).u, result(2).p, 'k')
axis([0 45 0 60]);

figure(2)
hold on
for i = 1:3
    plot(img_data(i).u,img_data(i).i, '--k')
end
plot(result(2).u, result(2).i, 'k')
axis([0 45 0 4.5]);
text(3,3.9,'Module 1');
text(3,2.75,'Module 2');
text(3,1.65,'Module 3');
text(15,2.8,'Series connected');
xlabel('Voltage(V)');
ylabel('Current(A)');