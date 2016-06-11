#ifndef _SIMILARITY_
#define _SIMILARITY_

#include <getopt.h>
#include <sys/stat.h>
#include <string.h>
#include "./methods/SpearmanSimilarity.h"
#include "./methods/PearsonSimilarity.h"
#include "./methods/MISimilarity.h"
#include "../general/misc.h"

// a global variable for the number of rows in each output file
#define ROWS_PER_OUTPUT_FILE 10000
// the number of bins in the correlation value histogram
#define HIST_BINS 100


class RunSimilarity {

  private:
    // The expression matrix object.
    EMatrix * ematrix;
    // Specifies the methods: sc, pc, mi.
    char ** method;
    // Indicates the number of methods.
    int num_methods;
    // The minimum number of observations to calculate correlation.
    int min_obs;
    // An array holding the histogram of similarity scores.
    int * histogram;
    // The threshold for expression values.
    double threshold;

    // Variables for the expression matrix
    // -----------------------------------
    // Indicates if the expression matrix has headers.
    int headers;
    // The input file name
    char *infilename;
    // The number of rows in the input ematrix file (including the header)
    int rows;
    // The number of cols in the input ematrix file.
    int cols;
    // Indicates if missing values should be ignored in the EMatrix file.
    int omit_na;
    // Specifies the value that represents a missing value.
    char *na_val;
    // Specifies the transformation function: log2, none.
    char func[10];

    // Variables for mutual information
    // --------------------------------
    // The number of bins for the B-spline estimate of MI.
    int mi_bins;
    // The degree of the B-spline function.
    int mi_degree;


    void writeHistogram();
    // Calcualtes pair-wise similarity score the traditional way.
    void executeTraditional();
    void parseMethods(char * methods_str);
    void parseMinSim(char * minsim_str);

  public:
    RunSimilarity(int argc, char *argv[]);
    ~RunSimilarity();
    void execute();
    static void printUsage();

};

#endif
