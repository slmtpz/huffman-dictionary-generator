text = eren_readText('ulalume.txt');



[bitstream, decoded, dict] = eren_Huffman(text);

%% Original Values
% Bitstream length is 18496.
% Reduced size by 0.57901.
% Average codeword length 4.6321.
%% My Values
% Bitstream length is 18495.
% Reduced size by 0.57898.
% Average codeword length 4.6319.

% I did get rid of 0 probability symbols from the dictionary.
% Hence, dictionary will actually store less.
% Original dict was 234x2 cell which contains up to 188 codeword length
% indexes. However, mine was 58x2 which contains up to 12 codeword length
% which implies if we include dictionaries in the bitstream during
% compression or data transfer, my dict will save a lot space.
% Simply, the original dict was 200832 bytes whereas mine 
% Bitstream length, size and average codeword length is a few reduced.