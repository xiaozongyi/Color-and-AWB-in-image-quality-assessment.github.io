ori=double(imread('6A91.jpg'));
rec=double(imread('6V851.jpg'));
rec1 = imcrop(rec,[0,0,4000,3000]);
% ori(:,:,1)=double(101);ori(:,:,2)=double(101);ori(:,:,3)=double(101);
% rec(:,:,1)=double(101);rec(:,:,2)=double(100);rec(:,:,3)=double(100);
[row,col,dim]=size(ori);
Labstd=reshape(ori,row*col,3);
Labsample=reshape(rec1,row*col,3);
KLCH=[1,1,1];
res=deltaE2000(Labstd,Labsample, KLCH)
result=reshape(res,row,col)
ave=mean(result)
ave1=mean(res)
% mask=zeros(row,col);
% for i=1:row
%     for j=1:col
%         if(result(i,j)>1&&result(i,j)<9)
%             mask(i,j)=1;
%         end
%     end
% end
% figure(1);imagesc(mask);colormap(gray);


