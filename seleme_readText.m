function mytext = seleme_readText(filename)
fid = fopen(filename, 'r'); %open file for reading
text = fread(fid); %read full file
fclose(fid); %close file pointer
%hist(mytext, 0:127); %compute histogram of text for codes 0-127
%xlim([0 127]); %adjustx-axis to actual limits
%xlabel('ASCII code'); ylabel('# occurences');

mytext = cell(0);
buffer = zeros(0);
for i = 1:length(text)
   if and(text(i) ~= 32, text(i) ~= 10)
       buffer = [buffer dec2bin(text(i), 8) - '0'];
   else
       mytext{length(mytext)+1} = buffer;
       if text(i) == 32
           mytext{length(mytext)+1} = dec2bin(text(i), 8) - '0';
       else
           mytext{length(mytext)+1} = dec2bin(text(i), 8) - '0';
       end
       buffer = zeros(0);
   end
end
