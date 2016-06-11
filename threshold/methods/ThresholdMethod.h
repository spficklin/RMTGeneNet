#ifndef _THRESHOLDMETHOD_
#define _THRESHOLDMETHOD_

#include <getopt.h>

#include "../../ematrix/EMatrix.h"

void print_threshold_usage();

/**
 * A base class for thresholding methods to inherit from.
 *
 * This class constructor will read arguments from the command-line, and
 * provides the getters and setters for commonly needed class members.
 */
class ThresholdMethod {

  protected:

    // The expression matrix object.
    EMatrix * ematrix;
    // The directory where the expression matrix is found
    char * bin_dir;
    // Specifies the correlation method that was used: pc, mi, sc
    char ** method;
    // Indicates the number of methods.
    int num_methods;
    // The method (e.g. sc, mi, pc) to use for thersholding
    char * th_method;
    // The index of the th_method in the methods array
    int th_method_index;

    float ** parseScores(char * scores_str);


  public:
    ThresholdMethod(EMatrix *ematrix, char ** method, int num_methods,
        char * th_method);
    ~ThresholdMethod();


    // TO BE IMPLEMENTED BY THE CHILD CLASS
    // ------------------------------------
    double findThreshold();
};

#endif
