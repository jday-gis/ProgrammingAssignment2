#   R Programming

## Put comments here that give an overall description of what your
## functions do
# makeCacheMatric : Creates a matrix object that can also compute its inverse 
# cacheSolve      : Return the inverse of a mtrix either from Cache or compute and cache it 


## Write a short comment describing this function
# Create a matrix object that can also retun its inverse
makeCacheMatrix <- function(x = matrix()) {
  x.inv <- NULL
  set <- function(y) {
    x <<- y
  }
  get <- function() x
  get_inv <- function() x.inv
  set_inv <- function(x.inv) x.inv <<- solve(x)
  list(set = set, get = get, set_inv = set_inv, get_inv = get_inv)
}


## Write a short comment describing this function
# Check if the inverse variable exists in the global space and if not create it.
# The return the inverse matrix
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  if(!is.null(x$get_inv()))
  {
    message("getting cached data")
  } else
  {
    x$set_inv()
  }
  return(x$get_inv())
}


x <- matrix(c(1,2,1,3,8,4,5,3,9),nrow=3)

y <- makeCacheMatrix(x)


y$get()


cacheSolve(y)

y$get_inv()
y$set_inv()

solve(y$get())

