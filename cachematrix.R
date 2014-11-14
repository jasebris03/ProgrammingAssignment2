## Set of caching functions specificially to cache the usually computationally intense exercise
## of inversing a matrix


## the matrix-caching object constructor
## can take in a matrix upon constructing, or can set it later with $set

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## example function to show how to use the above matrix-caching object

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
