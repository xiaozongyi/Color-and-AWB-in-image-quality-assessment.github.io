# Color-and-AWB-in-image-quality-assessment.github.io
# Color and AWB exe使用说明：
## 关于Color and AWB的质量评价分为三步：
## 1、导入含有原始图片的文件夹
**注意是文件夹，不是单个图像；图像的名称应存在前六位字符并且各不相同；同一场景下的图片前四位应相同，例如‘001-Redmi 10_IMG_20211118_105120’和‘001-P410_IMG_20220101_102726469’为同一场景下对标机和待测机拍摄的图片，前六位不同，前四位相同，为之后生成同一场景下的图像组提供便利**，再导入输出图片文件夹，点击色彩分割，色彩分割结束后会在对话框会显示“完成！”此过程可能会较慢，分割一张图片所需时间大约为25s。步骤如图1-5。
![图一](https://user-images.githubusercontent.com/107088415/221334385-e2977b2d-7fcc-4f76-b5eb-8a08dc1d3570.png)
![图二](https://user-images.githubusercontent.com/107088415/221334400-6fbe0d9b-b27a-4bf0-9e5e-ab547c0d88eb.png)
![图三](https://user-images.githubusercontent.com/107088415/221334412-3bf52db0-ece3-43d8-8571-dca64d6991e4.png)
![图四](https://user-images.githubusercontent.com/107088415/221334435-d3b05da3-b6cf-4c4f-bb3e-19d0706fcced.png)
![图五](https://user-images.githubusercontent.com/107088415/221334442-fdc7ac14-e4e5-479a-8fa3-abbbe73887eb.png)
## 2、	点击“选择图像组”
选择放有色彩分割后的图像文件夹，（此前应确定色彩分割后的图像是同方向的，如果不是，要手动进行旋转等操作）点击“选定色块”，则会生成对标图片和待测图片中同一位置的最大色块和中心位置的小色块。
![图六](https://user-images.githubusercontent.com/107088415/221334814-838ffe6d-5eaf-4f3d-a019-137476d96eef.png)
关于访问路径的问题可以自行拖拽数据库到“快速访问”，如图所示：
![图七](https://user-images.githubusercontent.com/107088415/221334889-d99b3b8a-07a4-4186-8448-f24fdb1534ac.png)
同时文件夹中也会出现选定色块图片和裁剪位置，如图8所示。
![图八](https://user-images.githubusercontent.com/107088415/221334920-f9c669f7-ee6b-415a-ad0a-d1641309ad92.png)
## 3、第三步，选择对标图片，选择裁剪后的色块图片，点击计算△E，即可计算出两张图片的色差值！
![图九](https://user-images.githubusercontent.com/107088415/221335046-d4fcf1ed-568d-484a-9a87-4ecc1e45099e.png)
![图十](https://user-images.githubusercontent.com/107088415/221335052-c68c2396-1065-4a3b-ba4a-12049a815f9d.png)
# 代码文件说明
## Color&AWB.mlapp为matlab APP设计下的开发源码。
## CCP_segmentation.m为图像调色板分割程序代码。
## choosecolor.m为小程序第二步程序代码。
## draw_rect.m为裁剪图片代码。
## test_delta.m为计算对比图像与测试图像△E值程序代码。
