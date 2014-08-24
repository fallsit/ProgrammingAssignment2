
##I write a pair of functions that cache the inverse of a matrix.

##The first function, makeCacheMatrix creates a special "matrix", which is really a matrix containing a function to 
##1.set the value of the matrix
##2.get the value of the matrix
##3.set the value of the inverse of a matrix
##4.get the value of the inverse of a matrix



makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
            m <<- NULL
         }
      get <- function() x
      setsolve <- function(solve) m <<- solve
      getsolve <- function() m
      list(set = set, get = get,
      setsolve= setsolve,
      getsolve= getsolve)

}


##The following function calculates the inverse of the "matrix" created with the above function. 
##It first checks to see if the inverse of the matrix has already been calculated. 
##If so, it gets the inverse of the matrix from the cache and skips the computation. 
##Otherwise, it calculates the inverse of the matrix of the data and sets the value of the inverse off matrix in the cache via the setsolve function.

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
