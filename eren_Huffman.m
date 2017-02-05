function [bitstream, decoded, dict] = eren_Huffman(mytext)
dims = size(mytext); len = dims(1); %find length
[counts, indices] = hist(mytext, 0:max(mytext)); %find ASCII histogram
probs = counts/len; %find ASCII probabilities
dict = seleme_huffmandict(indices, probs); %find Huffman dictionary
bitstream = huffmanenco(mytext, dict); %apply Huffman encoding
decoded = huffmandeco(bitstream, dict); %apply Huffman decoding
if( (decoded - mytext) ~= 0) %report error if encode/decode mismatch
    error('bitstream corrupted!');
end
%find bitstream length (in bytes)
dims_bitstream = size(bitstream); len_bitstream = dims_bitstream(1)/8;
['Bitstream length is ' num2str(dims_bitstream(1)) '.']
['Reduced size by ' num2str(len_bitstream/len) '.']
%find average codeword length
temp = size(dict); dictionary_length = temp(1);
for i=1:dictionary_length
    temp = size(dict{i,2});
    codeword_lengths(i) = temp(2);
end
%the average codeword length is the length of each word times its prob. of occurance
probss = probs(probs~=0);
average_codeword_length = sum(codeword_lengths.*probss);
['Average codeword length ' num2str(average_codeword_length) '.']