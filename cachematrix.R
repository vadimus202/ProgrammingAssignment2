# Matrix inversion is usually a costly computation and there may be some benefit to 
# caching the inverse of a matrix rather than computing it repeatedly. 
# This codes defines a pair of functions that cache the inverse of a matrix.


# The first function, makeCacheMatrix() creates a special "matrix" object
# that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    
    # define a list of four functions
    
    # 1. set the value of the matrix
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    
    # 2. get the value of the matrix
    get <- function() x
    
    # 3. set the value of the inverse
    setInverse <- function(solve) s <<- solve
    
    # 4. get the value of the inverse
    getInverse <- function() s
    
    list(set = set, 
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


# This function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above. If the inverse has already been calculated 
# (and the matrix has not changed), then cacheSolve retrieves 
# the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    # check if the object contains a cache of an inverse
    s <- x$getInverse()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    
    # if cache not found, perform inverse calculation
    data <- x$get()
    s <- solve(data, ...)
    x$setInverse(s)
    s
}



