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
    char * cmethod;

    float ** parseScores(char * scores_str);


  public:
    ThresholdMethod(EMatrix *ematrix, char * cmethod);
    ~ThresholdMethod();


    // TO BE IMPLEMENTED BY THE CHILD CLASS
    // ------------------------------------
    double findThreshold();
};

#endif
