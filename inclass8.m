%Inclass assignment 8
%Walter Frank Lenoir

%Using the swalign function
% A. Create a random DNA sequence of length 100. 
    seq = randseq(100);
% B. Create a second sequence from the first one by changing the middle 20 basepairs (at positions 41-60)
    seqmid = randseq(20);
    seq2 = strcat(seq(1:39),seqmid,seq(60:100));
% C. run swalign on the two sequences with the default parameters
    [score,align,start] = swalign(seq,seq2);
% D. run swalign with much higher and lower values of the GapOpen parameter
% and explain the results. 
    [score,align,start] = swalign(seq,seq2,'GapOpen',16);
    [score,align,start] = swalign(seq,seq2,'GapOpen',1);
    
    %The alignments for the lower and higher gapopen parameter differed and
    %were both different from the original. With a higher gap
    %penality, the minimum amount of gaps were taken in the alignment 
    %suggesting that all original seq nucleotides matched up (100 char long).
    %With a gap penality of 1, many more gaps were introduced and allowed,
    %greatly extending the alignment (char length = 108). The original
    %alignment had a char length of 102, suggesting that not all original
    %nucleotides of seq matched up (seq 1:39 & 60:100).
    
% E. run swalign with a low value of GapOpen but a high value of ExtendGap,
% explain the result
    [score,align,start] = swalign(seq,seq2,'GapOpen',1,'ExtendGap',16);

    %The resulting alignment contained gaps but due to the high extend
    %penalty, few gaps were longer than 1 sequence. The resulting alignment had
    %a char length of 103. Which is closer to the original alignment length.
    %The extend gap penality caused this alignment to have more mismatches
    %compared to the alignment of gap open at 1 only. 

% F. run swalign align with the default value of GapOpen and a low value
% of ExtendGap and explain the result. 
    [score,align,start] = swalign(seq,seq2,'ExtendGap',1);

    %This result had few gaps (3 in the example), but due to the low extend gap penalty
    %the resulting gaps were very long. This allowed for the middle 20
    %sequences to have the better possible alignment. Resulting align char length was
    %106 with the random sequence. 