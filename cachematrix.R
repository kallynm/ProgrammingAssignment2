## creates a matrix that can cache its inverse

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- 
    solve
  getsolve <- function() m
  list(set = set,          # gives the name 'set' to the set() function defined above
       get = get,          # gives the name 'get' to the get() function defined above
       setsolve = setsolve,  # gives the name 'setmean' to the setmean() function defined above
       getsolve = getsolve)  # gives the name 'getmean' to the getmean() function defined above
  #example: aMatrix <- makeMatrix(1:10)
  #aMatrix$get()                retrieve the value of x
  #aMatrix$getsolve()           retrieve the value of m, which should be NULL
  
  #cacheinverse(aMatrix)           notice mean calculated is mean of 30:50, not 1:10
  #aMatrix$getsolve()            retrieve it directly, now that it has been cached

}


## computes inverse

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
