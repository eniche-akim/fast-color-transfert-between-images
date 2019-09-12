function [xyz]=LAB_TO_XYZ(lab)

function [res]=condition(K)
    if (K > 0.206893)
        res= K.^(3.0);
    else
        res=  3*(6/29).^2.0* (K-4/29);
    end
end


y=(lab(:,:,1)+16)/116;
x=lab(:,:,2)/500 + y;
z=y - lab(:,:,3)/200;

x = condition(x);
y = condition(y);
z = condition(z);
x = x * 0.950456;
z = z * 1.088754;
xyz(:,:,1)=x;
xyz(:,:,2)=y;
xyz(:,:,3)=z;

    end