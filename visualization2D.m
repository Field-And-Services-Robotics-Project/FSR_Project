%% Get the variables

cm = out.CM.Data;

% Get value of the link: center of mass, theta, line
for i = 1 : n
    [link(:,:,i),theta(:,:,i)] = get_link(out.linkcm.Data,n,i,out.link.Data); 
end

line1 = ln(theta,link,l,1);
line2 = ln(theta,link,l,2);
line3 = ln(theta,link,l,3);
line4 = ln(theta,link,l,4);
line5 = ln(theta,link,l,5);
line6 = ln(theta,link,l,6);
line7 = ln(theta,link,l,7);

x11(:,1) = line1(1,1,:);
x21(:,1) = line1(2,1,:);
y11(:,1) = line1(1,2,:);
y21(:,1) = line1(2,2,:);

x12(:,1) = line2(1,1,:);
x22(:,1) = line2(2,1,:);
y12(:,1) = line2(1,2,:);
y22(:,1) = line2(2,2,:);

x13(:,1) = line3(1,1,:);
x23(:,1) = line3(2,1,:);
y13(:,1) = line3(1,2,:);
y23(:,1) = line3(2,2,:);

x14(:,1) = line4(1,1,:);
x24(:,1) = line4(2,1,:);
y14(:,1) = line4(1,2,:);
y24(:,1) = line4(2,2,:);

x15(:,1) = line5(1,1,:);
x25(:,1) = line5(2,1,:);
y15(:,1) = line5(1,2,:);
y25(:,1) = line5(2,2,:);

x16(:,1) = line6(1,1,:);
x26(:,1) = line6(2,1,:);
y16(:,1) = line6(1,2,:);
y26(:,1) = line6(2,2,:);

x17(:,1) = line7(1,1,:);
x27(:,1) = line7(2,1,:);
y17(:,1) = line7(1,2,:);
y27(:,1) = line7(2,2,:);

figure(1)
hold on
grid on
xlabel X(m)
ylabel Y(m)

% video = VideoWriter('video_2D','MPEG-4');
% open(video);

% axis([-1 8.5 -1 8.5]);
% % Plot the results
plot(cm(:,1),cm(:,2),"LineWidth",2,"Color",'b')

for i=1 :5: size(x11,1)
    % l1=plot([x11(i,1) x21(i,1)],[y11(i,1) y21(i,1)],"Color",'r');
    % l2=plot([x12(i,1) x22(i,1)],[y12(i,1) y22(i,1)],"Color",'r');
    % l3=plot([x13(i,1) x23(i,1)],[y13(i,1) y23(i,1)],"Color",'r');
    % l4=plot([x14(i,1) x24(i,1)],[y14(i,1) y24(i,1)],"Color",'r');
    % l5=plot([x15(i,1) x25(i,1)],[y15(i,1) y25(i,1)],"Color",'r');
    % l6=plot([x16(i,1) x26(i,1)],[y16(i,1) y26(i,1)],"Color",'r');
    % l7=plot([x17(i,1) x27(i,1)],[y17(i,1) y27(i,1)],"Color",'g');
    % c1=plot(link(i,1,1),link(i,2,1),'*',"Color",'r');
    % c2=plot(link(i,1,2),link(i,2,2),'*',"Color",'r');
    % c3=plot(link(i,1,3),link(i,2,3),'*',"Color",'r');
    % c4=plot(link(i,1,4),link(i,2,4),'*',"Color",'r');
    % c5=plot(link(i,1,5),link(i,2,5),'*',"Color",'r');
    % c6=plot(link(i,1,6),link(i,2,6),'*',"Color",'r');
    % c7=plot(link(i,1,7),link(i,2,7),'*',"Color",'g');
    % anim=getframe(gcf);
    % writeVideo(video,anim);
    % delete(l1);
    % delete(c1);
    % delete(l2);
    % delete(c2);
    % delete(l3);
    % delete(c3);
    % delete(l4);
    % delete(c4);
    % delete(l5);
    % delete(c5);
    % delete(l6);
    % delete(c6);
    % delete(l7);
    % delete(c7);
    flag = i;
end

% close(video);

plot([x11(flag,1) x21(flag,1)],[y11(flag,1) y21(flag,1)],"Color",'r');
plot([x12(flag,1) x22(flag,1)],[y12(flag,1) y22(flag,1)],"Color",'r');
plot([x13(flag,1) x23(flag,1)],[y13(flag,1) y23(flag,1)],"Color",'r');
plot([x14(flag,1) x24(flag,1)],[y14(flag,1) y24(flag,1)],"Color",'r');
plot([x15(flag,1) x25(flag,1)],[y15(flag,1) y25(flag,1)],"Color",'r');
plot([x16(flag,1) x26(flag,1)],[y16(flag,1) y26(flag,1)],"Color",'r');
plot([x17(flag,1) x27(flag,1)],[y17(flag,1) y27(flag,1)],"Color",'g');
plot(link(flag,1,1),link(flag,2,1),'*',"Color",'r');
plot(link(flag,1,2),link(flag,2,2),'*',"Color",'r');
plot(link(flag,1,3),link(flag,2,3),'*',"Color",'r');
plot(link(flag,1,4),link(flag,2,4),'*',"Color",'r');
plot(link(flag,1,5),link(flag,2,5),'*',"Color",'r');
plot(link(flag,1,6),link(flag,2,6),'*',"Color",'r');
plot(link(flag,1,7),link(flag,2,7),'*',"Color",'g');

%% Functions

% link, column, time
function [link_cm,theta] = get_link(data,n,k,data1)
j = 1;
    for i = 1 :100: size(data,3) 
        link_cm(j,1) = data(k,1,i);
        link_cm(j,2) = data(k+n,1,i);
        theta(j,1) = data1(k,1,i);
        j = j + 1;
    end
end

function line = ln(theta,link,l,k)
    for i=1 : size(link,1)
        line(1,1,i) = link(i,1,k) + l*cos(theta(i,1,k));
        line(1,2,i) = link(i,2,k) + l*sin(theta(i,1,k));
        line(2,1,i) = link(i,1,k) - l*cos(theta(i,1,k));
        line(2,2,i) = link(i,2,k) - l*sin(theta(i,1,k));
    end
end

