function [RGB]=XYZ_TO_RGB(xyz)


M=      [ 2.0413690 -0.5649464 -0.3446944;
-0.9692660  1.8760108  0.0415560;
 0.0134474 -0.1183897  1.0154096 ];

for i=1:3
    RGB(:,:,i)=M(i,1)*xyz(:,:,1) + M(i,2)*xyz(:,:,2) + M(i,3)*xyz(:,:,3); 
end


end