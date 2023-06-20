#!/bin/sh

set -e -x

rm -rf mcview/one-pass/preliminary.*
cp -R mcview/one-pass/preliminary mcview/one-pass/preliminary.auto
Rscript scripts/update_types.r one-pass/preliminary captured/one-pass.preliminary.types.csv
mv mcview/one-pass/preliminary mcview/one-pass/preliminary.manual

for I in 2 3 4
do
    rm -rf mcview/iterative/iteration-$I.*
    cp -R mcview/iterative/iteration-$I mcview/iterative/iteration-$I.auto
    Rscript scripts/update_types.r iterative/iteration-$I captured/iterative.iteration-$I.types.csv
    mv mcview/iterative/iteration-$I mcview/iterative/iteration-$I.manual
done

for A in mcview/*/*.auto
do
    sed -i '/^title:/s/$/ A/' $A/config/config.yaml
done

for M in mcview/*/*.manual
do
    sed -i '/^title:/s/$/ M/' $M/config/config.yaml
done
