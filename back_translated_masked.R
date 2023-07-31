library(seqinr)

#Create an empty vector for charset names and read the kept.msk file.

charset <- character()
kept.msk <- scan(file="../msk/kept.msk",what="character",quiet=TRUE)

#Find charset names throughout the kept.msk file.

for (i in 1:length(kept.msk)) ifelse(kept.msk[i] == "Gene",charset <- c(charset,strsplit(kept.msk[i+1],":")[[1]]),NA)
num.charset <- length(charset)

all.positions <- numeric()

for (f in 1:num.charset) {

#Read conserved sites from kept.msk

	for (k in 1:length(kept.msk)) {
		if (f == num.charset) {
			if (kept.msk[k] == paste(charset[f],":",sep="")) {
				current.first.kept <- k+1
				current.last.kept <- length(kept.msk)
				}
			}
		else {
			if (kept.msk[k] == paste(charset[f],":",sep="")) current.first.kept <- k+1
			if (kept.msk[k] == paste(charset[f+1],":",sep="")) current.last.kept <- k-2
			}
		}
	all.positions <- c(all.positions,current.first.kept,current.last.kept)
	current.kept <- as.numeric(kept.msk[current.first.kept:current.last.kept])

#Back-translate aminoacids into nucleotides.

	current.aminoacids <- read.fasta(paste("../aa.fasta_aln/",charset[f],".aln_aa_trimmed.fa",sep=""),seqtype="AA",forceDNAtolower=FALSE,strip.desc=TRUE)
	current.nucleotides <- read.fasta(paste("../nt/",charset[f],".cds",sep=""),seqtype="DNA",forceDNAtolower=FALSE,strip.desc=TRUE)
	if (!all(getName(current.aminoacids) == getName(current.nucleotides))) {
		message(paste(charset[f],": warning! Different names were detected between aminoacid and nucleotide file!",sep=""))
		}
	num.current.taxa <- length(current.aminoacids)
	for (t in 1:num.current.taxa) {
		current.back.translation <- character()
		current.masked.back.translation <- character()
		gaps.aminoacids <- 0
		for (s in 1:length(current.aminoacids[[t]])) {
			if (current.aminoacids[[t]][s] == "-") {
				gaps.aminoacids <- gaps.aminoacids+1
				current.back.translation <- c(current.back.translation,"-","-","-")
				}
			else if (any(is.na(current.nucleotides[[t]][(s-gaps.aminoacids)*3-2]),is.na(current.nucleotides[[t]][(s-gaps.aminoacids)*3-1]),is.na(current.nucleotides[[t]][(s-gaps.aminoacids)*3]))) {
				message(paste(charset[f],": warning! NA to be inserted!",sep=""))
				current.back.translation <- c(current.back.translation,current.nucleotides[[t]][(s-gaps.aminoacids)*3-2],current.nucleotides[[t]][(s-gaps.aminoacids)*3-1],current.nucleotides[[t]][(s-gaps.aminoacids)*3])
				}
			else current.back.translation <- c(current.back.translation,current.nucleotides[[t]][(s-gaps.aminoacids)*3-2],current.nucleotides[[t]][(s-gaps.aminoacids)*3-1],current.nucleotides[[t]][(s-gaps.aminoacids)*3])

#Write a codon into masked back-translated files if it is a conserved site

			if (s %in% current.kept) {
				if (current.aminoacids[[t]][s] == "-") {
					current.masked.back.translation <- c(current.masked.back.translation,"-","-","-")
					}
				else if (any(is.na(current.nucleotides[[t]][(s-gaps.aminoacids)*3-2]),is.na(current.nucleotides[[t]][(s-gaps.aminoacids)*3-1]),is.na(current.nucleotides[[t]][(s-gaps.aminoacids)*3]))) {
					message(paste(charset[f],": warning! NA to be inserted!",sep=""))
					current.masked.back.translation <- c(current.masked.back.translation,current.nucleotides[[t]][(s-gaps.aminoacids)*3-2],current.nucleotides[[t]][(s-gaps.aminoacids)*3-1],current.nucleotides[[t]][(s-gaps.aminoacids)*3])
					}
				else current.masked.back.translation <- c(current.masked.back.translation,current.nucleotides[[t]][(s-gaps.aminoacids)*3-2],current.nucleotides[[t]][(s-gaps.aminoacids)*3-1],current.nucleotides[[t]][(s-gaps.aminoacids)*3])
				}
			}
		write.fasta(current.back.translation,getName(current.aminoacids[t]),paste("../back-translated.fas/",charset[f],"_back-translated.fasta_aln",sep=""),open="a",nbchar=length(current.back.translation))
		write.fasta(current.masked.back.translation,getName(current.aminoacids[t]),paste("../back-translated_masked.fas/",charset[f],"_back-translated_masked.fasta_aln",sep=""),open="a",nbchar=length(current.masked.back.translation))
		}
	message(paste("File #",f," (",charset[f],") back-translated!",sep=""))
	}
