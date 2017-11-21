## Put comments here that give an overall description of what your
## functions do

# Computing the inverse of a square matrix can be done with the `solve`
# function in R. For example, if `X` is a square invertible matrix, then
# `solve(X)` returns its inverse.
# The first function, `makeVector` creates a special "vector", which is
# really a list containing a function to

# makeVector <- function(x = numeric()) {
#   m <- NULL
#   set <- function(y) {
#     x <<- y
#     m <<- NULL
#   }
#   get <- function() x
#   setmean <- function(mean) m <<- mean
#   getmean <- function() m
#   list(set = set, get = get,
#        setmean = setmean,
#        getmean = getmean)
# }
# 
# The following function calculates the mean of the special "vector"
# created with the above function. However, it first checks to see if the
# mean has already been calculated. If so, it `get`s the mean from the
# cache and skips the computation. Otherwise, it calculates the mean of
# the data and sets the value of the mean in the cache via the `setmean`
# function.
# 
# cachemean <- function(x, ...) {
#   m <- x$getmean()
#   if(!is.null(m)) {
#     message("getting cached data")
#     return(m)
#   }
#   data <- x$get()
#   m <- mean(data, ...)
#   x$setmean(m)
#   m
# }

## function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

  xInverse <- NULL
  
  Set <- function(y){
    x <<- y
    xInverse <<- NULL
  }
  
  Get <- function() x
  
  SetInverse <- function(inverse) xInverse <<- inverse
  GetInverse <- function() xInverse
  
  list(set=Set, get=Get, setinverse=SetInverse, getinverse=GetInverse)
}


## This function computes the inverse of the special
# "matrix" returned by `makeCacheMatrix` above. If the inverse has
# already been calculated (and the matrix has not changed), then
# `cacheSolve` should retrieve the inverse from the cache.

# 1. check if inverse has already been calculated
# 2. check if the inverse has unchanged
#   if both are yes, return the inverse of the cashed matrix
#   else return "no cashed value"



cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  xInv <- x$getinverse
  
  if (!is.null(xInv)){
    message("Getting cashed data")
    return(xInv)
  }
  xData <- x$get()
  xInv <- solve(data)
  x$setinverse(xInv)
  xInv
}
