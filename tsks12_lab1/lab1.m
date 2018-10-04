%% Setup task 1;
x = [1 1; 
1.5 2;
3 4;
5 7;
3.5 5;
4.5 5;
3.5 4.5];

clusters = [1 1; 5 7];
updated = 1;
while updated == 1
    [clusters, updated] = iteration_step(x, clusters);
    hold off
    scatter(x(:,1), x(:,2),'r')
    hold on
    scatter(clusters(:,1), clusters(:,2),'b')
    pause
end

%% task 2

dir =  'C:\Users\olavo\Desktop\Uni current\TSKS12\labs\lab 1';
% Images:
i1 = 'astrup_the_way_home.jpg';
i2 = 'bernini_veil.jpg';
i3 = 'grendler_horse_head_nebula.jpg';
i4 = 'jagannatha.jpg';
i5 = 'muttermachine_absturz.jpg';
i6 = 'hsv_colour_wheel.png';
i7 = 'klimt_apple_tree.jpg';


K = 8; % #clusters

compress(dir, i7, K)