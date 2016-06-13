RMTGeneNet
==========

RMTGeneNet is an open-source software package that provides tools for
construction of gene co-expression networks.  It supports correlation methods
of Pearson, Spearman and Mutual Information to generate a similarity matrix. It
uses Random Matrix Theory (RMT)for identification of the threshold to cut the
similarity matrix to form an adjacency matrix that represents the network.  A
third step is available to extract the network from the adjacency matrix into
a format for loading further analysis and visualization.  

RMTGeneNet is offered under a GPL v2.0 license agreement.  


INSTALLATION
------------
For installation instructions see the INSTALL.txt file.


BUILD A NETWORK
---------------
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

EXAMPLE
-------
This package contains an example yeast dataset for testing of this software. 
Please see the README.txt in the examples directory for more information and
command-line examples for creating the example yeast network.