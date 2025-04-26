## These functions cache the inverse of a matrix to save computational resources by avoiding 
## repeated calculations of the inverse.

This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

}

 inv <- NULL # Initialize the variable to store the inverse of the matrix

 ## Function to set the value of the matrix
  set <- function(y) {
    x <<- y  # Assign the new matrix value to the parent environment
    inv <<- NULL  # Reset the inverse value if the matrix changes
  }

## Function to get the value of the matrix
  get <- function() {
    return(x)  # Return the matrix

          
## Function to set the cached value of the inverse
  setInverse <- function(inverse) {
    inv <<- inverse  # Cache the computed inverse
  }

      ## Function to get the cached inverse of the matrix
  getInverse <- function() {
    return(inv)  # Return the cached inverse
  }
  
  ## Return a list of the functions to set/get matrix and its inverse
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## This function computes the inverse of the special "matrix" object created by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed), 
## it retrieves the inverse from the cache.     
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

 ## Check if the inverse is already cached
  inv <- x$getInverse()
  
  ## If the inverse is already cached, return it with a message
  if(!is.null(inv)) {
    message("Getting cached data.")  # Inform the user that cached data is being used
    return(inv)


        ## If the inverse is not cached, calculate it
  mat <- x$get()  # Get the matrix from the special matrix object
  inv <- solve(mat, ...)  # Compute the inverse of the matrix
  
  ## Cache the computed inverse
  x$setInverse(inv)
  
  ## Return the computed inverse
  inv
}   
