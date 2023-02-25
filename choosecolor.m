clear all;
clc;
base_path = 'C:\tianlong\tianlong\MCL_CCP-master\导出\011-\';
ext2='*.png';
files2=dir([base_path,ext2]); 
names={files2.name};
tmp = 0;
list = {};
center={};
num = 1;
gres = [];
nflag = 0;
for pic = 32:-2:2
    for path=1:1:length(names)
        full_path = [base_path, names{path}];  %生成图片路径
        img = imread(full_path);                %读取三张图片
        img = imresize(img,[320,320]);          %压缩图片为统一大小       
        h0 = floor(320/pic);                         %定义框的高
        w0 = floor(320/pic);                         %定义框的宽
        flag = 1;
        for l =1:pic-1
            for k =1:pic-1
                matrix = img(h0*k:h0*(k+1),w0*l:w0*(l+1),:);
                temp0 = matrix(2 ,2, 1);
                temp1 = matrix(2 ,2, 2);
                temp2 = matrix(2 ,2, 3);
                [rows, cols,c2]= size(matrix);
                for i = 1:rows
                    for j = 1:cols
                        if (temp0 ~= matrix(i,j,1) || temp1 ~=matrix(i,j,2) || temp2 ~= matrix(i,j,3))
                            flag = 0;
                            break;
                        end
                    end
                end
                if (flag == 1)
                    list{tmp+1} = [w0*k,h0*l];
                    tmp = tmp+1;
                end
                flag = 1;
            end
        end
    end
    tmp = 0;

    res = {};
    v=1;
    [r,t]=size(list);
    for i = 1:t
        coordinate=list{i};
        for j =i+1:t
            if isequal(list{j},coordinate)
                v = v + 1;
                nflag = 1;
                break;
            end
        end
        if v == 2
            res{end+1}=coordinate;           
            tmp = tmp+1;
            v=1;
        end       
    end
    [a,d]=size(res);
    for i=1:d
        cen=res{1,i};
        if(cen(1)>130 && cen(1)<190 &&cen(2)>130 && cen(2)<190&& pic==32)
            center{end+1}=res{1,i};
        else
            continue;
        end
    end
    
%     if pic == 32
%         break;
%     end
    if nflag == 0
        pic = pic+2;
        break;
    end
    tmp=0;
    gres = res;
    list = [];
    nflag = 0;
    
end

for path=1:1:length(names)
    full_path = [base_path, names{path}];
    img = imread(full_path);                
    img = imresize(img,[320,320]);               %取图片的垂直高度和水平宽度和通道数
    h0 = floor(320/pic);                         %定义框的高
    w0 = floor(320/pic); 
    [m,n]=size(gres);
    for i=1:1:n
        g= gres{1,i};
        result = imcrop(img,[g(2),g(1),w0,h0]);
        imwrite(result,[base_path, num2str(i),full_path(end-9:end-4) , '.jpg']);
        [state,output] = draw_rect(img,[g(1), g(2)],[w0,h0],0);
        imwrite(output,[base_path,num2str(i), full_path(end-9:end-4),'_result','.jpg']);
    end
    [c,x]=size(center);
    for i=1:1:x
        h = center{1,i};
        result1 = imcrop(img,[h(2),h(1),10,10]);
        imwrite(result1,[base_path, '中心',num2str(i),full_path(end-9:end-4) , '.jpg']);
        [state1,output1] = draw_rect(img,[h(1), h(2)],[10,10],0);
        imwrite(output1,[base_path, '中心',num2str(i), full_path(end-9:end-4),'_result','.jpg']);
    end
end