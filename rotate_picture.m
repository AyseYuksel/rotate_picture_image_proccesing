%in this example the image is rotated 75 degrees

resim=imread("coins.png");
griresim=resim(:,:,1)*0.5+resim(:,:,2)*0.3+resim(:,:,3)*0.2;

resim1=griresim(1:2:end,1:2:end);
%resmin boyutu 236x265

%kosegenleri kaydırmak için min ve max değer bulma
i=236;
j=1;
T=75;
x=ceil(i*cosd(T)-j*sind(T)); %x=61
y=ceil(i*cosd(T)+j*sind(T)); %y=63
%%%%
i=236;
j=265;
T=75;
x=ceil(i*cosd(T)-j*sind(T)); %x=-194
y=ceil(i*cosd(T)+j*sind(T)); %y=318
%%%
i=1;
j=1;
T=75;
x=ceil(i*cosd(T)-j*sind(T)); %x=0
y=ceil(i*cosd(T)+j*sind(T)); %y=2
%%%
i=1;
j=265;
T=75;
x=ceil(i*cosd(T)-j*sind(T)); %x=-255
y=ceil(i*cosd(T)+j*sind(T)); %y=257

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
coor=[];
for i=1:236
	for j=1:265
	
	T=75;
	x=ceil(i*cosd(T)-j*sind(T));
	y=ceil(i*cosd(T)+j*sind(T));
	coor=[coor;x y];
	end
end
min(coor);% x=-255 y=2
max(coor);% y=61 318

%köşegenlerin düşeceği minimum ve maksimum
%değer aralıklarında - değerden
%kurtulmak için x değeri üzerine 255 
%eklenmeli.x değerine 255 eklenmesi sonucu
%min(coor) x=0 y=2 iken max(coor) x=316 y=318
%y değerinin sağlanması içinde
%yerleştirilecek arka plan boyutları 350x350 
%zeros matrisi şeklinde oluşturulmalı.

yeni=zeros(350,350);
for i=1:236
    for j=1:265
        T=75;
     x=ceil(i*cosd(T)-j*sind(T))+255;	
     y=ceil(i*cosd(T)+j*sind(T));
       yeni(x,y)=resim1(i,j);
    end
end
yeni=uint8(yeni);
imshow(yeni)