#include "ThresholdMethod.h"



/**
 * DRArgs constructor.
 */
ThresholdMethod::ThresholdMethod(EMatrix *ematrix, char * cmethod) {

  this->ematrix = ematrix;
  this->cmethod = cmethod;


  // For the binary file format:
  bin_dir = (char *) malloc(sizeof(char) * strlen(ematrix->getInfileName()));
  if (strcmp(cmethod, "mi") == 0) {
    strcpy(bin_dir, "MI");
  }
  else if (strcmp(cmethod, "pc") == 0) {
    strcpy(bin_dir, "Pearson");
  }
  else if (strcmp(cmethod, "sc") == 0) {
    strcpy(bin_dir, "Spearman");
  }
}

/**
 * DRArgs destructor.
 */
ThresholdMethod::~ThresholdMethod() {
  free(bin_dir);
}

