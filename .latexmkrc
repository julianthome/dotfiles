@generated_exts = qw(stp nlo fls aux idx ind lof lot out toc acn acr alg glg gls ist);

$pdf_mode = 1;
$bibtex_use = 2;

$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
$pdf_previewer = 'open -a skim';
$clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz';
