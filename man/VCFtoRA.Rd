% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/VCFtoRA.R
\name{VCFtoRA}
\alias{VCFtoRA}
\title{Convert VCF file into RA (Reference/Alternative) file.}
\usage{
VCFtoRA(infilename, direct = "./", makePed = T)
}
\arguments{
\item{infilename}{String giving the filename of the VCF file to be converted to RA format}

\item{direct}{String of the directory (or relative to the working direct) where the RA file is to be written.}

\item{makePed}{A logical value. If TRUE, a pedigree file is initialized.}
}
\value{
A string of the complete file path and name of the RA file created from the function.
In addition to creating a RA file, a pedigree file is also initialized in the same folder as the RA file if
specified and the named pedigree does not already exist.
}
\description{
Function for converting a VCF file into RA format.
}
\details{
The VCF files must contain some information regarding allelic depth. Currently, the function can use one of the following
fields (or group of fields) in a VCF file:
\itemize{
\item AD field
\item AO and RO fields
\item DP4 field
}
Information regarding VCF files and their format can be found at the samtools \href{https://samtools.github.io/hts-specs/VCFv4.3.pdf}{github} page.

RA format is a tab-delimited with columns, CHROM, POS, SAMPLES
where SAMPLES consists of sampleIDs, which typically consist of a colon-delimited sampleID, flowcellID, lane, seqlibID.
e.g.,
\tabular{llll}{
CHROM \tab  POS  \tab   999220:C4TWKACXX:7:56 \tab  999204:C4TWKACXX:7:56 \cr
1     \tab  415  \tab   5,0                   \tab  0,3                   \cr
1     \tab  443  \tab   1,0                   \tab  4,4                   \cr
1     \tab  448  \tab   0,0                   \tab  0,2
}
Note: Indels are removed, multiple alternative alleles are removed and ./. is translated into 0,0.

The format of the pedigree files is a csv file with the following columns.
\itemize{
\item SampleID: A unique character string of the sample ID. These must correspond to those found in the VCF file.
\item IndividualID: A character giving the ID number of the individual for which the sample corresponds to.
Note that some samples can be from the same individual. 
\item Mother: The ID of the mother as given in the IndividualID. Note, if the mother is unknown then this should be left blank.
\item Father: The ID of the father as given in the IndividualID. Note, if the father is unknown then this should be left blank.
\item Family: The name of the Family for a group of progeny with the same parents. Note that this is not necessary but if
given must be the same for all the progeny.
}
}
\examples{
MKfile <- Manuka11()
RAfile <- VCFtoRA(MKfile$vcf, makePed=F)
}
\seealso{
\code{\link{readRA}}
}
\author{
Timothy P. Bilton. Adapted from a Python script written by Rudiger Brauning and Rachael Ashby.
}
