rm -Rf out
clingo testass2.lp -n100 --outf=2 | clingraph --viz-encoding assignment2_viz.lp --out=render --format=png
