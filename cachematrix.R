###################################################################
# DESCRIPTION
# Routine to compute the inverse of a matrix and retrieve the 
# inverse from cache
#
# Written by: Felipe J Colón-González (2015)
# For any problems with this code, please contact f.colon@uea.ac.uk
# 
###################################################################

# JUSTIFICATION
# Matrix inversion is usually computationally expensive. Therefore,
# there may be some gain in caching the inverse of a matrix rather  
# than computing it repeatedly. 

# This script contains TWO functions

# The first function, "makeCacheMatrix" creates a special matrix  
# object, that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
       Inv <- NULL
       set <- function(y) {
              x <<- y
              inv <<- NULL
       }
       get <- function() x
       setInv <- function(inverse) Inv <<- inverse 
       getInv <- function() Inv
       list(set=set, get=get, setInv=setInv, getInv=getInv)
}


# The second function "cacheSolve" computes the inverse of the special 
# matrix returned by "makeCacheMatrix". If the inverse has already been 
# calculated, and the matrix has not changed, then this function should  
# retrieve its inverse from the cache.

cacheSolve <- function(x, ...) {
       Inv <- x$getInv()
       if (!is.null(Inv)){
              message("Getting cached data")
              return(Inv)
       }
       mat.data <- x$get()
       Inv <- solve(mat.data, ...)
       x$setInv(Inv)
       return(Inv)
}

# NOT TO RUN
# Test the script:
# mymatrix <- matrix(1:4,2,2)
# matCache <- makeCacheMatrix(mymatrix)

# Get matrix
# matCache$get()
#       [,1]   [,2]
# [1,]    1      3
# [2,]    2      4

# Get inverse of matrix (not from cache)
# cacheSolve(matCache)
#      [,1]    [,2]
# [1,]   -2     1.5
# [2,]    1    -0.5

# Get inverse of matrix (from cache)
# cacheSolve(matCache)
# Getting cached data
#      [,1]    [,2]
# [1,]   -2     1.5
# [2,]    1    -0.5

# EOF