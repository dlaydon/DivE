\name{Bact1}
\alias{Bact1}
\alias{Bact2}
\docType{data}
\title{
Count of Medically Important Bacteria Species in a Sample
}
\description{
This gives a fictitious example of a sample of 7814 bacteria comprising of 144 unique species. Designed as a test dataset for the DivE diversity estimation algorithm.
}
\usage{data(Bact1)}
\format{
  A data frame with 144 observations on the following 2 variables.
  \describe{
    \item{\code{Bacteria}}{a factor with levels \code{Acetobacter_aurantius} \code{Acinetobacter_baumannii} \code{Actinomyces_israelii} \code{Agrobacterium_radiobacter} \code{Agrobacterium_tumefaciens} \code{Anaplasma} \code{Azorhizobium_caulinodans} \code{Azotobacter_vinelandii} \code{Bacillus_anthracis} \code{Bacillus_brevis} \code{Bacillus_cereus} \code{Bacillus_fusiformis} \code{Bacillus_licheniformis} \code{Bacillus_megaterium} \code{Bacillus_mycoides} \code{Bacillus_stearothermophilus} \code{Bacillus_subtilis} \code{Bacteroides_fragilis} \code{Bacteroides_gingivalis} \code{Bacteroides_melaninogenicus} \code{Bartonella_henselae} \code{Bartonella_quintana} \code{Bordetella_bronchiseptica} \code{Bordetella_pertussis} \code{Borrelia_burgdorferi} \code{Brucella_abortus} \code{Brucella_melitensis} \code{Brucella_suis} \code{Burkholderia_cepacia} \code{Burkholderia_mallei} \code{Burkholderia_pseudomallei} \code{Calymmatobacterium_granulomatis} \code{Campylobacter_coli} \code{Campylobacter_fetus} \code{Campylobacter_jejuni} \code{Campylobacter_pylori} \code{Chlamydia_trachomatis} \code{Chlamydophila_pneumoniae} \code{Chlamydophila_psittaci} \code{Clostridium_botulinum} \code{Clostridium_difficile} \code{Clostridium_perfringens} \code{Clostridium_tetani} \code{Corynebacterium_diphtheriae} \code{Corynebacterium_fusiforme} \code{Coxiella_burnetii} \code{Ehrlichia_chaffeensis} \code{Enterobacter_cloacae} \code{Enterococcus_avium} \code{Enterococcus_durans} \code{Enterococcus_faecalis} \code{Enterococcus_faecium} \code{Enterococcus_galllinarum} \code{Enterococcus_maloratus} \code{Escherichia coli} \code{Francisella tularensis} \code{Fusobacterium_nucleatum} \code{Gardnerella_vaginalis} \code{Haemophilus_ducreyi} \code{Haemophilus_influenzae} \code{Haemophilus_parainfluenzae} \code{Haemophilus_pertussis} \code{Haemophilus_vaginalis} \code{Helicobacter_pylori} \code{Klebsiella_pneumoniae} \code{Lactobacillus_Bulgaricus} \code{Lactobacillus_acidophilus} \code{Lactobacillus_casei} \code{Lactococcus_lactis} \code{Legionella_pneumophila} \code{Listeria_monocytogenes} \code{Methanobacterium_extroquens} \code{Microbacterium_multiforme} \code{Micrococcus_luteus} \code{Moraxella_catarrhalis} \code{Mycobacterium} \code{Mycobacterium_avium} \code{Mycobacterium_bovis} \code{Mycobacterium_diphtheriae} \code{Mycobacterium_intracellulare} \code{Mycobacterium_leprae} \code{Mycobacterium_lepraemurium} \code{Mycobacterium_phlei} \code{Mycobacterium_smegmatis} \code{Mycobacterium_tuberculosis} \code{Mycoplasma_fermentans} \code{Mycoplasma_genitalium} \code{Mycoplasma_hominis} \code{Mycoplasma_penetrans} \code{Mycoplasma_pneumoniae} \code{Neisseria_gonorrhoeae} \code{Neisseria_meningitidis} \code{Pasteurella_multocida} \code{Pasteurella_tularensis} \code{Peptostreptococcus} \code{Porphyromonas_gingivalis} \code{Pseudomonas_aeruginosa} \code{Rhizobium_radiobacter} \code{Rickettsia_prowazekii} \code{Rickettsia_psittaci} \code{Rickettsia_quintana} \code{Rickettsia_rickettsii} \code{Rickettsia_trachomae} \code{Rochalimaea} \code{Rochalimaea_henselae} \code{Rochalimaea_quintana} \code{Rothia_dentocariosa} \code{Salmonella_enteritidis} \code{Salmonella_typhi} \code{Salmonella_typhimurium} \code{Serratia_marcescens} \code{Shigella_dysenteriae} \code{Staphylococcus_aureus} \code{Staphylococcus_epidermidis} \code{Stenotrophomonas_maltophilia} \code{Streptococcus_agalactiae} \code{Streptococcus_avium} \code{Streptococcus_bovis} \code{Streptococcus_cricetus} \code{Streptococcus_faceium} \code{Streptococcus_faecalis} \code{Streptococcus_ferus} \code{Streptococcus_gallinarum} \code{Streptococcus_lactis} \code{Streptococcus_mitior} \code{Streptococcus_mitis} \code{Streptococcus_mutans} \code{Streptococcus_oralis} \code{Streptococcus_pneumoniae} \code{Streptococcus_pyogenes} \code{Streptococcus_rattus} \code{Streptococcus_salivarius} \code{Streptococcus_sanguis} \code{Streptococcus_sobrinus} \code{Treponema_denticola} \code{Treponema_pallidum} \code{Vibrio_cholerae} \code{Vibrio_comma} \code{Vibrio_parahaemolyticus} \code{Vibrio_vulnificus} \code{Wolbachia} \code{Yersinia_enterocolitica} \code{Yersinia_pestis} \code{Yersinia_pseudotuberculosis}}
    \item{\code{Count}}{a numeric vector}
  }
}

\references{
Laydon, D., Melamed, A., Sim, A., Gillet, N. A., Sim, K., Darko, S., Kroll, S., Douek, D. C., Price, D., Bangham, C. R. M., Asquith, B., Quantification of HTLV-1 clonality and TCR diversity, PLOS Comput. Biol. 2014
}
\examples{
data(Bact1)

hist(Bact1[,2], breaks=20, main="Bacterial diversity of a sample",
xlab="Number of bacteria of a given species", ylab="Number of bacterial species")
}
\keyword{datasets}
