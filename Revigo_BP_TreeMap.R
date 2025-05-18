# A treemap R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","value","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0014812","muscle cell migration",0.156564526951465,1.4232668823857921,0.9874458818286656,0.00515006,"muscle cell migration"),
c("GO:0014909","smooth muscle cell migration",0.0782822634757325,1.424469624291472,0.9875864651087064,0.41443294,"muscle cell migration"),
c("GO:0014910","regulation of smooth muscle cell migration",0.3690449563855961,1.424469624291472,0.9604149614913823,0.0289787,"regulation of smooth muscle cell migration"),
c("GO:0014911","positive regulation of smooth muscle cell migration",0.21807201968239764,1.481170905473963,0.9185253989129695,0.47446616,"regulation of smooth muscle cell migration"),
c("GO:0016051","carbohydrate biosynthetic process",0.6821740102885261,1.3486927800842896,0.9733778084088952,0.09037915,"carbohydrate biosynthetic process"),
c("GO:0019751","polyol metabolic process",0.525609483337061,1.4232668823857921,0.9025832732916945,-0,"polyol metabolic process"),
c("GO:0043647","inositol phosphate metabolic process",0.1621561171997316,1.481170905473963,0.8952054764044598,0.68333625,"polyol metabolic process"),
c("GO:0033002","muscle cell proliferation",0.2460299709237307,1.3306420848110063,0.9763985820715662,0.00571537,"muscle cell proliferation"),
c("GO:0048659","smooth muscle cell proliferation",0.04473272198613285,1.396121526190944,0.9690770995269705,0.44616371,"muscle cell proliferation"),
c("GO:0034694","response to prostaglandin",0.20688883918586445,1.481170905473963,0.9260115482730326,0.06848597,"response to prostaglandin"),
c("GO:0014074","response to purine-containing compound",0.810780585998658,1.411427745949038,0.9315911118183343,0.25880236,"response to prostaglandin"),
c("GO:0046683","response to organophosphorus",0.7269067322746589,1.4134259543597827,0.9384711552058026,0.22697161,"response to prostaglandin"),
c("GO:0071415","cellular response to purine-containing compound",0.07269067322746589,1.481170905473963,0.927760642436825,0.48344,"response to prostaglandin"),
c("GO:0097305","response to alcohol",1.509729367031984,1.330572247913444,0.9111604827513922,0.52469704,"response to prostaglandin"),
c("GO:0097306","cellular response to alcohol",0.5703422053231939,1.424469624291472,0.891280826061067,0.52377377,"response to prostaglandin"),
c("GO:1901654","response to ketone",1.2357414448669202,1.3486927800842896,0.9126291674759693,0.27371564,"response to prostaglandin"),
c("GO:1901655","cellular response to ketone",0.5871169760679937,1.424469624291472,0.8894448287465735,0.47270399,"response to prostaglandin"),
c("GO:0035590","purinergic nucleotide receptor signaling pathway",0.1621561171997316,1.481170905473963,0.9390576580499282,-0,"purinergic nucleotide receptor signaling pathway"),
c("GO:0007200","phospholipase C-activating G protein-coupled receptor signaling pathway",0.8051889957503914,1.420793688392829,0.9341102436848413,0.1699269,"purinergic nucleotide receptor signaling pathway"),
c("GO:0035589","G protein-coupled purinergic nucleotide receptor signaling pathway",0.07269067322746589,1.481170905473963,0.942443629642896,0.27736347,"purinergic nucleotide receptor signaling pathway"),
c("GO:0043954","cellular component maintenance",0.3690449563855961,1.424469624291472,0.9910815245502925,0.00551725,"cellular component maintenance"),
c("GO:0034331","cell junction maintenance",0.27398792216506374,1.481170905473963,0.972823203487986,0.13261413,"cellular component maintenance"),
c("GO:0048660","regulation of smooth muscle cell proliferation",0.7660478640125251,1.396121526190944,0.942827535745172,0.03549273,"regulation of smooth muscle cell proliferation"),
c("GO:1904705","regulation of vascular associated smooth muscle cell proliferation",0.3299038246477298,1.424469624291472,0.924816250787424,0.40652559,"regulation of smooth muscle cell proliferation"),
c("GO:0051282","regulation of sequestering of calcium ion",0.710131961529859,1.411427745949038,0.8116312965068819,0.03303562,"regulation of sequestering of calcium ion"),
c("GO:0060191","regulation of lipase activity",0.1789308879445314,1.424469624291472,0.8762398874649114,0.01863171,"regulation of lipase activity"),
c("GO:0032409","regulation of transporter activity",1.0344441959293222,1.3077931845412627,0.8712292259248728,0.38758354,"regulation of lipase activity"),
c("GO:0060193","positive regulation of lipase activity",0.11742339521359875,1.4604159477562633,0.8519312487220292,0.50498065,"regulation of lipase activity"),
c("GO:1901019","regulation of calcium ion transmembrane transporter activity",0.34667859539252965,1.424469624291472,0.6373620049880482,0.41262764,"regulation of lipase activity"),
c("GO:0070374","positive regulation of ERK1 and ERK2 cascade",1.067993737418922,1.3486927800842896,0.9181505805710864,0.03703178,"positive regulation of ERK1 and ERK2 cascade"),
c("GO:0070633","transepithelial transport",0.18452247819279805,1.481170905473963,0.9303711786571159,0,"transepithelial transport"),
c("GO:0006403","RNA localization",1.0288526056810556,1.357435827381193,0.9204785199223385,0.18884812,"transepithelial transport"),
c("GO:0006820","monoatomic anion transport",0.9841198836949228,1.396121526190944,0.8997663011760784,0.56539235,"transepithelial transport"),
c("GO:0006821","chloride transport",0.7604562737642585,1.4134259543597827,0.9019521698817835,0.26647383,"transepithelial transport"),
c("GO:0006909","phagocytosis",0.9002460299709237,1.3362201555986477,0.9174976470369884,0.27132983,"transepithelial transport"),
c("GO:0015698","inorganic anion transport",1.056810556922389,1.396121526190944,0.918867845549073,0.23167772,"transepithelial transport"),
c("GO:0015931","nucleobase-containing compound transport",1.2804741668530528,1.340660988647895,0.9027079765714797,0.28206129,"transepithelial transport"),
c("GO:0051028","mRNA transport",0.7157235517781256,1.4134259543597827,0.867793989519637,0.48284199,"transepithelial transport"),
c("GO:0051208","sequestering of calcium ion",0.02795795124133304,1.411427745949038,0.9342064329079715,0.68758238,"transepithelial transport"),
c("GO:0051651","maintenance of location in cell",0.5535674345783941,1.3362201555986477,0.9198894627071325,0.21007652,"transepithelial transport"),
c("GO:0097553","calcium ion transmembrane import into cytosol",0.5088347125922612,1.3486927800842896,0.8960845743210694,0.52868431,"transepithelial transport"),
c("GO:1902930","regulation of alcohol biosynthetic process",0.28517110266159695,1.4659046268995228,0.9105619292679932,0.02252502,"regulation of alcohol biosynthetic process"),
c("GO:0006109","regulation of carbohydrate metabolic process",0.9953030641914561,1.3714622054997974,0.9540794443694777,0.12209881,"regulation of alcohol biosynthetic process"),
c("GO:0045913","positive regulation of carbohydrate metabolic process",0.45291881010959517,1.424469624291472,0.8730445725175552,0.16322723,"regulation of alcohol biosynthetic process"),
c("GO:1902932","positive regulation of alcohol biosynthetic process",0.1509729367031984,1.481170905473963,0.867678476033008,0.63800926,"regulation of alcohol biosynthetic process"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
  stuff,
  index = c("representative","description"),
  vSize = "value",
  type = "categorical",
  vColor = "representative",
  title = "Revigo TreeMap",
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none"
)

dev.off()

