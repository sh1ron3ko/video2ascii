input='/Users/yjhe/Downloads/ouxigei.mp4';
outDir='/Users/yjhe/Desktop/text1/'
N=VideoReader(input).NumberOfFrames;
v = VideoReader(input);
frameSeq=0;
symbols='$$M#nnt++/;:,,..       ';
 for k = 1 : N
     frame = readFrame(v,'default');
     if rem(k,3)~=0
         continue;
     end
    frameSeq=frameSeq+1;
    im=rgb2gray(frame);
    im=imresize(im,0.1); %720*1280 -> 72*128
%     imshow(im);
    text=cellfun(@(x) symbols(1+floor((length(symbols)-1)*x)),num2cell(im2double(im)));
    dlmwrite([outDir num2str(frameSeq) '.txt'],text,'delimiter','');
 end
