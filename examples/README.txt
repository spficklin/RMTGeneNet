---------------------------------------------------------
Example: Construct an S. cerevisiae (yeast) Global Network
---------------------------------------------------------
This examples provides datasets and instructions for constructing
a co-expression networking using RMTGeneNet from microarray
samples using the Affymetrix Yeast Genome 2.0 Array. These samples
are publicly available in NCBI GEO. In total, expression levels from 1535 
samples are included in this dataset.

For this example, the file 'yeast-s_cerevisiae1.global.RMA.nc-no-na.txt'
contains the expression matrix for 1535 samples.  The columns of the
matrix correspond to the samples and the rows correspond to the probesets
on the array.  The expression levels in this file have already been
normalized.  Control probes and ambiguous probes have been removed as well
as outlier samples. In total, 10359 probesets remain in the file.  For 
detailed instructions about the quality control steps used, please see the 
publication:

Gibson SM, Ficklin SP, Isaacson S, Luo F, Feltus FA, et al. (2013)
Massive-Scale Gene Co-Expression Network Construction and Robustness Testing
Using Random Matrix Theory. PLoS ONE 8(2): e55871.


Step 1: Construct correlation matrix
------------------------------------
The first step in construction of the yeast network is to construct
the correlation matrix.  The following commands can be executed to construct
this matrix:

  ../rmtgnet similarity --ematrix yeast-s_cerevisiae1.global.RMA.nc-no-na.txt \
    --rows 10360 --cols 1535 --method sc --header

The number of probesets (--rows) and samples (--cols) in the file aree 
provided to the program as well as the Spearman (--method) as the correlation
method.  The file has a header line (--header).


Step 2: Use RMT to determine an appropriate threshold
-----------------------------------------------------
The second step is to use Random Matrix Theory (RMT) to identify an
appropriate threshold for the network. 

  ../rmtgnet threshold --ematrix yeast-s_cerevisiae1.global.RMA.nc-no-na.txt \
    --rows 10360 --cols 1535 --method sc --headers 


Step 3: Generate additional network files
-----------------------------------------
The threshold returned from Step 2 was 0.8561. This value is reported in the
yeast-s_cerevisiae1.global.RMA.nc-no-na.sc.th.txt file that was created
in the previous step.  We can now use that threshold to generate the final 
network file:

  ../rmtgnet extract --ematrix yeast-s_cerevisiae1.global.RMA.nc-no-na.txt \
    --rows 10360 --cols 1535 --method sc --headers --th 0.8561

The resulting network can now be found in the file named:
yeast-s_cerevisiae1.global.RMA.nc-no-na.sc.th0.856100.coexpnet.edges.txt

The resulting file contains 5952 edges connecting 576 nodes (probesets).

This file can be used to visualize the network in Cytoscape 
(http://www.cytoscape.org/).


