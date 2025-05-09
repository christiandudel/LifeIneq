
# here we should see what happens if 0s or negatives are in inputs

check_positive <- function(x){
  # not used?
  stopifnot(all(x > 0))
}
check_non_negative <- function(x){
  stopifnot(all(zapsmall(x) >= 0))
}

check_nas <- function(x){
  stopifnot(all(!is.na(x)))
}

check_lx <- function(lx){
  stopifnot(all(zapsmall(diff(lx)) <= 0))
  check_non_negative(x=lx)
  check_nas(x=lx)
}

check_age <- function(age){
  stopifnot(all(diff(age) > 0))
  stopifnot(all(age >= 0))
  check_nas(x=age)
}

check_ax <- function(ax,age){
  check_positive(x=ax)
  stopifnot(all(ax <= c(diff(age),30)))
  stopifnot(all(diff(ax + age) > 0))
  check_nas(x=ax)
}

check_dx <- function(dx,lx){
  check_non_negative(x=dx)
  check_nas(x=dx)
  # ensure reasonably constrained dx and lx
  stopifnot(sum(dx) / lx[1] > .9999 &
            lx[1] / sum(dx) > .9999 )
}

check_ex <- function(ex, age){
  check_non_negative(x=ex)
  stopifnot(zapsmall(diff(age + ex))>= 0)
  check_nas(x=ex)
}


check_vec_arg <- function(x,item = c("age","lx","ax","dx","ex"),age,lx){
  switch(item,
         age = check_age(x),
         lx = check_lx(x),
         ax = check_ax(x,age),
         dx = check_dx(x,lx),
         ex = check_ex(x,age))
}
check_args <- function(arg_list){
  L <- lapply(arg_list, length) |> unlist()
  arg_list[L == 0] <- NULL
  age_lengths <- c(length(arg_list$age),
              length(arg_list$lx),
              length(arg_list$ex),
              length(arg_list$ax))
  age_lengths <- age_lengths[age_lengths > 0]
  # dx not in some functions...
  if (any(names(arg_list) == "dx")){
    check_vec_arg(x=arg_list$dx, item="dx",lx=arg_list$lx)
    age_lengths <- c(age_lengths, length(arg_list$dx))
  }
  
  if (any(names(arg_list) == "distribution_type")){
    stopifnot(arg_list$distribution_type %in% c("rl","aad"))
  }
  if (any(names(arg_list) == "p")){
    p <- arg_list$p
    if (!(p > 0 & p < 1))
    stopifnot(arg_list$distribution_type %in% c("rl","aad"))
  }
  
  lengths_match <- diff(range(age_lengths)) == 0
  if (!lengths_match){
    stop("vector argument lengths must match")
  }
  
  check_vec_arg(x = arg_list$age, item="age")
  check_vec_arg(x = arg_list$lx, item="lx")
  check_vec_arg(x= arg_list$ex, item="ex", age = arg_list$age)
  check_vec_arg(x = arg_list$ax, item="ax", age = arg_list$age)
}

is_single <- function(age){
  all(diff(age) == 1)
}

# to remove CMD check warning
globalVariables(names = c("age","ax","dx","lx", "ex","check"))
