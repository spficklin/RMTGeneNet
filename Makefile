#CC = mpic++ -m64
CC = g++ -m64
EXE_DIR = 

# Debugging CFLAGS
CFLAGS = -g -Wall -fno-inline
# Non-debugging CFLAGS
#CFLAGS = -Wall 
INCLUDES = -I/usr/local/include 
LDFLAGS = -Wall -O3 -lm -lgsl -lgslcblas -llapack -lblas -lpthread -g

OBJS = \
  general/error.o \
  general/misc.o \
  general/vector.o \
  stats/stats.o \
  stats/outlier.o \
  stats/swilk.o \
  stats/kurtosis.o \
  stats/sfrancia.o \
  stats/royston.o \
  ematrix/EMatrix.o \
  similarity/PairWiseSet.o \
  similarity/methods/PairWiseSimilarity.o \
  similarity/methods/MISimilarity.o \
  similarity/methods/PearsonSimilarity.o \
  similarity/methods/SpearmanSimilarity.o \
  similarity/RunSimilarity.o \
  threshold/methods/ThresholdMethod.o \
  threshold/methods/RMTThreshold.o \
  threshold/RunThreshold.o \
  extract/SimilarityMatrix.o \
  extract/SimMatrixBinary.o \
  extract/RunExtract.o \
  rmtgnet.o
EXE = rmtgnet

all: ${OBJS}
	${CC} ${OBJS} ${LDFLAGS} ${MPI_LDLINK} -o ${EXE}

general/misc.o: general/misc.cpp general/misc.h
	${CC} -c ${CFLAGS} ${INCLUDES} general/misc.cpp -o general/misc.o

general/vector.o: general/vector.cpp general/vector.h
	${CC} -c ${CFLAGS} ${INCLUDES} general/vector.cpp -o general/vector.o

general/error.o: general/error.cpp general/error.h
	${CC} -c ${CFLAGS} ${INCLUDES} general/error.cpp -o general/error.o

ematrix/EMatrix.o: ematrix/EMatrix.cpp ematrix/EMatrix.h
	${CC} -c ${CFLAGS} ${INCLUDES} ematrix/EMatrix.cpp -o ematrix/EMatrix.o

stats/stats.o: stats/stats.cpp stats/stats.h
	${CC} -c ${CFLAGS} ${INCLUDES} stats/stats.cpp -o stats/stats.o

stats/kurtosis.o: stats/kurtosis.cpp stats/kurtosis.h
	${CC} -c ${CFLAGS} ${INCLUDES} stats/kurtosis.cpp -o stats/kurtosis.o

stats/sfrancia.o: stats/sfrancia.cpp stats/sfrancia.h
	${CC} -c ${CFLAGS} ${INCLUDES} stats/sfrancia.cpp -o stats/sfrancia.o

stats/swilk.o: stats/swilk.cpp stats/swilk.h
	${CC} -c ${CFLAGS} ${INCLUDES} stats/swilk.cpp -o stats/swilk.o

stats/royston.o: stats/royston.cpp stats/royston.h
	${CC} -c ${CFLAGS} ${INCLUDES} stats/royston.cpp -o stats/royston.o

stats/outlier.o: stats/outlier.cpp stats/outlier.h
	${CC} -c ${CFLAGS} ${INCLUDES} stats/outlier.cpp -o stats/outlier.o

similarity/PairWiseSet.o: similarity/PairWiseSet.cpp similarity/PairWiseSet.h
	${CC} -c ${CFLAGS} ${INCLUDES} similarity/PairWiseSet.cpp -o similarity/PairWiseSet.o

similarity/methods/PairWiseSimilarity.o: similarity/methods/PairWiseSimilarity.cpp similarity/methods/PairWiseSimilarity.h
	${CC} -c ${CFLAGS} ${INCLUDES} similarity/methods/PairWiseSimilarity.cpp -o similarity/methods/PairWiseSimilarity.o

similarity/methods/SpearmanSimilarity.o: similarity/methods/SpearmanSimilarity.cpp similarity/methods/SpearmanSimilarity.h
	${CC} -c ${CFLAGS} ${INCLUDES} similarity/methods/SpearmanSimilarity.cpp -o similarity/methods/SpearmanSimilarity.o

similarity/methods/PearsonSimilarity.o: similarity/methods/PearsonSimilarity.cpp similarity/methods/PearsonSimilarity.h
	${CC} -c ${CFLAGS} ${INCLUDES} similarity/methods/PearsonSimilarity.cpp -o similarity/methods/PearsonSimilarity.o

similarity/methods/MISimilarity.o: similarity/methods/MISimilarity.cpp similarity/methods/MISimilarity.h
	${CC} -c ${CFLAGS} ${INCLUDES} similarity/methods/MISimilarity.cpp -o similarity/methods/MISimilarity.o

similarity/RunSimilarity.o: similarity/RunSimilarity.cpp similarity/RunSimilarity.h
	${CC} -c ${CFLAGS} ${INCLUDES} similarity/RunSimilarity.cpp -o similarity/RunSimilarity.o

indexer/Indexer.o: indexer/Indexer.cpp indexer/Indexer.h
	${CC} -c ${CFLAGS} ${INCLUDES} indexer/Indexer.cpp -o indexer/Indexer.o

indexer/IndexQuery.o: indexer/IndexQuery.cpp indexer/IndexQuery.h
	${CC} -c ${CFLAGS} ${INCLUDES} indexer/IndexQuery.cpp -o indexer/IndexQuery.o

indexer/RunIndex.o: indexer/RunIndex.cpp indexer/RunIndex.h
	${CC} -c ${CFLAGS} ${INCLUDES} indexer/RunIndex.cpp -o indexer/RunIndex.o

indexer/RunQuery.o: indexer/RunQuery.cpp indexer/RunQuery.h
	${CC} -c ${CFLAGS} ${INCLUDES} indexer/RunQuery.cpp -o indexer/RunQuery.o

threshold/methods/ThresholdMethod.o: threshold/methods/ThresholdMethod.cpp threshold/methods/ThresholdMethod.h
	${CC} -c ${CFLAGS} ${INCLUDES} threshold/methods/ThresholdMethod.cpp -o threshold/methods/ThresholdMethod.o

threshold/methods/RMTThreshold.o: threshold/methods/RMTThreshold.cpp threshold/methods/RMTThreshold.h
	${CC} -c ${CFLAGS} ${INCLUDES} threshold/methods/RMTThreshold.cpp -o threshold/methods/RMTThreshold.o

threshold/RunThreshold.o: threshold/RunThreshold.cpp threshold/RunThreshold.h
	${CC} -c ${CFLAGS} ${INCLUDES} threshold/RunThreshold.cpp -o threshold/RunThreshold.o

extract/SimilarityMatrix.o: extract/SimilarityMatrix.cpp extract/SimilarityMatrix.h
	${CC} -c ${CFLAGS} ${INCLUDES} extract/SimilarityMatrix.cpp -o extract/SimilarityMatrix.o

extract/SimMatrixBinary.o: extract/SimMatrixBinary.cpp extract/SimMatrixBinary.h
	${CC} -c ${CFLAGS} ${INCLUDES} extract/SimMatrixBinary.cpp -o extract/SimMatrixBinary.o

extract/RunExtract.o: extract/RunExtract.cpp extract/RunExtract.h
	${CC} -c ${CFLAGS} ${INCLUDES} extract/RunExtract.cpp -o extract/RunExtract.o

rmtgnet.o: rmtgnet.cpp rmtgnet.h
	${CC} -c ${CFLAGS} ${INCLUDES} ${MPI_INCLUDES} rmtgnet.cpp -o rmtgnet.o

clean:
	rm -f ${OBJS} ${EXE}

#install: all
#	install -m 0755 rmtgnet ${EXE_DIR}
