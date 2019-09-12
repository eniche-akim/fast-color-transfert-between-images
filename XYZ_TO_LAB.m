function [lab]=XYZ_TO_LAB(XYZ)
%%%%%%%%%%%%%%% function%%%%%%%%%%%%%

function [res]=condition(K)
    if (K > 0.008856)
        res= K.^(1/3.0);
    else
        res= 1/3 * (29/6).^2 * K + 4/29;
    end
end


%%%%%%%%%%%%%%%PROGRAM%%%%%%%%%%%%%%%%      
    
 XYZ(:,:,1)= XYZ(:,:,1)/0.950456;
 XYZ(:,:,3)=XYZ(:,:,3)/1.088754;
 
 if XYZ(:,:,2) > 0.008856
     L = 116 * XYZ(:,:,2).^(1/3.0)- 16.0 ;
 else
     L= 116 * (1/3 * (29/6).^2 * XYZ(:,:,2) + 4/29) - 16.0;
 end
 
 
 A = 500*(condition(XYZ(:,:,1)) - condition(XYZ(:,:,2)));
 B = 200*(condition(XYZ(:,:,2)) - condition(XYZ(:,:,3)));
 lab(:,:,1)=L;
 lab(:,:,2)=A;
 lab(:,:,3)=B;

 
end