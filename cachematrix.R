## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse
## creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
  set <- function(y) {
    ##savecache
    x <<- y
    m <<- NULL
  }
  get <- function() x
  ##savecache
  setinverse <- function(inverse) m <<- inverse
  ##getcache
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## if the inverse exist in the cache then pull it out or cauculate it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- sovle(data)
  x$setinverse(m)
  m
}
