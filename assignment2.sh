rm -Rf out
clingo assignment2.lp -n1 --outf=2 | clingraph --viz-encoding assignment2_viz.lp --out=render --format=png
