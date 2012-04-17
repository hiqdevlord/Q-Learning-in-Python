#!/bin/bash

ALGORITHM=$1
PREFIX=$2
SUFFIX=$3
START=$4
END=$5
COMMANDPATH=$6

echo ALGORITHM:$ALGORITHM PREFIX:$PREFIX SUFFIX:$SUFFIX START:$START END:$END COMMANDPATH:$COMMANDPATH

if [[ -z "$ALGORITHM" || -z "$PREFIX" || -z "$SUFFIX" || -z "$START" || -z "$END" || -z "$COMMANDPATH" ]]
then
    echo usage: RL.sh [ALGORITHM] [PREFIX] [SUFFIX] [START] [END] [COMMANDPATH]
fi

until [ $START -gt $END ]; do
    ./RL-$ALGORITHM.py --filePath=$PREFIX/$START/$SUFFIX/ \
                       --commandPath=$COMMANDPATH/ \
                       --alpha=0.05 \
                       --gamma=0.95 \
                       --epsilon=0.0 \
                       --epsilonIncrement=0.0005 \
                       --gammaPRQL=0.95 \
                       --K=2000 \
                       --H=100 \
                       --numberOfExecutions=1 \
                       --tau=0.0 \
                       --deltaTau=0.05 \
                       --psi=1.0 \
                       --v=0.95 > $PREFIX/$START/$SUFFIX/shell.output & 
    
    let START+=1
done
