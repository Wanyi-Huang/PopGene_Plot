# PopGene_Plot
R scripts for visualizing population genetic analyses (PopGene).
<h1>Overview</h1>

<p>The script [ABBABABAwindows.py](https://github.com/simonhmartin/genomics_general) performs analyses described in Martin et al. 2015, MBE, compurting the D statistic and f estimators in windows across the genome.</p>
<p>The modified fd test with 100-kb sliding windows and 10-kb steps is performed as described using ABBABABAwindows.py in Genomics_general. Three populations and one outgroup are used with the relationship (((P1, P2), P3), O), where P1 is closer to P2 than P3. Positive fd values are considered as introgression signals and visualized in dot plots using the R package ‘ggplot2’.</p>

<h1>System Requirements</h1>
<h2>Hardware Requirements</h2>
<p>The R package requires only a standard computer with enough RAM to support the operations defined by a user. For optimal performance, we recommend a computer with the following specs:</p>
<p>RAM: 16+ GB</p>
<p>CPU: 4+ cores, 3.3+ GHz/core</p>
<p>The runtimes below are generated using a computer with the recommended specs.</p>
<h2>Software Requirements</h2>
<p>The package development version is tested on Linux operating systems.</p>
<p>The R package should be compatible with Windows, Mac, and Linux operating systems.</p>
<p><strong>Installing R version 3.4.2 on Ubuntu 16.04.</strong> The latest version of R can be installed by adding the latest repository to apt:</p>
<code>sudo apt-get install r-base r-base-dev
</code></p>
<p>which should install in about 20 seconds.</p>

<h1>Installation Guide</h1>
<h2>Package dependencies</h2>
<code>install.packages('ggplot2')
</code></p>


