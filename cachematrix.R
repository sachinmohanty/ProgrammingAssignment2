## This function creates a special "matrix" object that can cache its inverse.
## The function creates a special matrix , which is really a list containing a function to
## 1. Set the matrix
## 2. Get the matrix
## 3. Set the Inverse
## 4. Get the Inverse
makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
        set <- function(y) {
               x <<- y
               m <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) m <<- inverse
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## 
cacheSolve <- function(x, ...) {
      m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        ##Computing the inverse 
        data <- x$get()
        m <- solve(mat, ...)
        x$setinv(m)
        m
        ## Return a matrix that is the inverse of 'x'
}
