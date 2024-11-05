# PopGene_Plot
<h1>Overview</h1>
Statistical analysis in population genetic studies (PopGene) is essential for interpreting genetic data and understanding evolutionary processes. We provide R scripts to visualize the data from the statistical analysis.</p> 
<p><strong>Absolute divergence (dxy)</strong></p> 
<p>This statistic measures the genetic divergence between two populations based on nucleotide differences.</p> 
The dxy values between populations or isolates are calculated in a sliding window using <a href="https://github.com/simonhmartin/genomics_general">popgenWindows.py</a> in Genomics_general.</p> 
<p><strong>Modified D statistic</strong></p> 
<p>The modified D statistic (fd) is an extension of the traditional D statistic (also known as the ABBA-BABA statistic) used in population genetics to detect gene flow between closely related species.</p> 
<p>The fd test with sliding windows and steps is performed using <a href="https://github.com/simonhmartin/genomics_general">ABBABABAwindows.py</a> in Genomics_general . Three populations and one outgroup are used with the relationship (((P1, P2), P3), O), where P1 is closer to P2 than P3.</p> 
<p><strong>Nucleotide diversity</strong></p> 
<p>Nucleotide diversity (pi) is a key concept in population genetics that measures the genetic variation within a population. It quantifies how different the DNA sequences are among individuals at specific loci, providing insights into the population’s evolutionary history and adaptability.</p> 
<p>The pi is calculated between isolates using the <a href="https://vcftools.github.io/index.html">Vcftools 0.1.16</a> with sliding windows.</p> 
<p><strong>The dxy, fd, and pi values are visualized using the R package ‘ggplot2’.</strong></p> 

<h1>System Requirements</h1>
<h2>Hardware Requirements</h2>
<p>The R package requires only a standard computer with enough RAM to support the operations defined by a user. For optimal performance, we recommend a computer with the following specs:</p>
<p>RAM: 16+ GB</p>
<p>CPU: 4+ cores, 3.3+ GHz/core</p>
<p>The package has been tested on the following systems:</p>
<p>macOS: Sonoma (14.1)</p>
<p>Linux: Ubuntu 16.04</p>
<h2>Software Requirements</h2>
<p>The package development version is tested on Linux operating systems.</p>
<p>The R package should be compatible with Windows, Mac, and Linux operating systems.</p>
<p><strong>Installing R version 3.4.2 on Ubuntu 16.04.</strong> The latest version of R can be installed by adding the latest repository to apt:</p>
<code>sudo apt-get install r-base r-base-dev
</code></p>
<p>which should install in about 20 seconds.</p>

<h1>Installation Guide</h1>
<h2>Package dependencies</h2>
<code>install.packages(c('ggplot2', 'gridExtra') )
</code></p>

<h1>Demo</h1>
For demos of the functions, please check out each R script. The test files are the data from a population genetic study of <em>Cyptosporidium hominis</em>, an apicomplexa parasite with a genome of approximately 9 Mb in eight chromosomes.
<p>All plotes should be created in about 5 seconds.</p>
