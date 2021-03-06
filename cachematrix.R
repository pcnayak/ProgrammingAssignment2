## Put comments here that give an overall description of what your
## functions do

## Creates a new matrix with the value provided.

makeCacheMatrix <- function(x = matrix()) {
cache <- NULL
  setMatrix <- function(newValue) {
    x <<- newValue
    cache <<- NULL
  }
  getMatrix <- function() x
  setInverse <- function(solve) cache <<- solve
  getInverse <- function() cache
  list(setMatrix = setMatrix,
       getMatrix = getMatrix,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Checks if the cache version is available and returns the data. Otherwise call the getMatrix function to get the matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
          m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$getMatrix()
  m <- solve(data)
  x$setInverse(m)
  m
}
