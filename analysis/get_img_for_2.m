% figure(1)
% hold on
% for i = 1:3
%     plot(img_data(i).u,img_data(i).p, 'k')
% end
% plot(result(2).u, result(2).p, 'k')
% axis([0 45 0 60]);

figure(2)
hold on
for i = 1:3
    plot(img_data(i).u,img_data(i).i, '--k')
end
plot(img_data(4).u,img_data(4).i, 'k')
axis([0 15 0 10]);
text(3,4,'Module 1');
text(3,2.85,'Module 2');
text(3,1.75,'Module 3');
text(3,8.3,'Parallel connected');
xlabel('Voltage(V)');
ylabel('Current(A)');