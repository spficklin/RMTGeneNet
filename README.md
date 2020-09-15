# NOTICE: RMTGeneNet is Deprecated

RMTGeneNet is deprecated. Please use [KINC](https://kinc.readthedocs.io/en/latest/) instead.

# Historical Instructions:
## About

RMTGeneNet is an open-source software package that provides tools for
construction of gene co-expression networks.  It supports correlation methods
of Pearson, Spearman and Mutual Information to generate a similarity matrix. It
uses Random Matrix Theory (RMT)for identification of the threshold to cut the
similarity matrix to form an adjacency matrix that represents the network.  A
third step is available to extract the network from the adjacency matrix into
a format for loading further analysis and visualization.  

RMTGeneNet is offered under a GPL v2.0 license agreement.  


## Installation
For installation instructions see the INSTALL.txt file.


## Build a Network
To construct a gene co-expression network using RMTGeneNet an expression
matrix must first be constructed.  The expression matrix should be present in
a tab-delimited file where the columns represent the experimental samples and
the rows represent the measured unit. In the case of a set of microarray
experiments the columns would represent each microarray and the rows would
represent the probesets of the array.  For RNA-seq datasets the samples are
the column names and the rows are the transcript or gene names. The cells in 
the matrix should contain the measured expression levels. 

The header column is optional but is recommended. If present it should
only contain the sample names.  Thus if exporting an expression matrix from
Excel the first column in the header typically indicates that the first column
contains gene (or probeset) IDs (e.g. 'Gene ID').  This first column should
be removed.  There should only be sample names in the first row, equal to the
number of samples in the file. 

RMTGeneNet v1.0a provides three different "programs" all from the same
executable.  These three programs are 'similarity', 'threshold' and 'extract'.
The first, 'similarity', is used to construct the similarity matrix using
one of three correlation methods.  The second, 'threshold', uses Random Matrix
Theory to determine the threshold to the similarity matrix.  The third, 
'extract' is used to generate tab-delimited files that can be used for 
downstream analysis or for visualization.

Instrutions for performing each step can be obtained by executing RMTGeneNet
with the with the --help option. For example:

  rmtgnet help
  
For instructions regarding similarity matrix construction:

  rmtgnet similarity --help 
  
For instructions regarding thresholding:

  rmtgnet threshold --help
  
For instructions regarding network extraction:

  rmtgnet extract --help


## Citing RMTGeneNet
Please use the following citation if RMTGeneNet has been useful to your work:

Gibson SM, Ficklin SP, Isaacson S, Luo F, Feltus FA, et al. (2013)
Massive-Scale Gene Co-Expression Network Construction and Robustness Testing
Using Random Matrix Theory. PLoS ONE 8(2): e55871.

## Example: Construct an S. cerevisiae (yeast) Network
RMTGeneNet contains an example directory containing yeast data as an example. 
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
as outlier samples. In total, 10359 probesets were available, but to
reduce the size of the file only values for 576 probesets are included in the 
file. For detailed instructions about the quality control steps used, please 
see the publication:


### Step 1: Construct correlation matrix
The first step in construction of the yeast network is to construct
the correlation matrix.  The following commands can be executed to construct
this matrix:

  cd examples
  ../rmtgnet similarity --ematrix yeast-s_cerevisiae1.global.RMA.nc-no-na.txt \
    --rows 577 --cols 1535 --method sc --headers

The number of probesets (--rows) and samples (--cols) in the file aree 
provided to the program as well as the Spearman (--method) as the correlation
method.  The file has a header line (--headers).


### Step 2: Use RMT to determine an appropriate threshold
The second step is to use Random Matrix Theory (RMT) to identify an
appropriate threshold for the network. 

  ../rmtgnet threshold --ematrix yeast-s_cerevisiae1.global.RMA.nc-no-na.txt \
    --rows 577 --cols 1535 --method sc --headers 


### Step 3: Generate additional network files
The threshold returned from Step 2 was 0.863100. This value is reported in the
yeast-s_cerevisiae1.global.RMA.nc-no-na.sc.th.txt file that was created
in the previous step.  We can now use that threshold to generate the final 
network file:

  ../rmtgnet extract --ematrix yeast-s_cerevisiae1.global.RMA.nc-no-na.txt \
    --rows 577 --cols 1535 --method sc --headers --th 0.863100

The resulting network can now be found in the file named:
yeast-s_cerevisiae1.global.RMA.nc-no-na.sc.th0.863100.coexpnet.edges.txt

The resulting file contains 4786 edges connecting 511 nodes (probesets).

This file can be used to visualize the network in Cytoscape 
(http://www.cytoscape.org/).


