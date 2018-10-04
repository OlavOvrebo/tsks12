function [] = compress(dir, image, K)

img = imread(strcat(strcat(dir, '\'),  image));

[h, w, i] = size(img); %gets dim as height h, width w, and colour dimension i.
imshow(img);

dp = zeros(h*w, i);

for row = 1:h
    for col = 1:w
        for colour = 1:i
            dp((row*w) - w + col, colour) = img(row, col, colour);
        end
    end
end

 
%cluster generation
clusters = zeros(K, i);
for cluster = 1:K
    pixel = [round(random('unif', 1, h)) round(random('unif', 1, w))];    
    for colour = 1:i
        clusters(cluster, colour) = img(pixel(1), pixel(2), colour);
    end
end


'beginning k-means'
%k-means
updated = 1;
while updated == 1
    [clusters, updated] = iteration_step(dp, clusters);
end

clusters

'finished k-means clustering'

for index = 1:h*w
    best = 1e20; %some big number
    best_index = 0;
    for cluster = 1:K
        dist = distance(dp(index, :), clusters(cluster, :));
        if  dist < best
            best = dist;
            best_index = cluster;
        end
    end
    for colour = 1:i
        dp(index, colour) = clusters(best_index, colour);
    end
end

%dp

for row = 1:h
    for col = 1:w
        for colour = 1:i
            img(row, col, colour) = dp((row*w) - w + col, colour);
        end
    end
end




%image updated compressed as per k-means clustering

imshow(img)

%imwrite(img, dir + '\output.jpg','jpg' );
