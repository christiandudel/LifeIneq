
library(devtools)
build_vignettes()
run_examples(document = FALSE,run_dontrun=TRUE)
document()
check(vignettes = FALSE)
devtools::test()
# do a once-off library() action on our package structure.
# without actually having to install it or build it.
load_all()

# testing code:

?ineq_var
?ineq_edag
?ineq_H
?ineq_theil
?ineq_mld
?ineq_gini
?ineq_aid
?ineq_quantile
?ineq_iqr
?ineq_cp


#install_github("timriffe/LifeIneq",force=TRUE)
#library(LifeIneq)
data(LT)
age <- 0:110
ax  <- LT$ax
dx  <- LT$dx
lx  <- LT$lx
ex  <- LT$ex
# this one not in the wrapper:
ineq_quantile(age,lx,.5)
ineq(age,dx,lx,ex,ax,metho0d ="gini")


# ineq measures:
#c("variance", "sd","cov", "iqr", "AID", "Gini", "MLD", "edag", "Cp", "Theil", "H")

# these return vectors:
ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "variance")


ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "sd")
ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "cov")
ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "AID")
ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "Gini")
ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "MLD")
ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "edag")
ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "Theil")
ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "H")

# these just return for lowest age... Could be modified?
ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "Cp")



ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "iqr")


load_all()
data(LT)
age <- 0:110
ax  <- LT$ax
dx  <- LT$dx
lx  <- LT$lx
ex  <- LT$ex
ineq(age=age,method = "iqr")
ineq(age=age,ax=ax,dx=dx,lx=lx,ex=ex, method = "iqr")



# -----------------------
# once-off setup of testhat

library(usethis)
use_testthat()
use_test("indices")
