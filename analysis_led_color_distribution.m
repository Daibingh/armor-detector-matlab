clc
clear all
r = xlsread('C:\Users\Administrator\Desktop\装甲检测统计.xlsx', 'mat', 'a1:c30');
b = xlsread('C:\Users\Administrator\Desktop\装甲检测统计.xlsx', 'mat', 'e1:g26');
figure;
hl1 = plot3(r(:,1),r(:,2),r(:,3), 'r.');
hold on
hl2 = plot3(b(:,1),b(:,2),b(:,3), 'b.');
xlabel('B');
ylabel('G');
zlabel('R');
