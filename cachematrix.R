## #################################################################
## Matrix inversion is usually computationally expensive. Therefore,
## there may be some gain in caching the inverse of a matrix rather  
## than computing it repeatedly. 
## #################################################################

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

# EOF