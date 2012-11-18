# set up
st <- readLines('states.txt')
ls <- list.files('data')
ls_i <- gsub("all_140_in_([0-9]{2})\\.[A-Z0-9]+\\.csv", "\\1", ls)

# iteratively merge to avoid duplicate headers
for (i in 1:length(st)) {
    
    files <- paste0('data/', ls[ls_i==st[i]] )
    state <- read.csv(files[1], stringsAsFactors=F)
    names(state) <- gsub("\\.", "_", names(state))
    names_to_discard <- names(state)[names(state)!="GEOID"]
    n <- length(files)

    for (f in 2:n) {
        state2 <- read.csv(files[f], stringsAsFactors=F)
        names(state2) <- gsub("\\.", "_", names(state2))
        state2 <- state2[, which(!names(state2) %in% names_to_discard)]
        state <- join(state2, state, by="GEOID", type="right")
        names_to_discard  <- names(state)[names(state)!="GEOID"]
        print(paste(st[i], f, f/n, '%'))
    }
    write.csv(state, paste0('states/st', st[i], '.csv'), row.names=F)
}
