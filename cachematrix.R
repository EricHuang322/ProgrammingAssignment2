## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
              m <- NULL

    ## Set the elements of the matrix
              set <- function(y) {
                       x <<- y
                       m <<- NULL
              }

    ## Get the elements of the matrix
              get <- function() x

    ## Set the inverse of the matrix
              setinverse <- function(solve) m <<- solve

    ## Get the inverse of the matrix
              getinverse <- function() m
              list(set = set, get = get,
                   setinverse = setinverse,
                   getinverse = getinverse)
}


## Write a short comment describing this function

    ## First, check whether the inverse of the matrix has been calculated.
    ## If so, a message "getting cached matrix" will appear, and the program 
    ## will skip the computation and get the inverse matrix directly from 
    ## the cache.
cacheSolve <- function(x, ...) {
         m <- x$getinverse()
         if(!is.null(m)) {
                message("getting cached matrix")
                return(m)
         }

    ## On the other hand, if the inverse has not been calculated, the program
    ## will calculate the inverse matrix first, and then save it into the 
    ## cache via "setinverse" function.
         matrix <- x$get()
         m <- solve(matrix, ...)
         x$setinverse(m)
         m
        ## Return a matrix that is the inverse of 'x'
}
