function mytext = eren_readText(filename)
fid = fopen(filename, 'r'); %open file for reading
mytext = fread(fid); %read full file
fclose(fid); %close file pointer
%hist(mytext, 0:127); %compute histogram of text for codes 0-127
%xlim([0 127]); %adjustx-axis to actual limits
%xlabel('ASCII code'); ylabel('# occurences');